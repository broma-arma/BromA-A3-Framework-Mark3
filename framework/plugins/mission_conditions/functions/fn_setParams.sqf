if (!isNil "BRM_FMK_MissionConditions_fnc_setParams") then {
	[
		["p_time_of_day", 41] call BIS_fnc_getParamValue,
		["p_weather", 10] call BIS_fnc_getParamValue,
		["p_fog", 15] call BIS_fnc_getParamValue,
		["p_wind", 11] call BIS_fnc_getParamValue
	] call BRM_FMK_MissionConditions_fnc_setParams;
};
