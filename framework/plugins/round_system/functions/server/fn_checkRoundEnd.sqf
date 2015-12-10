
if (!isServer) exitWith {};

{ round_alerted_minutes set [_forEachIndex, (round_alerted_minutes select _forEachIndex) * 60] } forEach round_alerted_minutes;

mission_countdown = BRM_round_system_time_limit;

["LOCAL", "CHAT", "Initializing round condition check...", ROUND_SYSTEM_DEBUG] call BRM_fnc_doLog;

waitUntil {
    mission_countdown = (mission_countdown - 1);
    mission_countdown_minutes = floor(mission_countdown / 60);

    if (mission_countdown in time_alerted_minutes) then {
        ["CLIENTS", "HINT", format ["%1 minutes remaining in the round!", mission_countdown_minutes]] call BRM_fnc_doLog;
    };

    if (mission_countdown <= 10) then {
        ["CLIENTS", "HINT", format ["%1 seconds remaining in the round!", mission_countdown]] call BRM_fnc_doLog;
    };

    sleep 1;

    (mission_countdown <= 0) ||
    (count round_dead_sides == (match_sides - 1)) ||
    call compile round_side_a_victory_con ||
    call compile round_side_b_victory_con ||
    call compile round_side_c_victory_con ||
    (round_over)
};

switch (true) do {
    case (mission_countdown <= 0): { round_end_reason = "TIME" };
    case ((count round_dead_sides == (match_sides - 1))): { round_end_reason = "DEATH" };
    case ((call compile round_side_a_victory_con) ||
          (call compile round_side_b_victory_con) ||
          (call compile round_side_c_victory_con)): { round_end_reason = "OBJECTIVE" };
};

["LOCAL", "CHAT", "Ending round condition check...", ROUND_SYSTEM_DEBUG] call BRM_fnc_doLog;

[] call BRM_Round_System_fnc_roundEnd;