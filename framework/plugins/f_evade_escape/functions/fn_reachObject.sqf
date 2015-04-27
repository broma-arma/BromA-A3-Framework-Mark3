
if (!isServer) exitWith {};
    
waitUntil{(time > 3)};

private ["_grp","_obj","_safeDistance","_alive","_safe","_end"];

_grp = [];
{ _grp pushBack (call compile format ["%1", _x]) } forEach (_this select 0);

_obj = _this select 1;
_safeDistance = _this select 2;
_code = _this select 3;
_safe = 0;

while {true} do {

    _alive = 0;
    { _alive = _alive + ({alive _x} count (units _x)) } forEach _grp;
    if (_alive == 0) exitWith {};

    {
        _y = _x;
        _safe = 0;
        
        {
            { if ((_x distance _y) < _safeDistance) then { _safe = (_safe + 1) }} forEach (units _x);
        } forEach _grp;

        if (_alive == _safe) exitWith { call compile _code };        
    } forEach _obj;

    sleep 10;
};
