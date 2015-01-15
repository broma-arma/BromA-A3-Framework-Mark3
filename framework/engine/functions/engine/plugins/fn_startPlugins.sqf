{
    _plugin = configName(_x);
    _path = (missionConfigFile >> "CfgPlugins" >> _plugin);
    _name = getText( _path >> "name");
    _version = str(getNumber( _path >> "version"));
    _authors = str(getArray( _path >> "authors"));
    _preinit = getText( _path >> "preinit");
    _postinit = getText( _path >> "postinit");
    _dependencies = getArray( _path >> "dependencies");
    _environment = toUpper(getText( _path >> "environment"));
    
    _loadplugin = true;
    
    if ((_environment == "SERVER")&&(!isServer)) then { _loadplugin = false };
    if ((_environment == "CLIENT")&&(isDedicated)) then { _loadplugin = false };
    
    if (_loadplugin) then {
        [_preinit,_postinit,_dependencies,_plugin,_environment] spawn {
            _preinit = _this select 0;
            _postinit = _this select 1;
            _deps = _this select 2;
            _plugin = _this select 3;
            _env = _this select 4;

            waitUntil{([_deps] call BRM_fnc_getDep)};

            diag_log format["== %1 LOADED PLUGIN: %2 ==============================",_env, _plugin];

            usedPlugins pushBack _plugin;
            
            _path = "framework\plugins\"+_plugin+"\";

            if (_preinit != "") then { [_path] execVM format ["framework\plugins\%1\%2", _plugin, _preinit] };
            if (_postinit != "") then { [_path] execVM format ["framework\plugins\%1\%2", _plugin, _postinit] };    
        };
    };
} forEach (_this select 0);