_unit = _this select 0;
_damage = _this select 2;
_status = "dead";

[_unit, _status] spawn {
    _unit = _this select 0;
    _status = _this select 1;
    [-1, {(_this select 0) setmimic (_this select 1)}, [_unit, _status]] call CBA_fnc_globalExecute;

    sleep 10;

    if (alive _unit) then {
        _status = "hurt";
        [-1, {(_this select 0) setmimic (_this select 1)}, [_unit, _status]] call CBA_fnc_globalExecute;
    };
};