
_ret = objNull;

{ if (name _x == _this select 0) exitWith { _ret = _x } } forEach allUnits;

_ret