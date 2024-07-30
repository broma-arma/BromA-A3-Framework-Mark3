if (!(isNil "BRM_FMK_MissionConditions_fnc_setParams")) then {
	[
		["p_time_of_day", 32] call BIS_fnc_getParamValue,
		["p_weather", 2] call BIS_fnc_getParamValue,
		["p_fog", 2] call BIS_fnc_getParamValue,
		["p_wind", 2] call BIS_fnc_getParamValue
	] call BRM_FMK_MissionConditions_fnc_setParams;
};
