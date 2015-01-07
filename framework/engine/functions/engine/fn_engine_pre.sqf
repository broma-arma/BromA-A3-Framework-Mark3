#define LOADED_PLUGINS (missionConfigFile >> "CfgPlugins")

ENGINE_plugins = [];
ENGINE_preinits = [];
ENGINE_postinits = [];

for "_i" from 0 to ((count LOADED_PLUGINS) - 1) do {
    private ["_plugin","_preinit","_postinit"];
    _plugin = configName(LOADED_PLUGINS select _i);
    _preinit = getText((missionConfigFile >> "CfgPlugins") >> _plugin >> "preinit");
    _postinit = getText((missionConfigFile >> "CfgPlugins") >> _plugin >> "postinit");
    
    if (_preinit != "") then { ENGINE_preinits set [count ENGINE_preinits, LOADED_PLUGINS select _i] };
    if (_postinit != "") then { ENGINE_postinits set [count ENGINE_postinits, LOADED_PLUGINS select _i] };
    
    ENGINE_plugins set [count ENGINE_plugins, LOADED_PLUGINS select _i];
};

[ENGINE_preinits] call BRM_fnc_loadPlugins;