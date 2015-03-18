/*
================================================================================

NAME:
    BRM_fnc_unitFromName
    
AUTHOR(s):
    Nife

DESCRIPTION:
    Gets a unit's object from its name.
    
PARAMETERS:
    0 - Name (STRING)

USAGE:
    ["Nife"] call BRM_fnc_unitFromName
    
RETURNS:
    Unit (OBJECT)

================================================================================
*/

_ret = objNull;

{ if (name _x == _this select 0) exitWith { _ret = _x } } forEach allUnits;

_ret