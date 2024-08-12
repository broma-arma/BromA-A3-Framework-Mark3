pluginsLoaded = true;

if (isServer) then {
	mission_init_server = [] execVM "mission\scripts\initServer.sqf";

	[] call compile preprocessFileLineNumbers "mission\objectives\tasks.sqf";
	[] spawn BRM_FMK_fnc_checkTasks;
};

if (!didJIP && mission_AI_controller) then {
	[] execVM "mission\objectives\ai.sqf";
};

if (hasInterface) then {
	mission_init_player = [] execVM "mission\scripts\initPlayer.sqf";
};

mission_init = [] execVM "mission\scripts\init.sqf";

framework_init_time = diag_tickTime - startTime;
["LOCAL", "F_LOG", format ["BROMA FRAMEWORK INITIALIZED SUCCESSFULLY IN %1 SECONDS.", framework_init_time]] call BRM_FMK_fnc_doLog;
