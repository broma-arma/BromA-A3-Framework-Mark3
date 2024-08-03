if (!isNil "BRM_FMK_ACE3_fnc_setParams") then {
	[
		["p_ace3_medical_level", 1] call BIS_fnc_getParamValue,
		["p_ace3_revive_time", 300] call BIS_fnc_getParamValue,
		["p_ace3_revive_lives", 3] call BIS_fnc_getParamValue,
		["p_ace3_everyone_medic", 1] call BIS_fnc_getParamValue
	] call BRM_FMK_ACE3_fnc_setParams;
};
