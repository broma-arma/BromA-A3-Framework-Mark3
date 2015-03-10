#define LOADED_PLUGINS (missionConfigFile >> "CfgPlugins")

ENGINE_plugins = [];
ENGINE_preinits = [];
ENGINE_postinits = [];
usedPlugins = [];

framework_version = call compile preprocessFile "framework\version.txt";

for "_i" from 0 to ((count LOADED_PLUGINS) - 1) do {
    private ["_plugin","_preinit","_postinit"];
    _plugin = configName(LOADED_PLUGINS select _i);
    _preinit = getText((missionConfigFile >> "CfgPlugins") >> _plugin >> "preinit");
    _postinit = getText((missionConfigFile >> "CfgPlugins") >> _plugin >> "postinit");
    
    usedPlugins pushBack _plugin;
    
    if (_preinit != "") then { ENGINE_preinits pushBack (LOADED_PLUGINS select _i) };
    if (_postinit != "") then { ENGINE_postinits pushBack (LOADED_PLUGINS select _i) };
    
    ENGINE_plugins pushBack (LOADED_PLUGINS select _i);
};