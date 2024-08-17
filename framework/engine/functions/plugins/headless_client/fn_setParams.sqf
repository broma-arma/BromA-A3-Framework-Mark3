if (!isNil "BRM_FMK_HC_fnc_setParams") then {
	params ["_enable"];
	if (_enable == 2) then {
		_enable = parseNumber (entities "HeadlessClient_F" findIf { isPlayer _x } != -1);
	};
	[_enable] call BRM_FMK_HC_fnc_setParams;
};
