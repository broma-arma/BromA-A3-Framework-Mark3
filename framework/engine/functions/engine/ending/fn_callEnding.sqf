/*
================================================================================

NAME:
    BRM_fnc_callEnding
    
AUTHOR(s):
    Nife

DESCRIPTION:
    This function will effectively end the mission and call other ending events.

PARAMETERS:
    0 - Ending event that should be called (STRING)
    
USAGE:
    ["victory"] call BRM_fnc_callEnding
    
RETURNS:
    Nothing.

================================================================================
*/

// Ends the mission.

if (!mission_running) exitWith {};
mission_running = false; publicVariable "mission_running";

// Calls the event globally on both clients and server.

sleep 3;

[-2, {
    private["_ending","_stats","_showEnding","_success"];

    _ending = _this;
    
    if (isServer) then {
        // Server reads all mission-related ending cases.
        [_ending] call compile preprocessFile "mission\settings\endings.sqf";
        
        // Server processes all mission relevant stats.
        [] call BRM_fnc_endingGetStats;
    };
    // Players wait until server is finished.
    waitUntil{!isNil "mission_ending_details"};
    
    player allowDamage false;
    
    // Players get their own personal results according to the ending.
    [] call BRM_fnc_endingGetContext;

    // Display the ending screen if configured to.
    if (mission_ending_details select 2) then {
        _showEnding = [] spawn BRM_fnc_endingScreen;
        waitUntil{(scriptDone _showEnding)};
    };

    // Server waits before ending mission.
    if (isServer) then { sleep 3 };
    
    // Ends the mission to all players, taking in account winner status.
    [_ending, (mission_ending_personal select 0), true] spawn BIS_fnc_endMission;
    
}, _this select 0] call CBA_fnc_globalExecute;