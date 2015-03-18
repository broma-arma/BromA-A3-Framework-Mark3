/*
================================================================================

NAME:
    BRM_AGM_fnc_AGM_RevivePlayer
    
AUTHOR(s):
    Nife

DESCRIPTION:
    Revives a unit's AGM parameters.
    
PARAMETERS:
    0 - Player (OBJECT)

USAGE:
    [player] spawn BRM_AGM_fnc_AGM_RevivePlayer;
    
RETURNS:
    Nothing.

================================================================================
*/

_unit = _this select 0;

[_unit] call AGM_Medical_fnc_wakeUp;
[_unit, 0] call AGM_Medical_fnc_setDamage;

_unit switchMove "";
_unit setVariable ["AGM_isUnconscious", false, true];
_unit setVariable ["AGM_isBleeding", false, true];
_unit setVariable ["AGM_Blood", 100, true];
_unit setVariable ["AGM_Pain", 0, true];
_unit setVariable ["AGM_isOverdosing", false, true];