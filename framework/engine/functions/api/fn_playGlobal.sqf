/*
================================================================================

NAME:
    BRM_fnc_playGlobal
    
AUTHOR(s):
    Nife

DESCRIPTION:
    Plays a track global to all players.

PARAMETERS:
    0 - Track. (STRING)
    
USAGE:
    ["LeadTrack01_F"] call BRM_fnc_playGlobal
    
RETURNS:
    Nothing.

================================================================================
*/

[-1,{playMusic _this},(_this select 0)] call CBA_fnc_globalExecute;