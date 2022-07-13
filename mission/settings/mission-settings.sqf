// https://github.com/broma-arma/BromA-A3-Framework-Mark3/wiki/Mission-Settings

// ============================================================================
// GAMEMODE

// The mission type.
// "coop"  - Cooperative missions, players against AI.
// "tvt"   - Team vs Team, each group of players fight each other.
// "cotvt" - Same as a COOP, but with enemy players on the other side.
mission_game_mode = "coop";

// ============================================================================
// FACTIONS

// Side and Faction the players belong to
side_a_side = WEST;
side_a_faction = "NATO";

// Side and Faction the enemies belong to
side_b_side = EAST;
side_b_faction = "CSAT";

// Side and Faction of third faction. Leave Faction as empty, "", if not using.
side_c_side = RESISTANCE;
side_c_faction = "";

// ============================================================================
// EXTRACTION

// Sides that must extract after finishing their main objectives.
mission_require_extraction = [side_a_side];

// Extraction objects for each side. Can be a Game Logic or regular vehicle/object.
// Any objects named "blu/op/ind_extraction_N" will be added automatically.
mission_extraction_points_a = [];
mission_extraction_points_b = [];
mission_extraction_points_c = [];

// Array of music to play when extracting, a random one will be chosen.
// "*" denotes automatic
mission_extraction_tracks = "*";

// Array of the groups that must extract for each side.
// "*" denotes automatic
// Example: mission_extraction_BLU = ["blu_0_0", "blu_1_0", "blu_1_1", "blu_1_2", "blu_2_0", "blu_2_1", "blu_2_2", "blu_3_0", "blu_3_1", "blu_3_2", "blu_4_0", "blu_4_1", "blu_4_2"];
mission_extraction_BLU = "*";
mission_extraction_OP = "*";
mission_extraction_IND = "*";
mission_extraction_CIV = "*";

// ============================================================================
// LOADOUTS

// If these options are enabled, the Framework will use the loadouts located within
// the mission folder, instead of using those in the mod. Only recommended for
// testing - all finished loadouts should be submitted to the addon version!
// 
// Example: read_local_loadouts_specific = ["NATO", "CSAT"];

read_local_loadouts_specific = [];
read_local_cargo_specific = [];

// Reads the specified loadout structures.
read_local_structure_specific = [];

// Reads the locally defined Cargo types.
read_local_cargo = false;

// These loadouts will load a "mod" sheet from the local "mods" folder, and apply any specified modifications to the designated loadout.
modified_loadouts = [];

// Change to true for players to use the editor loadout.
units_player_useVanillaGear = false;
// Change to true for AI to use the editor loadout.
units_AI_useVanillaGear = false;

// ============================================================================
// JOIN IN PROGRESS (JIP)

// If this value is set to false, JIPs will be removed upon joining.
mission_allow_jip = true;

// ============================================================================
// ENDINGS

// True to show kill and death statistics before ending the mission.
mission_ending_stats = true;
