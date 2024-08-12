mission_settings_loaded = false;

call compile preprocessFileLineNumbers "mission\settings\mission-settings.sqf";

endings_victory = "victory";
endings_defeat = "defeat";
endings_civilians_killed = "defeat";
endings_time_over = "defeat";
endings_tvt_auto = "tvt_end";
{
	missionNamespace setVariable [format ["endings_tvt_side_%1_victory", _x], format ["side_%1_victory", _x]];
	missionNamespace setVariable [format ["endings_tvt_side_%1_defeat", _x], format ["side_%1_defeat", _x]];
} forEach ["a", "b", "c"];

mission_enable_side_c = side_c_faction != "";

// Backwards compatibility
units_player_useVanillaGear = mission_vanilla_player_loadouts;
units_AI_useVanillaGear = mission_vanilla_ai_loadouts;
read_local_cargo = false;

call compile preprocessFileLineNumbers "mission\settings\plugin-settings.sqf";
[] call BRM_FMK_fnc_assignSideProperties;

mission_settings_loaded = true;
