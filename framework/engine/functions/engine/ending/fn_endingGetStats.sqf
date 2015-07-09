/*
================================================================================

NAME:
    BRM_fnc_endingGetStats
    
AUTHOR(s):
    Nife

DESCRIPTION:
    Here we calculate the number of deaths in the mission in a percentage:
    depending on how many players died for each side. The "margin" variable
    will be change accordingly to reflect the winner and for how much.

PARAMETERS:
    None.
    
USAGE:
    [] call BRM_fnc_endingGetStats;
    
RETURNS:
    Nothing.

================================================================================
*/

private["_units"];

if (isMultiplayer) then {
    _units = playableUnits;
} else {
    _units = switchableUnits;
};

_countplayersA = (count mission_players_A); if (_countplayersA == 0) then { _countplayersA = 1 };
_countplayersB = (count mission_players_B); if (_countplayersB == 0) then { _countplayersB = 1 };
_countplayersC = (count mission_players_C); if (_countplayersC == 0) then { _countplayersC = 1 };

_percentA = floor ((100/_countplayersA) * mission_dead_side_A);
_percentB = floor ((100/_countplayersB) * mission_dead_side_B);
_percentC = floor ((100/_countplayersC) * mission_dead_side_C);

// ["LOCAL", "CHAT", format["COUNT A: %5 deaths out of %1 | %2 PCENT / COUNT B: %6 deaths out of %3 | %4 PCENT", _countplayersA, _percentA, _countplayersB, _percentB, mission_dead_side_A, mission_dead_side_B]] call BRM_fnc_doLog;

_winner = side_a_side;
_losers = [side_b_side];
_winnerScore = _percentA;

if (_percentB < _percentA) then { _winner = side_b_side; _winnerScore = _percentB; _losers = [side_a_side] };

if (mission_enable_side_c) then {
    _losers pushBack side_c_side;
    if (_percentC < _percentA) then { _winner = side_c_side; _winnerScore = _percentC; _losers = [side_a_side, side_b_side] };
    if (_percentC < _percentB) then { _winner = side_c_side; _winnerScore = _percentC; _losers = [side_a_side, side_b_side] };
};

_margin = "stalemate";

switch (true) do {
    case ((_winnerScore >= 0) && (_winnerScore <= 20)): { _margin = "an absolute" };
    case ((_winnerScore > 20) && (_winnerScore <= 80)): { _margin = "a marginal" };
    case ((_winnerScore > 80)): { _margin = "a pyrrhic" };
    case ((_winnerScore == 100)): { _margin = "a stalemate" };
};

if (count (mission_ending_details select 0) == 0) then {
    (mission_ending_details) set [0, [_winner]]; publicVariable "mission_ending_details";
};

if (count (mission_ending_details select 1) == 0) then {
    (mission_ending_details) set [1, _losers]; publicVariable "mission_ending_details";
};

mission_ending_details pushBack _margin;