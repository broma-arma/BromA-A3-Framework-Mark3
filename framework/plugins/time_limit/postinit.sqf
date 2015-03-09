
// =============================================================================
//  Time limit parameter
// =============================================================================

waitUntil{!isNil"param_time_limit"};

switch (param_time_limit) do {
    case 0: { mission_time_limit = -1 };
    case 1: { mission_time_limit = 10800 };
    case 2: { mission_time_limit = 7200 };
    case 3: { mission_time_limit = 3600 };
    case 4: { mission_time_limit = 2700 };
    case 5: { mission_time_limit = 1800 };
    case 6: { mission_time_limit = 900 };
    case 7: { mission_time_limit = 600 };
    case 8: { mission_time_limit = 65 };
};
publicvariable "mission_time_limit";

// =============================================================================

if (mission_time_limit == -1) exitWith {};

#include "settings.sqf"

_countdown = mission_time_limit;

waitUntil {
    sleep 1; 
    _countdown = (_countdown - 1);
    _countdownminutes = floor(_countdown / 60);
    
    if (_countdownminutes in time_alerted_minutes) then {    
        ["CLIENT", "HINT", format ["%1 minutes remaining in the mission!", _countdownminutes]] call BRM_fnc_doLog;
    };
    
    if (_countdown <= 10) then {
        ["CLIENT", "HINT", format ["%1 seconds remaining in the mission!", _countdown]] call BRM_fnc_doLog;
    };
    
(_countdown <= 0) };

["Timer",["Time's up!"]] call bis_fnc_showNotification;

["defeat"] call BRM_fnc_callEnding;