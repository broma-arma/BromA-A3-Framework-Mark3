
if (!isServer) exitWith {};

private ["_victoryText","_victory"];

_result = [];

_AVictory = {
    _result set [1, "AlertBLU"];
    match_points_a = match_points_a + 1;
    publicVariable "match_points_a";

    ["LOCAL", "CHAT", "BLUFOR victory.", ROUND_SYSTEM_DEBUG] call BRM_fnc_doLog;

    _victory = [win_messages_a call BIS_fnc_selectRandom, side_a_name];
};

_BVictory = {
    _result set [1, "AlertOP"];
    match_points_b = match_points_b + 1;
    publicVariable "match_points_b";

    ["LOCAL", "CHAT", "OPFOR victory.", ROUND_SYSTEM_DEBUG] call BRM_fnc_doLog;

    _victory = [win_messages_b call BIS_fnc_selectRandom, side_b_name];
};

_CVictory = {
    _result set [1, "AlertIND"];
    match_points_c = match_points_c + 1;
    publicVariable "match_points_c";

    ["LOCAL", "CHAT", "INDFOR victory.", ROUND_SYSTEM_DEBUG] call BRM_fnc_doLog;

    _victory = [win_messages_c call BIS_fnc_selectRandom, side_c_name];
};

_DrawVictory = {
    _result set [1, "Alert"];
    _victory = [draw_messages call BIS_fnc_selectRandom, ""];

    ["LOCAL", "CHAT", "Draw.", ROUND_SYSTEM_DEBUG] call BRM_fnc_doLog;
};

switch (round_end_reason) do {
    case "OBJECTIVE": {
        switch (true) do {
            case (call compile round_side_a_victory_con): { [] call _AVictory };
            case (call compile round_side_b_victory_con): { [] call _BVictory };
            case (call compile round_side_c_victory_con): { [] call _CVictory };
        };
    };
    case "DEATH": {
        switch (true) do {
            case (!(side_a_side in round_dead_sides)): { [] call _AVictory };
            case (!(side_b_side in round_dead_sides)): { [] call _BVictory };
            case (!(side_c_side in round_dead_sides)): { [] call _CVictory };
        };
    };
    case "TIME": {

        switch (typeName round_timeout_winner) do {
            case ("STRING"): {
                switch (round_timeout_winner) do {
                    case ("DRAW"): { [] call _DrawVictory };
                    case ("SCORE"): {
                        _Aunits = {(side _x == side_a_side)} count (allUnits);
                        _Bunits = {(side _x == side_b_side)} count (allUnits);
                        _Cunits = {(side _x == side_c_side)} count (allUnits);

                        if(_Aunits==0)then{_Aunits=1};if(_Bunits==0)then{_Bunits=1};if(_Cunits==0)then{_Cunits=1};

                        _percentA = floor ((100/_Aunits) * mission_dead_side_A);
                        _percentB = floor ((100/_Bunits) * mission_dead_side_B);
                        _percentC = floor ((100/_Cunits) * mission_dead_side_C);

                        ["LOCAL", "CHAT", format ["A: %1(%4) | B: %2(%5) | C: %3(%6)", _Aunits, _Bunits, _Cunits, _percentA, _percentB, _percentC], ROUND_SYSTEM_DEBUG] call BRM_fnc_doLog;

                        _lowest = [_percentA,_percentB,_percentC] call BIS_fnc_lowestNum;

                        if (_percentA == _percentB) then {
                            if ((_percentC == _lowest)&&(mission_enable_side_c)) then {
                                [] call _CVictory;
                            } else {
                                [] call _DrawVictory;
                            };
                        } else {
                            switch (true) do {
                                case (_percentA == _lowest): { [] call _AVictory };
                                case (_percentB == _lowest): { [] call _BVictory };
                                case ((_percentC == _lowest)&&(mission_enable_side_c)): { [] call _CVictory };
                                default { [] call _DrawVictory };
                            };
                        };
                    };
                };
            };
            case ("SIDE"): {
                switch (round_timeout_winner) do {
                    case (side_a_side): { [] call _AVictory };
                    case (side_b_side): { [] call _BVictory };
                    case (side_c_side): { [] call _CVictory };
                };
            };
        };
    };
};

switch (true) do {
    case (match_points_a >= BRM_round_system_rounds_needed): { match_ending_winner = ["side_a_victory"] };
    case (match_points_b >= BRM_round_system_rounds_needed): { match_ending_winner = ["side_b_victory"] };
    case (match_points_c >= BRM_round_system_rounds_needed): { match_ending_winner = ["side_c_victory"] };
};

_victoryText = format[_victory select 0, _victory select 1];
_result set [0, _victoryText];

_result

/*

{ if ((side _x == east)&&(random(100) > 50)) then { _x setDamage 1 } } forEach allUnits;

*/