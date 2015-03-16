
_unit = _this select 0;

[_unit] call AGM_Medical_fnc_wakeUp;
[_unit, 0] call AGM_Medical_fnc_setDamage;

_unit setVariable ["AGM_isUnconscious", false, true];
_unit setVariable ["AGM_isBleeding", false, true];
_unit setVariable ["AGM_Blood", 1, true];
_unit setVariable ["AGM_Pain", 0, true];
_unit setVariable ["AGM_isOverdosing", false, true];