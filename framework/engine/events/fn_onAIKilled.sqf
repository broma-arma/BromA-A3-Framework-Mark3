
// ============================================================================
//                                                                             |
//     EVENT SCRIPT: Executes whenever an AI unit is killed.                   |
//                                                                             |
// ============================================================================

_unit = _this select 0;
_killer = _this select 1;

_var = (_unit getVariable "evented");
if (!isNil "_var") exitWith {};
_unit setVariable ["evented",true];

if ("f_remove_body" in usedPlugins) then {
    _unit spawn f_remove_body_fnc_removeBody;
};

[_unit, _killer] call BRM_fnc_handleScore;
