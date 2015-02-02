/*
 =============================================================================
 
                        Framework Function Library
                      
 These are some functions made by the Core Framework team to import objects
 from the Editor into the Headless Client, while still retaining important
                            data like waypoints.
                            
     I edited a few things to make it compatible with A3 but nothing major.
                            
                           Please don't sue me.
                            
 =============================================================================
*/

#define __objCfg(val,dft) ([_cfg >> val, dft] call core_fnc_getConfigValue)

/*
    Function: core_fnc_param
    Author(s): Naught
    Description:
            Selects a parameter from a parameter list.
    Parameters:
            0 - Parameter list [array]
            1 - Parameter selection index [number]
            2 - Type list [array] (optional)
            3 - Default value [any] (optional)
    Returns:
            Parameter [any]
*/

core_fnc_param = {
	private ["_list", "_index", "_typeList"];
	_list = _this select 0;
	_index = _this select 1;
	_typeList = if ((count _this) > 2) then {_this select 2} else {[]};
	
	if (isNil "_list") then {_list = []};
	if (typeName(_list) != "ARRAY") then {_list = [_list]};
	
	if (((count _list) > _index) && {((count _typeList) == 0) || {typeName(_list select _index) in _typeList}}) then {
		_list select _index; // Valid value
	} else {
		if ((count _this) > 2) then {
			_this select 3; // Default value
		} else {
			nil; // No valid matching value
		};
	};
};

/*
    Function: core_fnc_getConfigValue
    Author(s): Naught
    Description:
            Retrieves any config value.
    Parameters:
            0 - Config path [config]
            1 - Default value [any] (optional)
    Returns:
            Config value [any]
*/

core_fnc_getConfigValue = {
	private ["_cfg"];
	_cfg = _this select 0;
	
	switch (true) do {
		case (isText(_cfg)): {getText(_cfg)};
		case (isNumber(_cfg)): {getNumber(_cfg)};
		case (isArray(_cfg)): {getArray(_cfg)};
		case (isClass(_cfg)): {_cfg};
		default {[_this, 1, [], nil] call core_fnc_param};
	};
};

/*
    Function: hc_fnc_loadMissionObjects
    Author(s): Naught
    Description:
            Loads units from the Editor into the HC.
    Parameter:
            Nothing.
    Returns:
            Nothing.
*/

hc_fnc_loadMissionObjects = {
    private ["_groupsCfg"];
    _groupsCfg = missionConfigFile >> "Mission" >> "Mission" >> "Groups";
    for "_i" from 0 to ((count _groupsCfg) - 1) do {
        private ["_groupCfg"];
        _groupCfg = _groupsCfg select _i;
        if (isClass(_groupCfg)) then {
            [_groupCfg, {
                !isText(_this >> "player") &&
                {[_this >> "presence", 1] call core_fnc_getConfigValue == 0} &&
                {!(([_this >> "side", "EMPTY"] call core_fnc_getConfigValue) in ["EMPTY", "LOGIC", "AMBIENT LIFE"])}
            }] call core_fnc_spawnMissionGroup;
        };
    };
};

/*
    Function: core_fnc_fixMissionPos
    Author(s): Naught
    Description:
            Convert from mission.sqm position to game position.
            Flips Y and Z values.
    Parameter:
            Mission Position [array]
    Returns:
            Game Position [array]
*/

core_fnc_fixMissionPos = {
    [(_this select 0), (_this select 2), (_this select 1)]
};

/*
    Function: core_fnc_spawnMissionObject
    Author(s): Naught
    Description:
            Creates a mission object (from editor).
    Parameters:
            0 - Group [group]
            1 - Mission Object Config [config]
    Returns:
            Object [object]
    Notes:
            1. What doesn't work:
                    - Special "In Cargo"
                    - Any Info Age
                    - Ammo Levels
*/

core_fnc_spawnMissionObject = {
    private ["_group", "_cfg", "_object"];
    _group = _this select 0;
    _cfg = _this select 1;
    _object = objNull;

    if (__objCfg("side", "EMPTY") in ["EMPTY", "LOGIC"]) then { // Vehicle
        
        _object = createVehicle [
            __objCfg("vehicle", ""),
            (__objCfg("position", []) call core_fnc_fixMissionPos),
            [],
            __objCfg("placement", 0),
            __objCfg("special", "FORM")
        ];        
        
        _object call core_fnc_initObject;
        
    } else { // Unit
    
        private ["_object"];
        _object = _group createUnit [
            __objCfg("vehicle", ""),
            (__objCfg("position", []) call core_fnc_fixMissionPos),
            [],
            __objCfg("placement", 0),
            __objCfg("special", "FORM")
        ];
        
        _object call core_fnc_initObject;
    };

    _object
};

