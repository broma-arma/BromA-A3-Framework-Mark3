/*
================================================================================

NAME:
    BRM_fnc_setGrpIDGlobal
    
AUTHOR(s):
    Nife

DESCRIPTION:
    Changes a group's ID globally.

PARAMETERS:
    0 - Group (GROUP)
    1 - ID (STRING)
    
USAGE:
    [group player, "Assassin"] call BRM_fnc_setGrpIDGlobal
    
RETURNS:
    Nothing.

================================================================================
*/

(_this select 0) setGroupId [_this select 1];