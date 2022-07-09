// https://github.com/broma-arma/BromA-A3-Framework-Mark3/wiki/Plugins

//==============================================================================
// INTRO CUTSCENE

intro_cutscene = "TEXT"; // "ESTABLISHING", "TEXT", "CINEMA" or "NONE".

//==============================================================================
// RESPAWN SYSTEM

// How many lives each side will get. Leave at -1 if you want it to be tied to the parameter.
// Remember that respawning must still be enabled in the parameters.
mission_lives_side_a = -1;
mission_lives_side_b = -1;
mission_lives_side_c = -1;

//==============================================================================
// AI SPAWNING

// Enable AI Caching.
AI_spawn_enable_caching = true;

// Distance from players in which the AI will start to be cached.
AI_spawn_cache_distance = 1500;

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

//==============================================================================
// CH VIEW DISTANCE

// Allows players to turn grass off - recommended FALSE for TVTs.
CHVD_allowNoGrass = (mission_game_mode == "coop");

// Max rendering distance for the terrain.
CHVD_maxView = 12000;

// Max rendering distance for objects..
CHVD_maxObj = 12000;

//==============================================================================
// COMMANDER LOCK
// This module stops all of a side's units from entering vehicles or shooting, until their CO or similarly authorized player says so.

// What units are authorized to ready their team.
co_lock_units = ["blu_0_0_1", "blu_1_0_1", "op_0_0_1", "op_1_0_1", "ind_0_0_1", "ind_1_0_1"];

// If this is enabled, the mission won't start until all sides are ready.
co_lock_tvt_mode = false;

//==============================================================================
// BLOCK THIRD PERSON

// These units will be allowed to use Third Person regardless of settings.
tp_allowed_units = [];

//==============================================================================
// BODY REMOVAL
// Removes the bodies of dead units.

// How long until the bodies are removed.
f_var_removeBodyDelay = 120;

// How far do they have to be from a player.
f_var_removeBodyDistance = 300;

//==============================================================================
// TIME LIMIT

// This setting decides when players will get a reminder of how much time is there still left in the mission.
time_alerted_minutes = [120, 60, 15, 1];

//==============================================================================
// FRIENDLY FIRE
// Settings related to the friendly fire plugin.

// How long it'll take for a friendly fire notification to appear, in minutes.
friendly_fire_timer_minutes = 1;

// Show message when an AI wounds a player.
friendly_fire_count_AI = false;

//==============================================================================
// DISABLE RESLOTTING

// How long players have until their current slot is locked (in seconds).
mission_preventreslot_timer = 5*60;

//==============================================================================
// CIVILIAN CAP
// Sides included here will be held responsible for civilian casualties, if the parameters for such are enabled.

responsible_sides = [side_a_side, side_b_side];

//==============================================================================
// VANILLA SPECTATOR
// Set the settings for the Vanilla Spectator system.

vanillaspectator_whitelisted_sides = [];
vanillaspectator_can_view_AI = true;
vanillaspectator_free_camera_available = true;
vanillaspectator_third_person_available = true;
vanillaspectator_show_focus_available = true;
vanillaspectator_show_buttons = true;
vanillaspectator_show_controls = true;
vanillaspectator_show_header = true;
vanillaspectator_show_entities = true;

//==============================================================================
// SETUP AND SPAWN PROTECTION
// Determines how large the setup and spawn protection zones are, in meters.

spawn_protection_area = 50;

setup_zone_area = 50;

//==============================================================================
// AO LIMIT
// Runs any code the mission maker wants whenever a player leaves the designated Area of Operations, denoted by a marker named "ao".

// Code that will be executed when a player leaves the area.
left_ao_do = { hintSilent "Please remain within the Area of Operations." };
