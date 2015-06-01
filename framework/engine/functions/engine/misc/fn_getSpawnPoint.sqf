/*
================================================================================

NAME:
    BRM_fnc_getSpawnPoint
    
AUTHOR(s):
    Nife

DESCRIPTION:
    Returns the unit's respawn point based on its side.

PARAMETERS:
    0 - Unit (OBJECT)
    
USAGE:
    _myRespawn = [player] call BRM_fnc_getSpawnPoint
    
RETURNS:
    Respawn point name. (STRING)

================================================================================
*/

private["_ret"];

_unit = _this select 0;
_side = _unit getVariable ["unit_side", (side player)];

switch (_side) do {
    case WEST: { _ret = "respawn_west" };
    case EAST: { _ret = "respawn_east" };
    case RESISTANCE: { _ret = "respawn_resistance" };
    case CIVILIAN: { _ret = "respawn_civilian" };
};

_ret