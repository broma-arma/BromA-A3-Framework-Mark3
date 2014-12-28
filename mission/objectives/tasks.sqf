if (!isServer) exitWith {};
waitUntil{scriptDone(mission_settings)};

[sideA_Side, "newTask1", ["Kill the OPFOR civ", "My description 1"],["(not alive objOP)"], true] call BRM_fnc_newTask;
[sideB_Side, "newTask2", ["Kill the BLUFOR civ", "My description 2"],["(not alive objBLU)"], true] call BRM_fnc_newTask;
[sideC_Side, "newTask3", ["Kill your civ", "My description 3"],["(not alive objIND)"], true] call BRM_fnc_newTask;

[] call BRM_fnc_checkTasks;