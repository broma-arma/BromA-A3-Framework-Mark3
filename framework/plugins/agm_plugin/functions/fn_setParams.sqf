if (!(isNil "BRM_FMK_AGM_fnc_setParams")) then {
	[
		["p_agm_revive_time", 3] call BIS_fnc_getParamValue,
		["p_agm_single_bandage", 1] call BIS_fnc_getParamValue,
		["p_agm_insta_death", 0] call BIS_fnc_getParamValue
	] call BRM_FMK_AGM_fnc_setParams;
};
