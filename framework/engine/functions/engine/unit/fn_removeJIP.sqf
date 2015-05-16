/*
================================================================================

NAME:
    BRM_fnc_removeJIP
    
AUTHOR(s):
    Nife

DESCRIPTION:
    Displays a message to any players who aren't allowed to Join in Progress.

PARAMETERS:
    0 - Player (OBJECT)
    
USAGE:
    [player] spawn BRM_fnc_removeJIP
    
RETURNS:
    Nothing.

================================================================================
*/

_unit = _this select 0;
if ("respawn_system" in usedPlugins) then {
    waitUntil{!isNil "BRM_RespawnSystem_fnc_killPlayer"};
    titletext ["This mission does not allow for joining in progress. \n\n You will be sent to spectator mode.", "BLACK FADED",0];
    sleep 5;
    [_unit] call BRM_RespawnSystem_fnc_killPlayer;
} else {
    _unit setdamage 1;
};