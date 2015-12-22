/*
================================================================================

NAME:
    BRM_fnc_handleScore

AUTHOR(s):
    Nife

DESCRIPTION:
    Adds or subtracts the proper score from a unit.

PARAMETERS:
    0 - Unit killed. (OBJECT)
    1 - Killer of said unit. (OBJECT)

USAGE:
    [player, myKiller] call BRM_fnc_handleScore

RETURNS:
    Nothing.

================================================================================
*/

private ["_killer"];

_unit = _this select 0;
_side = _unit getVariable ["unit_side", side _unit];

switch (_side) do {
    case WEST: { mission_dead_west = mission_dead_west + 1; publicVariable "mission_dead_west" };
    case EAST: { mission_dead_east = mission_dead_east + 1; publicVariable "mission_dead_east" };
    case RESISTANCE: { mission_dead_independent = mission_dead_independent + 1; publicVariable "mission_dead_independent" };
    case CIVILIAN: { mission_dead_civilian = mission_dead_civilian + 1; publicVariable "mission_dead_civilian" };
};

switch (true) do {
    case (_side == side_a_side): { mission_dead_side_A = mission_dead_side_A + 1; publicVariable "mission_dead_side_A" };
    case (_side == side_b_side): { mission_dead_side_B = mission_dead_side_B + 1; publicVariable "mission_dead_side_B" };
    case (_side == side_c_side): { mission_dead_side_C = mission_dead_side_C + 1; publicVariable "mission_dead_side_C" };
};

switch (mission_ACE3_enabled) do {
    case true: { _killer = _unit getVariable ["last_damage", _this select 1] };
    case false: { _killer = _this select 1 };
};

if !(_killer isKindOf "CAManBase") exitWith {};

_sideKiller = _killer getVariable ["unit_side", side _killer];
_killerScore = _killer getVariable ["unit_score", 0];

_findIndex = {
    _array = _this select 0;
    _target = _this select 1;
    _return = count _array;
    for "_i" from 0 to (count _array) do {
        if (((_array select _i) select 0) == _target) then { _return = _i };
    };
    _return
};

if ([_side, _sideKiller] call BIS_fnc_areFriendly) then {
    _index = [mission_unit_score, name _killer] call _findIndex;
    mission_unit_score set [_index, [name _killer, _sideKiller, _killerScore - 1]];
    publicVariable "mission_unit_score";
    _killer setVariable ["unit_score", _killerScore - 1, true];
} else {
    _index = [mission_unit_score, name _killer] call _findIndex;
    mission_unit_score set [_index, [name _killer, _sideKiller, _killerScore + 1]];
    publicVariable "mission_unit_score";
    _killer setVariable ["unit_score", _killerScore + 1, true];
};