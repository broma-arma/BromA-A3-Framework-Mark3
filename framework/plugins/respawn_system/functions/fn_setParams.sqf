if (!(isNil "BRM_FMK_RespawnSystem_fnc_setParams")) then {
	[
		["p_allow_respawn", 0] call BIS_fnc_getParamValue,
		["p_player_lives", 3] call BIS_fnc_getParamValue,
		["p_respawn_objective", -1] call BIS_fnc_getParamValue
	] call BRM_FMK_RespawnSystem_fnc_setParams;
};
