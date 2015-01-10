#define LOADED_PLUGINS (missionConfigFile >> "CfgPlugins")

ENGINE_plugins = [];
ENGINE_preinits = [];
ENGINE_postinits = [];
usedPlugins = [];

for "_i" from 0 to ((count LOADED_PLUGINS) - 1) do {
    private ["_plugin","_preinit","_postinit"];
    _plugin = configName(LOADED_PLUGINS select _i);
    _preinit = getText((missionConfigFile >> "CfgPlugins") >> _plugin >> "preinit");
    _postinit = getText((missionConfigFile >> "CfgPlugins") >> _plugin >> "postinit");
    
    if (_preinit != "") then { ENGINE_preinits set [count ENGINE_preinits, LOADED_PLUGINS select _i] };
    if (_postinit != "") then { ENGINE_postinits set [count ENGINE_postinits, LOADED_PLUGINS select _i] };
    
    ENGINE_plugins set [count ENGINE_plugins, LOADED_PLUGINS select _i];
};

{
    _plugin = configName(_x);
    _path = (missionConfigFile >> "CfgPlugins" >> _plugin);
    _name = getText( _path >> "name");
    _version = str(getNumber( _path >> "version"));
    _authors = str(getArray( _path >> "authors"));
    _preinit = getText( _path >> "preinit");
    _postinit = getText( _path >> "postinit");
    _depedencies = getArray( _path >> "dependencies");
    _environment = toUpper(getText( _path >> "environment"));
    
    if ((_environment == "server")&&(!isServer)) exitWith {};
    
    [_preinit,_postinit,_depedencies,_plugin,_environment] spawn {
        _preinit = _this select 0;
        _postinit = _this select 1;
        _deps = _this select 2;
        _plugin = _this select 3;
        _env = _this select 4;
        
        waitUntil{([_deps] call BRM_fnc_getDep)};
        
        diag_log format["== %1 LOADED PLUGIN: %2 ==============================",_env, _plugin];
        
        usedPlugins pushBack _plugin;
        
        if (_preinit != "") then { [] execVM format ["framework\plugins\%1\%2", _plugin, _preinit] };
        if (_postinit != "") then { [] execVM format ["framework\plugins\%1\%2", _plugin, _postinit] };    
    };
} forEach (_this select 0);