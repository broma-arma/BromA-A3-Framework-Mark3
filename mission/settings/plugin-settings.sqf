// Block Third Person
	// Units that are allowed to use third person, regardless of settings.
	tp_allowed_units = [];

// Body Removal
	// Delay, in seconds, until bodies are removed.
	f_var_removeBodyDelay = 120;

	// Minimum distance, in meters, players need to be for bodies to be removed.
	f_var_removeBodyDistance = 300;

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

// DAC
	// All playable units. Chances are you can just leave this alone.
	DAC_STRPlayers = [
		// BLUFOR
		"blu_0_0_1", "blu_0_0_2", "blu_0_0_3",
			"blu_1_0_1", "blu_1_0_2",
				"blu_1_1_1", "blu_1_1_2", "blu_1_1_3", "blu_1_1_4",
				"blu_1_2_1", "blu_1_2_2", "blu_1_2_3", "blu_1_2_4",
			"blu_2_0_1", "blu_2_0_2",
				"blu_2_1_1", "blu_2_1_2", "blu_2_1_3", "blu_2_1_4",
				"blu_2_2_1", "blu_2_2_2", "blu_2_2_3", "blu_2_2_4",
			"blu_3_0_1", "blu_3_0_2",
				"blu_3_1_1", "blu_3_1_2", "blu_3_1_3", "blu_3_1_4",
				"blu_3_2_1", "blu_3_2_2", "blu_3_2_3", "blu_3_2_4",
			"blu_4_0_1", "blu_4_0_2",
				"blu_4_1_1", "blu_4_1_2", "blu_4_1_3", "blu_4_1_4",
				"blu_4_2_1", "blu_4_2_2", "blu_4_2_3", "blu_4_2_4",
			"blu_5_0_1", "blu_5_0_2", "blu_5_0_3", "blu_5_0_4",
			"blu_6_0_1", "blu_6_0_2", "blu_6_0_3", "blu_6_0_4",
			"blu_7_0_1", "blu_7_0_2", "blu_7_0_3", "blu_7_0_4",
			"blu_8_0_1", "blu_8_0_2", "blu_8_0_3",
			"blu_9_0_1", "blu_9_0_2",
			"blu_10_1_1", "blu_10_1_2",
			"blu11_1_1", "blu_11_1_2", "blu_11_1_3",
			"blu_12_1_1", "blu_12_1_2", "blu_12_1_3", "blu_12_1_4",
			"blu_13_1_1", "blu_13_1_2", "blu_13_1_3", "blu_13_1_4", "blu_13_1_5",
			"blu_14_2_1", "blu_14_2_2",
			"blu_14_2_1", "blu_14_2_2",

		// OPFOR
		"op_0_0_1", "op_0_0_2", "op_0_0_3",
			"op_1_0_1", "op_1_0_2",
				"op_1_1_1", "op_1_1_2", "op_1_1_3", "op_1_1_4",
				"op_1_2_1", "op_1_2_2", "op_1_2_3", "op_1_2_4",
			"op_2_0_1", "op_2_0_2",
				"op_2_1_1", "op_2_1_2", "op_2_1_3", "op_2_1_4",
				"op_2_2_1", "op_2_2_2", "op_2_2_3", "op_2_2_4",
			"op_3_0_1", "op_3_0_2",
				"op_3_1_1", "op_3_1_2", "op_3_1_3", "op_3_1_4",
				"op_3_2_1", "op_3_2_2", "op_3_2_3", "op_3_2_4",
			"op_4_0_1", "op_4_0_2",
				"op_4_1_1", "op_4_1_2", "op_4_1_3", "op_4_1_4",
				"op_4_2_1", "op_4_2_2", "op_4_2_3", "op_4_2_4",
			"op_5_0_1", "op_5_0_2", "op_5_0_3", "op_5_0_4",
			"op_6_0_1", "op_6_0_2", "op_6_0_3", "op_6_0_4",
			"op_7_0_1", "op_7_0_2", "op_7_0_3", "op_7_0_4",
			"op_8_0_1", "op_8_0_2", "op_8_0_3",
			"op_9_0_1", "op_9_0_2",
			"op_10_1_1", "op_10_1_2",
			"op11_1_1", "op_11_1_2", "op_11_1_3",
			"op_12_1_1", "op_12_1_2", "op_12_1_3", "op_12_1_4",
			"op_13_1_1", "op_13_1_2", "op_13_1_3", "op_13_1_4", "op_13_1_5",
			"op_14_2_1", "op_14_2_2",
			"op_14_2_1", "op_14_2_2",

		// Independent
		"ind_0_0_1", "ind_0_0_2", "ind_0_0_3",
			"ind_1_0_1", "ind_1_0_2",
				"ind_1_1_1", "ind_1_1_2", "ind_1_1_3", "ind_1_1_4",
				"ind_1_2_1", "ind_1_2_2", "ind_1_2_3", "ind_1_2_4",
			"ind_2_0_1", "ind_2_0_2",
				"ind_2_1_1", "ind_2_1_2", "ind_2_1_3", "ind_2_1_4",
				"ind_2_2_1", "ind_2_2_2", "ind_2_2_3", "ind_2_2_4",
			"ind_3_0_1", "ind_3_0_2",
				"ind_3_1_1", "ind_3_1_2", "ind_3_1_3", "ind_3_1_4",
				"ind_3_2_1", "ind_3_2_2", "ind_3_2_3", "ind_3_2_4",
			"ind_4_0_1", "ind_4_0_2",
				"ind_4_1_1", "ind_4_1_2", "ind_4_1_3", "ind_4_1_4",
				"ind_4_2_1", "ind_4_2_2", "ind_4_2_3", "ind_4_2_4",
			"ind_5_0_1", "ind_5_0_2", "ind_5_0_3", "ind_5_0_4",
			"ind_6_0_1", "ind_6_0_2", "ind_6_0_3", "ind_6_0_4",
			"ind_7_0_1", "ind_7_0_2", "ind_7_0_3", "ind_7_0_4",
			"ind_8_0_1", "ind_8_0_2", "ind_8_0_3",
			"ind_9_0_1", "ind_9_0_2",
			"ind_10_1_1", "ind_10_1_2",
			"ind11_1_1", "ind_11_1_2", "ind_11_1_3",
			"ind_12_1_1", "ind_12_1_2", "ind_12_1_3", "ind_12_1_4",
			"ind_13_1_1", "ind_13_1_2", "ind_13_1_3", "ind_13_1_4", "ind_13_1_5",
			"ind_14_2_1", "ind_14_2_2",
			"ind_14_2_1", "ind_14_2_2",

		// Civilian (Reporters)
		"civ_0_0_1", "civ_0_0_2"
	];

// Friendly Fire
	// Delay, in minutes, after friendly fire for a notification to appear.
	friendly_fire_timer_minutes = 1;

	// Show AI involved friendly fire messages.
	friendly_fire_count_AI = false;

// Intro Cutscene
	// "ESTABLISHING", "TEXT", "CINEMA" or "NONE"
	intro_cutscene = "TEXT";

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
