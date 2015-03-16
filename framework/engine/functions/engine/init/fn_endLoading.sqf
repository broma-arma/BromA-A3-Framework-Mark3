
if (isServer) then { mission_init_server = [] execVM "mission\custom-scripts\initServer.sqf" };
if (hasInterface) then { mission_init_player = [] execVM "mission\custom-scripts\initPlayer.sqf" };
mission_init = [] execVM "mission\custom-scripts\init.sqf";

framework_init_time = (diag_tickTime - startTime);

["LOCAL", "LOG", "=========================================================================================================="] call BRM_fnc_doLog;
["LOCAL", "F_LOG", format ["BROMA FRAMEWORK INITIALIZED SUCCESSFULLY IN %1 SECONDS.", framework_init_time]] call BRM_fnc_doLog;
["LOCAL", "LOG", "=========================================================================================================="] call BRM_fnc_doLog;