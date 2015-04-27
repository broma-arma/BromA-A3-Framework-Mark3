/*
================================================================================

NAME:
    BRM_ACE_fnc_AGM_RevivePlayer
    
AUTHOR(s):
    Nife

DESCRIPTION:
    Revives a unit's ACE parameters.
    
PARAMETERS:
    0 - Player (OBJECT)

USAGE:
    [player] spawn BRM_ACE_fnc_ACE_RevivePlayer;
    
RETURNS:
    Nothing.

================================================================================
*/

_unit = _this select 0;

[_unit] call ACE_Medical_fnc_wakeUp;
[_unit, 0] call ACE_Medical_fnc_setDamage;

_unit switchMove "";
_unit setVariable ["ACE_isUnconscious", false, true];
_unit setVariable ["ACE_isBleeding", false, true];
_unit setVariable ["ACE_Blood", 100, true];
_unit setVariable ["ACE_Pain", 0, true];
_unit setVariable ["ACE_isOverdosing", false, true];