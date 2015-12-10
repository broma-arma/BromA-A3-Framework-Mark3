
if (isNil "round_prep_time_seconds") then { round_prep_time_seconds = 1 }; // 10
if (isNil "round_alerted_minutes") then { round_alerted_minutes = [1,5,15] };
if (isNil "round_seconds_between") then { round_seconds_between = 5 };

if (isNil "round_side_a_victory_con") then { round_side_a_victory_con = "(sideAcondition)" };
if (isNil "round_side_b_victory_con") then { round_side_b_victory_con = "(sideBcondition)" };
if (isNil "round_side_c_victory_con") then { round_side_c_victory_con = "(sideCcondition)" };

if (isNil "round_timeout_winner") then { round_timeout_winner = "SCORE" }; // Also accept "SCORE" and "DRAW" and a side

if (isNil "win_messages_a") then { win_messages_a = ["%1 victory!", "%1 have won the round!"] };
if (isNil "win_messages_b") then { win_messages_b = ["%1 victory!", "%1 have won the round!"] };
if (isNil "win_messages_c") then { win_messages_c = ["%1 victory!", "%1 have won the round!"] };

if (isNil "draw_messages") then { draw_messages = ["The round has ended in a draw!", "Draw!", "Nobody wins!"] };

if (isNil "round_end_message") then { round_end_notification = "NOTIFICATION" };

if (isNil "round_display_score") then { round_display_score = true };

if (isNil "round_setup_size") then { round_setup_size = 10 };

if (isNil "respawn_markers_A") then { respawn_markers_A = [format["respawn_%1", toLower(str(side_a_side))]] };
if (isNil "respawn_markers_B") then { respawn_markers_B = [format["respawn_%1", toLower(str(side_b_side))]] };
if (isNil "respawn_markers_C") then { respawn_markers_C = [format["respawn_%1", toLower(str(side_c_side))]] };
