//["blufor", player] call BRM_fnc_assignLoadout;

player addEventHandler ["Respawn", {[_this] call BRM_fnc_onRespawn}];
player addEventHandler ["Killed", {[_this] call BRM_fnc_onKilled}];