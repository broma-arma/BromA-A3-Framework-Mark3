/*
================================================================================

NAME:
    BRM_fnc_endLoading
    
AUTHOR(s):
    Nife

DESCRIPTION:
    Marks the ending of the loading of the Framework and writes the 
    initialization time to the local log.
    Also calls surrogate initializations for those who are used to the old style
    of initializing scripts and disables randomization in civilians.

PARAMETERS:
    None.
    
USAGE:
    [] call BRM_fnc_endLoading
    
RETURNS:
    Nothing.

================================================================================
*/

// Calls surrogate initServer.sqf to the server only. ==========================

if (isServer) then { mission_init_server = [] execVM "mission\custom-scripts\initServer.sqf" };

// Calls surrogate initPlayer.sqf to players only. =============================

if (hasInterface) then { mission_init_player = [] execVM "mission\custom-scripts\initPlayer.sqf" };

// Calls surrogate init.sqf to both. ===========================================

mission_init = [] execVM "mission\custom-scripts\init.sqf";

// Stops civilian randomized gear. =============================================

{ if (side _x == civilian) then { _x setVariable ["BIS_enableRandomization", false] } } forEach allUnits;

// Calculates the loading time and logs it. ====================================

framework_init_time = (diag_tickTime - startTime);

["LOCAL", "LOG", "=========================================================================================================="] call BRM_fnc_doLog;
["LOCAL", "F_LOG", format ["BROMA FRAMEWORK INITIALIZED SUCCESSFULLY IN %1 SECONDS.", framework_init_time]] call BRM_fnc_doLog;
["LOCAL", "LOG", "=========================================================================================================="] call BRM_fnc_doLog;