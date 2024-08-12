// Credits
	mission_author_name = ["You"];
	mission_version = "v0";

// Gamemode
	// "coop" (Players vs AI), "tvt" (Players vs Players), "cotvt" (Players vs Players/AI)
	mission_game_mode = "coop";

// Side Config
	// Side and faction of the players.
	side_a_side = BLUFOR;
	side_a_faction = "NATO";

	// Side and faction of the enemy.
	side_b_side = OPFOR;
	side_b_faction = "CSAT";

	// Side and faction of the third faction.
	side_c_side = INDEPENDENT;
	side_c_faction = ""; // Leave empty if unneeded

// Loadouts
	// Disable the framework's loadout system for players.
	mission_vanilla_player_loadouts = false;

	// Disable the framework's loadout system for AI.
	mission_vanilla_ai_loadouts = false;

// JIP
	// Allow joining in progress.
	mission_allow_jip = true;

// Extraction
	// Sides that must extract after finishing their objectives.
	mission_require_extraction = [side_a_side];

	// Extraction objects for each side. Can be a Game Logic or regular vehicle/object.
	// Any objects that match the regex "(blu|op|ind|civ)_extraction_.*" will be added automatically. E.g. "blu_extraction_1" or "ind_extraction_point"
	mission_extraction_points_a = [];
	mission_extraction_points_b = [];
	mission_extraction_points_c = [];

	// Enable extraction music
	mission_extraction_enable_music = true;

	// Extraction music to choose from
	mission_extraction_tracks = [] call BRM_FMK_fnc_getMusic;

	// Groups that must extract
	mission_extraction_BLU = ["blu_0_0", "blu_1_0", "blu_1_1", "blu_1_2", "blu_2_0", "blu_2_1", "blu_2_2", "blu_3_0", "blu_3_1", "blu_3_2", "blu_4_0", "blu_4_1", "blu_4_2"];
	mission_extraction_OP = ["op_0_0", "op_1_0", "op_1_1", "op_1_2", "op_2_0", "op_2_1", "op_2_2", "op_3_0", "op_3_1", "op_3_2", "op_4_0", "op_4_1", "op_4_2"];
	mission_extraction_IND = ["ind_0_0", "ind_1_0", "ind_1_1", "ind_1_2", "ind_2_0", "ind_2_1", "ind_2_2", "ind_3_0", "ind_3_1", "ind_3_2", "ind_4_0", "ind_4_1", "ind_4_2"];
	mission_extraction_CIV = ["civ_0_0"];
