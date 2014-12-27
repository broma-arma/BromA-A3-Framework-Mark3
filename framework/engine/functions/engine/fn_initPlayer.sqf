//["blufor", player] call BRM_fnc_assignLoadout;

player addEventHandler ["Respawn", {[_this] call BRM_fnc_onRespawn}];
player addEventHandler ["Killed", {[_this] call BRM_fnc_onKilled}];

player addAction ["<t color='#FF0000'>Finish task 1</t>",{ ["newTask1","succeeded", true] call BRM_fnc_setTask }];
player addAction ["<t color='#FF0000'>Finish task 2</t>",{ ["newTask2","succeeded", true] call BRM_fnc_setTask }];
player addAction ["<t color='#FF0000'>Finish task 3</t>",{ ["newTask3","succeeded", true] call BRM_fnc_setTask }];