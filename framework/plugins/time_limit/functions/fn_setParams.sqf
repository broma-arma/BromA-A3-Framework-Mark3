if (!(isNil "BRM_FMK_TimeLimit_fnc_setParams")) then {
	[
		["p_time_limit", -1] call BIS_fnc_getParamValue,
		["p_time_added", 0] call BIS_fnc_getParamValue
	] call BRM_FMK_TimeLimit_fnc_setParams;
};
