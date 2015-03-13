{
    _plugin = configName(_x);
    _path = (missionConfigFile >> "CfgPlugins" >> _plugin);
    _name = getText( _path >> "name");
    _version = str(getNumber( _path >> "version"));
    _authors = str(getArray( _path >> "authors"));
    _preinit = getText( _path >> "preinit");
    _postinit = getText( _path >> "postinit");
    _dependencies = getArray( _path >> "conditions");
    _environment = toUpper(getText( _path >> "user"));
    _time = (_this select 1);
    
    _loadplugin = true;
    
    if ((_environment == "SERVER")&&(!isServer)) then { _loadplugin = false };
    if ((_environment == "CLIENT")&&(!hasInterface)) then { _loadplugin = false };
    
    if (_loadplugin) then {
        [_preinit,_postinit,_dependencies,_plugin,_environment, _time] spawn {
            waitUntil{!isNil "mission_groups_init"};
            waitUntil{(mission_groups_init)};
                
            _preinit = _this select 0;
            _postinit = _this select 1;
            _deps = _this select 2;
            _plugin = _this select 3;
            _env = _this select 4;
            _time = _this select 5;

            waitUntil{([_deps] call BRM_fnc_getDep)};

            ["LOCAL", "F_LOG", format["%1 LOADED PLUGIN: %2",_env, _plugin]] call BRM_fnc_doLog;
            
            _path = "framework\plugins\"+_plugin+"\";
            
            _scriptname = "plugin_" + _plugin;
            
            switch (toUpper(_time)) do {
                case "PRE": {
                    _scriptpre = _scriptname + "_pre";    
                    _prepath = format ["framework\plugins\%1\%2", _plugin, _preinit];
                    call compile format ["if (_preinit != '') then { %2 = [_path] execVM '%1' }", _prepath, _scriptpre];
                };
                case "POST": {
                    _scriptpost = _scriptname + "_post";
                    _postpath = format ["framework\plugins\%1\%2", _plugin, _postinit];
                    call compile format ["if (_postinit != '') then { %2 = [_path] execVM '%1' }", _postpath, _scriptpost];
                };
            };
        };
    };
} forEach (_this select 0);