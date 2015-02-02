
["LOCAL", "LOG", "=========================================================================================================="] call BRM_fnc_doLog;
_missionName = getText(missionConfigFile >> "Mission" >> "Mission" >> "Intel" >> "briefingName");
["LOCAL", "F_LOG", format ["STARTING MISSION '%1'", _missionName]] call BRM_fnc_doLog;
["LOCAL", "LOG", "=========================================================================================================="] call BRM_fnc_doLog;

startTime = diag_tickTime;

enableSaving [false, false];
enableSentences false;

[ENGINE_preinits] call BRM_fnc_startPlugins;