
if (!isServer) exitWith {};

round_over = true;

round_winner_text = [] call BRM_Round_System_fnc_roundHandleResults;
publicVariable "round_winner_text";

if (count match_ending_winner > 0) then {

    mission_dead_side_A = cache_deaths_a;
    mission_dead_side_B = cache_deaths_b;
    mission_dead_side_C = cache_deaths_c;

    [match_ending_winner select 0] call BRM_fnc_callEnding;
} else {
    match_current_round = match_current_round + 1;
    publicVariable "match_current_round";

    [] call BRM_Round_System_fnc_resetRoundVariables;

    [-1, {
        [] call BRM_Round_System_fnc_roundEndPlayer;
        (_this) call BRM_Round_System_fnc_displayWinner;
    }, round_winner_text] call CBA_fnc_globalExecute;

    { deleteVehicle _x } count (allDead);

    ["LOCAL", "CHAT", "Waiting to begin new round...", ROUND_SYSTEM_DEBUG] call BRM_fnc_doLog;

    sleep round_seconds_between;

    [] spawn BRM_Round_System_fnc_roundStart;
    [-1, {[] call BRM_Round_System_fnc_roundStartPlayer}] call CBA_fnc_globalExecute;
};