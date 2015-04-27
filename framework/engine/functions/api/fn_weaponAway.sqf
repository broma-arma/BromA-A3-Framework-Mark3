/*
================================================================================

NAME:
    BRM_fnc_weaponAway
    
AUTHOR(s):
    commy2

DESCRIPTION:
    The unit will put its current weapon away.

PARAMETERS:
    0 - What unit should put the current weapon on back? (OBJECT)
    
USAGE:
    [player] call BRM_fnc_weaponAway
    
RETURNS:
    Nothing.

================================================================================
*/

_unit = _this select 0;
_vehicle = vehicle _unit;

_unit action ["SwitchWeapon", _vehicle, _vehicle, 99];