_deps = _this select 0;
_ret = true;

if ((count _deps) == 0) exitWith { true };

{    
    call compile format ["
    waitUntil{!(isNil {%1})};
    
    _validDep = ((typeName %1 == 'SCRIPT')||(typeName %1 == 'BOOL'));    
    if (!_validDep) exitWith {};
    
    switch (typeName %1) do {
        case 'SCRIPT': { if (!(scriptDone %1)) then { _ret = false } };
        case 'BOOL': { if (!(%1)) then { _ret = false } };
        default { _ret = false };
    };
    ", _x];

} forEach _deps;

_ret