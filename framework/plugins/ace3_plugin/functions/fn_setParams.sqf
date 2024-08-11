if (!isNil "BRM_FMK_ACE3_fnc_setParams") then {
	[
		nil,
		nil,
		["p_ace3_revive_lives", -1] call BIS_fnc_getParamValue,
		["p_ace3_everyone_medic", 0] call BIS_fnc_getParamValue
	] call BRM_FMK_ACE3_fnc_setParams;
};
