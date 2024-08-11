/*
================================================================================

NAME:
    BRM_fnc_loadSettings

AUTHOR(s):
    Nife

DESCRIPTION:
    Initializes several mission related scripts.

PARAMETERS:
    None.

USAGE:
    [] call BRM_fnc_loadSettings;

RETURNS:
    Nothing.

================================================================================
*/

// Load mission settings.
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

call compile preprocessFileLineNumbers "mission\settings\plugin-settings.sqf";
[] call BRM_FMK_fnc_assignSideProperties;

mission_settings_loaded = true;

// Initializes the mission tasks and other objective related functions.
mission_objectives = [] execVM "mission\objectives\tasks.sqf";

// Runs any scripts related to AI in the mission.
mission_init_enemies = [] execVM "mission\objectives\mission_AI.sqf";
