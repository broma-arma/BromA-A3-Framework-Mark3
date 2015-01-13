if (!isServer) exitWith {};
waitUntil{scriptDone(mission_settings)};

[side_a_side, "newTask1", ["Kill the OPFOR civ", "My description 1"],["(not alive objOP)"], true] call BRM_fnc_newTask;
[side_b_side, "newTask2", ["Kill the BLUFOR civ", "My description 2"],["(not alive objBLU)"], true] call BRM_fnc_newTask;
[side_c_side, "newTask3", ["Kill your civ", "My description 3"],["(not alive objIND)"], true] call BRM_fnc_newTask;

[] call BRM_fnc_checkTasks;