_deps = _this select 0;
_ret = true;

if ((count _deps) == 0) exitWith { true };

{
    call compile format ["if (!(scriptDone %1)) exitWith { _ret = false };",_x];
} forEach _deps;

_ret