if (mission_time_limit == -1) exitWith {};

#include "settings.sqf"

_countdown = mission_time_limit;

waitUntil {
    sleep 1; 
    _countdown = (_countdown - 1);
    _countdownminutes = (_countdown / 60);
    
    hint format ["%1 and %2", _countdown, _countdownminutes];
    
    if (_countdownminutes in time_alerted_minutes) then {    
        [-1, {
            hintSilent format ["%1 minutes remaining in the mission!", _this];
        }, _countdownminutes] call CBA_fnc_globalExecute;
    };
    
    if (_countdown <= 10) then {
        [-1, {
            hintSilent format ["%1 seconds remaining in the mission!", _this];
        }, _countdown] call CBA_fnc_globalExecute;    
    };
    
(_countdown <= 0) };

["defeat"] call BRM_fnc_callEnding;