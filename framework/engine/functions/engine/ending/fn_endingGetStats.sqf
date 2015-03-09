
// =============================================================================
/* 
    Here we calculate the number of deaths in the mission in a percentage:
    depending on how many players died for each side, the "margin" variable
    will be change accordingly to reflect the winner, and for how much.
*/
// =============================================================================

    _countplayersA = count mission_players_A;
    _countplayersB = count mission_players_B;
    _countplayersC = count mission_players_C;
    
    _percentA = floor ((100/(_countplayersA+1)) * (mission_dead_side_A+1));
    _percentB = floor ((100/(_countplayersB+1)) * (mission_dead_side_B+1));
    _percentC = floor ((100/(_countplayersC+1)) * (mission_dead_side_C+1));
    
    _winner = side_a_side;
    _winnerScore = _percentA;
    
    if (_percentB > _percentA) then { _winner = side_b_side; _winnerScore = _percentB };
    if (_percentC > _percentA) then { _winner = side_c_side; _winnerScore = _percentC };
    if (_percentC > _percentB) then { _winner = side_c_side; _winnerScore = _percentC };
    
    _margin = "stalemate";
    
    switch (true) do {
        case ((_winnerScore > 0) && (_winnerScore > 0)): { _margin = "a pyrrhic" };
        case ((_winnerScore > 20) && (_winnerScore > 80)): { _margin = "a marginal" };
        case ((_winnerScore > 80)): { _margin = "an absolute" };
    };
    
    if (count (mission_ending_details select 0) == 0) then {
        (mission_ending_details select 0) set [0, _winner]; publicVariable "mission_ending_details";
    };
    
    mission_ending_details pushBack _margin;