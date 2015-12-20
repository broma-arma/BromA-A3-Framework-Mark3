
match_points_a = 0;
match_points_b = 0;
match_points_c = 0;

cache_deaths_a = 0;
cache_deaths_b = 0;
cache_deaths_c = 0;

match_ending_winner = [];
match_current_round = 1;

setupZoneEnd = false;

match_sides = 2;
if (mission_enable_side_c) then { match_sides = 3 };

publicVariable "match_points_a";
publicVariable "match_points_b";
publicVariable "match_points_c";

publicVariable "match_sides";
publicVariable "match_current_round";
publicVariable "setupZoneEnd";