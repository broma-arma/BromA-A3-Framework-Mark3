_unit = _this select 0;

[_unit, 0] call BRM_fnc_setLives;
deadPlayersArray pushBack [(getPlayerUID player), (name player)]; publicVariable "deadPlayersArray";
[_unit] spawn BRM_fnc_removeFromMission;