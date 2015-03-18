/*
================================================================================

NAME:
    BRM_fnc_defineGroups
    
AUTHOR(s):
    Nife

DESCRIPTION:
    Server-side script that assigns proper callsigns and identification
    to all units and groups.

PARAMETERS:
    None.
    
USAGE:
    [] call BRM_fnc_defineGroups
    
RETURNS:
    Nothing.

================================================================================
*/

if (!isServer) exitWith {};

waitUntil{(!isNil "mission_settings_loaded")};
waitUntil{(mission_settings_loaded)};

mission_groups_init = false; publicVariable "mission_groups_init";

private["_unitstoCheck"];

if (isMultiplayer) then { _unitstoCheck = playableUnits } else { _unitstoCheck = allUnits };

{
    _unitInit = _x getVariable ["unitInit", ["skip"]];
    _find = [str(_x), "_"] call CBA_fnc_find;
    
    if ( ((_unitInit select 0) != "skip") && (_find > -1)) then {
        _aliasAUTO = ["*","AUTO","ANY"];
        
        _role = _unitInit select 2;
        _groupName = _unitInit select 3;
        _unitName = [str(_x), "_"] call CBA_fnc_split;
        
        _newGroup = (_unitName select 0) + "_" + (_unitName select 1) + "_" +  (_unitName select 2);
        
        call compile format ["%1 = group _x; publicVariable '%1'", _newGroup];
        
        if (toUpper(_role) in _aliasAUTO) then {
            _role = getText (configfile >> "CfgVehicles" >> (typeOf _x) >> "displayName");
        };
        
        [_x, _groupName, _role] call BRM_fnc_setAlias;
    };
} forEach _unitstoCheck;

mission_groups_init = true; publicVariable "mission_groups_init";