
if (!isServer) exitWith {};

if (mission_time_limit == -1) exitWith {};

{ time_alerted_minutes set [_forEachIndex, (time_alerted_minutes select _forEachIndex) * 60] } forEach time_alerted_minutes;

0 spawn {

    #include "includes\settings.sqf"

    mission_countdown = mission_time_limit;

    waitUntil {
        sleep 1; 
        mission_countdown = (mission_countdown - 1);
        mission_countdown_minutes = floor(mission_countdown / 60);

        if (mission_countdown in time_alerted_minutes) then {    
            ["CLIENTS", "HINT", format ["%1 minutes remaining in the mission!", mission_countdown_minutes]] call BRM_fnc_doLog;
        };

        if (mission_countdown <= 10) then {
            ["CLIENTS", "HINT", format ["%1 seconds remaining in the mission!", mission_countdown]] call BRM_fnc_doLog;
        };

    (mission_countdown <= 0) };

    ["Timer",["Time's up!"]] call BIS_fnc_showNotification;

    if (mission_game_mode == "COOP") then {
        ["defeat"] call BRM_fnc_callEnding;
    } else {
        ["side_a_defeat"] call BRM_fnc_callEnding;
    };

};