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
if (isServer) then {
	[{ missionNamespace getVariable ["server_vehicles_created", false] }, {
		[] call compile preprocessFileLineNumbers "mission\objectives\tasks.sqf";
		[] spawn BRM_FMK_fnc_checkTasks;
	}, []] call CBA_fnc_waitUntilAndExecute;
};

// Runs any scripts related to AI in the mission.
if (!didJIP) then {
	[{ !isNil "mission_AI_controller_name" }, {
		if (mission_AI_controller) then {
			[] execVM "mission\objectives\ai.sqf";
		};
	}] call CBA_fnc_waitUntilAndExecute;
};
