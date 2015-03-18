/*
================================================================================

NAME:
    BRM_fnc_engine_pre
    
AUTHOR(s):
    Nife

DESCRIPTION:
    Starts loading the framework.

PARAMETERS:
    None.
    
USAGE:
    [] call BRM_fnc_engine_pre
    
RETURNS:
    Nothing.

================================================================================
*/

["LOCAL", "LOG", "=========================================================================================================="] call BRM_fnc_doLog;
_missionName = getText(missionConfigFile >> "Mission" >> "Mission" >> "Intel" >> "briefingName");
["LOCAL", "F_LOG", format ["STARTING MISSION '%1'", _missionName]] call BRM_fnc_doLog;
["LOCAL", "LOG", "=========================================================================================================="] call BRM_fnc_doLog;

startTime = diag_tickTime;