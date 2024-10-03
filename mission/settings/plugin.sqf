// Block Third Person
	// Units that are allowed to use third person, regardless of settings.
	tp_allowed_units = [];

// Casualty Cap
	// BLUFOR groups
	casualty_group_BLU = "[blu_0_0, blu_1_0, blu_1_1, blu_1_2, blu_2_0, blu_2_1, blu_2_2, blu_3_0, blu_3_1, blu_3_2, blu_4_0, blu_4_1, blu_4_2]";

	// OPFOR groups
	casualty_group_OP = "[op_0_0, op_1_0, op_1_1, op_1_2, op_2_0, op_2_1, op_2_2, op_3_0, op_3_1, op_3_2, op_4_0, op_4_1, op_4_2]";

	// INDFOR groups
	casualty_group_IND = "[ind_0_0, ind_1_0, ind_1_1, ind_1_2, ind_2_0, ind_2_1, ind_2_2, ind_3_0, ind_3_1, ind_3_2, ind_4_0, ind_4_1, ind_4_2]";

// CH View Distance
	// Allow players to turn off grass.
	CHVD_allowNoGrass = mission_game_mode == "coop";

	// Max terrain rendering distance.
	CHVD_maxView = 40000;

	// Max object rendering distance.
	CHVD_maxObj = 40000;

// Civilian Cap
	// Sides that are punished for civilian casualties.
	responsible_sides = [side_a_side, side_b_side];

// Commander Lock
	// Units that can ready their team.
	co_lock_units = "[blu_0_0_1, blu_1_0_1, op_0_0_1, op_1_0_1, ind_0_0_1, ind_1_0_1]";

	// Start mission only when all sides are ready.
	co_lock_tvt_mode = false;

// Friendly Fire
	// Delay, in minutes, after friendly fire for a notification to appear.
	friendly_fire_timer_minutes = 1;

	// Show AI involved friendly fire messages.
	friendly_fire_count_AI = false;

// Intro Cutscene
	// "ESTABLISHING", "TEXT", "CINEMA" or "NONE"
	intro_cutscene = "TEXT";

// Plank Building
	// Declare the objects that will serve as the construction anchors.
	// [[object, min distance], ...]
	// Example: plank_objects_side_a = [["MobileHQ", "10]];
	plank_objects_side_a = [];
	plank_objects_side_b = [];
	plank_objects_side_c = [];

	// These are the available fortifications. Add or take as you wish.
	// Action text     - The text displayed by the action.
	// Classname       - The classname of the object to be placed.
	// Distance        - Minimum distance of the object from the player, in metres.
	// Direction       - Direction the object will be rotated initially, in degrees (minimum 0, maximum 360).
	// Direction range - The range you can turn the object, in degrees (minimum 0, maximum 360).
	//                   This means that the player will be able to set the direction of the object between `direction - direction_range / 2` and `direction + direction_range / 2` degrees.
	//                   For example given 180 direction and 60 direction range, player will be able turn the object between 150 and 210 degrees.
	// Code            - A piece of code that will be executed when the object placement is confirmed.
	//                   Set it to {}, if you don't want to use it. The unit who confirmed the placement and the object placed, are passed as arguments to the code.
	//                   An example code that hints the players name could look like {hint str (_this select 0);}.
	plank_deploy_fortData = [
		// Action text                          Classname                               Distance        Direction      Direction Range    Code   Delay in seconds to place
		["Small bunker",                        "Land_BagBunker_Small_F",               3,              180,           360,               {},     20],
		["Bunker",                              "Land_BagBunker_Large_F",               8,              180,           60,                {},     35],
		["Wide Sandbag fence",                  "Land_BagFence_Long_F",                 2,              0,             360,               {},     8],
		["H-Barrier watch tower",               "Land_HBarrierTower_F",                 7,              180,           360,               {},     100],
		["Short Sandbag fence",                 "Land_BagFence_Short_F",                2,              0,             360,               {},     4],
		["Razor Wire",                          "Land_Razorwire_F",                     4,              0,             360,               {},     10],
		["Concrete wall long",                  "Land_CncWall4_F",                      8,              0,             360,               {},     60],
		["Bunker Tower",                        "Land_BagBunker_Tower_F",               7,              90,            360,               {},     60]
	];

	// Number of objects player can place
	// "Small bunker", "Bunker", "Wide Sandbag fence", "H-Barrier watch tower", "Short Sandbag fence", "Razor Wire", "Concrete wall long", "Bunker Tower"
	PLANK_Player_Objects     = [1, 0, 10, 0, 15, 5, 0, 0]; // Other
	PLANK_Officer_Objects    = [5, 3, 20, 5, 20, 10, 0, 5]; // Officers
	PLANK_FTL_Objects        = [3, 1, 20, 1, 15, 10, 0, 1]; // Team Leaders
	PLANK_SL_Objects         = [5, 2, 20, 3, 15, 10, 0, 2]; // Squad Leaders
	PLANK_Specialist_Objects = [25, 15, 100, 25, 100, 50, 0, 25]; // Repair Specialists or Engineers

	// Build speed multiplier
	PLANK_FMK_buildSpeed = 1;

