if (!isServer) exitWith {};

[sideA_Side, "newTask1", ["My description 1", "Title 1", ""], true] call BRM_fnc_newTask;
[sideA_Side, "newTask2", ["My description 2", "Title 2", ""], true] call BRM_fnc_newTask;
[sideA_Side, "newTask3", ["My description 3", "Title 3", ""], false] call BRM_fnc_newTask;
[sideB_Side, "newTask4", ["My description 4", "Title 4", ""], true] call BRM_fnc_newTask;