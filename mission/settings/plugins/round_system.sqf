//==============================================================================
// ROUND SYSTEM

// How many seconds players will have to prepare themselves before the match begins.
round_prep_time_seconds = 10;

// Seconds in between rounds.
round_seconds_between = 15;

// What minutes will players be alerted of the remaining time in the round.
round_alerted_minutes = [1, 5, 15, 30];

// The conditions for victory. These can be left alone, as it is also possible to win through other means - see below.
round_side_a_victory_con = "(sideAcondition)";
round_side_b_victory_con = "(sideBcondition)";
round_side_c_victory_con = "(sideCcondition)";

// Whoever wins once the round time limit runs out.
// Valid are:
//    "SCORE", which will calculate the side with the fewer losses.
//    SIDE, like <side_a_side> or <WEST>, will give the victory to the side.
//    "DRAW" ends the round with no winners.

round_timeout_winner = "SCORE";

// Fill these up with your victory messages. %1 refers to the winner's name.
win_messages_a = ["%1 victory!", "%1 have won the round!"];
win_messages_b = ["%1 victory!", "%1 have won the round!"];
win_messages_c = ["%1 victory!", "%1 have won the round!"];

// Same as above, except for a draw.
draw_messages = ["The round has ended in a draw!", "Draw!", "Nobody wins!"];

// Round end notifications, can be either "HINT" or "NOTIFICATION".
round_end_notification = "NOTIFICATION";

// Display each team's score after the round is over.
round_display_score = true;

// Size of the setup zone for the players.
round_setup_size = 10;

// Markers in which players will respawn. If more are supplied, a random one will be chosen FOR EACH PLAYER.
respawn_markers_A = [format["respawn_%1", toLower str side_a_side]];
respawn_markers_B = [format["respawn_%1", toLower str side_b_side]];
respawn_markers_C = [format["respawn_%1", toLower str side_c_side]];
