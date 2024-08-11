if (!isNil "BRM_FMK_HC_fnc_setParams") then {
	private _enable = ["p_enable_hc", 2] call BIS_fnc_getParamValue;
	if (_enable == 2) then {
		_enable = parseNumber (entities "HeadlessClient_F" findIf { isPlayer _x } != -1);
	};
	[_enable] call BRM_FMK_HC_fnc_setParams;
};