// Prevent Reslotting
	// Seconds for a player's slot to be locked.
	mission_preventreslot_timer = 5 * 60;

// Respawn System
	// Number of lives each player on a side will have. -1 to use the mission parameter.
	mission_lives_side_a = -1;
	mission_lives_side_b = -1;
	mission_lives_side_c = -1;

// Round System
	// Delay, in seconds, before a round starts.
	round_prep_time_seconds = 10;

	// Delay, in seconds, between rounds.
	round_seconds_between = 15;

	// When players will get a reminder of the remaining time, in minutes, in the round.
	round_alerted_minutes = [1, 5, 15, 30];

	// Victory conditions. Code that returns boolean.
	round_side_a_victory_con = "sideAcondition";
	round_side_b_victory_con = "sideBcondition";
	round_side_c_victory_con = "sideCcondition";

	// Timeout winner.
	//   "SCORE" - Fewest deaths.
	//   "DRAW" - No winner.
	//   Side - Specified side wins. E.g. side_a_side or WEST
	round_timeout_winner = "SCORE";

	// Text to show when a round is won. %1 is replaced with the winner's name. A random one will be choosen.
	win_messages_a = ["%1 victory!", "%1 have won the round!"];
	win_messages_b = ["%1 victory!", "%1 have won the round!"];
	win_messages_c = ["%1 victory!", "%1 have won the round!"];

	// Text to show when a round ends in a draw. A random one will be choosen.
	draw_messages = ["The round has ended in a draw!", "Draw!", "Nobody wins!"];

	// "NOTIFICATION" or "HINT"
	round_end_notification = "NOTIFICATION";

	// Display scores after each round.
	round_display_score = true;

	// Setup zone radius, in meters.
	round_setup_size = 10;

	// Markers in which players will respawn. Each player will respawn at a randomly choosen one.
	respawn_markers_A = [format ["respawn_%1", toLower str side_a_side]];
	respawn_markers_B = [format ["respawn_%1", toLower str side_b_side]];
	respawn_markers_C = [format ["respawn_%1", toLower str side_c_side]];

// Setup Zone
	// The radius, in meters, of the setup zone.
	setup_zone_area = 50;

// Spawn AI
	// Enable Caching.
	AI_spawn_enable_caching = true;

	// Distance, in meters, for AI to be cached from players.
	AI_spawn_cache_distance = 1500;

// Spawn Protection
	// The radius, in meters, of the spawn protection.
	spawn_protection_area = 50;

// Time Limit
	// When players will get a reminder of the remaining time, in minutes, in the mission.
	time_alerted_minutes = [1, 15, 60, 120];

// Vanilla Spectator
	vanillaspectator_whitelisted_sides = [];
	vanillaspectator_can_view_AI = true;
	vanillaspectator_free_camera_available = true;
	vanillaspectator_third_person_available = true;
	vanillaspectator_show_focus_available = true;
	vanillaspectator_show_buttons = true;
	vanillaspectator_show_controls = true;
	vanillaspectator_show_header = true;
	vanillaspectator_show_entities = true;
