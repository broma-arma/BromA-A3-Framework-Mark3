_unit = _this select 0;
_killer = _this select 1;

if ("f_remove_body" in usedPlugins) then {
    _unit spawn f_remove_body_fnc_removeBody;
};

[_unit, _killer] call BRM_fnc_handleScore;