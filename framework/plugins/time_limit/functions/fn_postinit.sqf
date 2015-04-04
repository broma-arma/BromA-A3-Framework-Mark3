
if (!isServer) exitWith {};

if (mission_time_limit == -1) exitWith {};

0 spawn {

    #include "includes\settings.sqf"

    _countdown = mission_time_limit;

    waitUntil {
        sleep 1; 
        _countdown = (_countdown - 1);
        _countdownminutes = floor(_countdown / 60);

        if (_countdownminutes in time_alerted_minutes) then {    
            ["CLIENTS", "HINT", format ["%1 minutes remaining in the mission!", _countdownminutes]] call BRM_fnc_doLog;
        };

        if (_countdown <= 10) then {
            ["CLIENTS", "HINT", format ["%1 seconds remaining in the mission!", _countdown]] call BRM_fnc_doLog;
        };

    (_countdown <= 0) };

    ["Timer",["Time's up!"]] call bis_fnc_showNotification;

    if (mission_game_mode == "COOP") then {
        ["defeat"] call BRM_fnc_callEnding;
    } else {
        ["side_a_defeat"] call BRM_fnc_callEnding;
    };

};