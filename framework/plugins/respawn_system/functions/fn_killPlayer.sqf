_unit = _this select 0;

[_unit, 0] call BRM_RespawnSystem_fnc_setLives;
mission_dead_players pushBack [(getPlayerUID player), (name player),(player getVariable "unit_side")]; publicVariable "mission_dead_players";
[_unit] spawn BRM_RespawnSystem_fnc_removeFromMission;