core_fnc_initObject = {
    _object = _this;
    
    if (isText(_cfg >> "text")) then {
        private ["_vehVarName"];
        _vehVarName = getText(_cfg >> "text");
        _object setVehicleVarName _vehVarName;
        core_mission_setVehicleVarName = [_object, _vehVarName];
        publicVariable "core_mission_setVehicleVarName";
        missionNamespace setVariable [_vehVarName, _object];
    };    
    
    _object setPos [getPos _object select 0, getPos _object select 1, 0 + __objCfg("offsetY", 0)];

    [-2, {
        _object = _this select 0;
        _object setDir (_this select 1);
        _object setSkill (_this select 2);
        _object setRank (_this select 3);
        _object setDamage (_this select 4);
        if (isText(_this select 5)) then {
            private ["_vehVarName"];
            _vehVarName = getText(_this select 5);
            _object setVehicleVarName _vehVarName;        
        };        
    }, [_object, __objCfg("azimut", 0), __objCfg("skill", 0.5), __objCfg("rank", "PRIVATE"), (1 - __objCfg("health", 1)), _cfg >> "text"]] call CBA_fnc_globalExecute;

    if (__objCfg("leader", 0) == 1) then {
        _group selectLeader _object;
    };

    this = _object;
    call compile __objCfg("init", "");
};

/*
    Function: core_fnc_addMissionWaypoint
    Author(s): Naught
    Description:
            Adds a mission waypoint (from editor).
    Parameters:
            0 - Group [group]
            1 - Mission Waypoint Config [config]
    Returns:
            Waypoint [array]
*/

core_fnc_addMissionWaypoint = {
    private ["_group", "_cfg", "_wpt"];
    _group = _this select 0;
    _cfg = _this select 1;

    _wpt = _group addWaypoint [
        (__objCfg("position", []) call core_fnc_fixMissionPos),
        __objCfg("placement", 0)
    ];

    _wpt setWaypointType __objCfg("type", "MOVE");
    _wpt setWaypointBehaviour __objCfg("combat", "UNCHANGED");
    _wpt setWaypointCombatMode __objCfg("combatMode", "NO CHANGE");
    _wpt setWaypointCompletionRadius __objCfg("completitionRadius", 5);
    _wpt setWaypointDescription __objCfg("description", "");
    _wpt setWaypointFormation __objCfg("formation", "NO CHANGE");
    _wpt setWaypointScript __objCfg("script", "");
    _wpt setWaypointSpeed __objCfg("speed", "UNCHANGED");
    _wpt setWaypointStatements [__objCfg("expCond", "true"), __objCfg("expActiv", "")];
    _wpt setWaypointTimeout [
        __objCfg("timeoutMin", 0),
        __objCfg("timeoutMid", 0),
        __objCfg("timeoutMax", 0)
    ];

    _wpt
};

/*
    Function: core_fnc_spawnMissionGroup
    Author(s): Naught
    Description:
            Creates and spawns a mission group (from editor).
    Parameters:
            0 - Mission Group Config [config]
            1 - Vehicle Spawn Condition [code] (optional)
    Returns:
            Group [group]
*/

core_fnc_spawnMissionGroup = {
    private ["_cfg", "_vehCond", "_side", "_group"];
    _cfg = _this select 0;
    _vehCond = [_this, 1, ["CODE"], {true}] call core_fnc_param;

    _side = switch (toLower(getText(_cfg >> "side"))) do {
        case "west": {west};
        case "east": {east};
        case "guer": {resistance};
        default {civilian};
    };

    _group = createGroup _side;

    // Spawn objects
    private ["_vehCfg"];
    _vehCfg = _cfg >> "Vehicles";

    for "_i" from 0 to ((count _vehCfg) - 1) do {
        private ["_objCfg"];
        _objCfg = _vehCfg select _i;

        if (isClass(_objCfg) && {_objCfg call _vehCond}) then {
                [_group, _objCfg] call core_fnc_spawnMissionObject;
        };
    };

    if ((count (units _group)) > 0) then {
        // Add start waypoint
        _group addWaypoint [getPos(leader _group), 0];
    };

    // Add other waypoints
    private ["_wptCfg"];
    _wptCfg = _cfg >> "Waypoints";

    if (isClass(_wptCfg)) then {
        for "_i" from 0 to ((count _wptCfg) - 1) do {
            private ["_wpt"];
            _wpt = _wptCfg select _i;

            if (isClass(_wpt)) then {
                [_group, _wpt] call core_fnc_addMissionWaypoint;
            };
        };
    };

    _group
};

"core_mission_setVehicleVarName" addPublicVariableEventHandler {
	private ["_val"];
	_val = _this select 1;
	(_val select 0) setVehicleVarName (_val select 1);
};