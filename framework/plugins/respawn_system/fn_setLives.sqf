private["_lives","_target"];

_target = _this select 0;
_lives = _this select 1;

_found = false;
_index = -1;

if (typeName _target == "OBJECT") then { _target = name _target };

{
    if ( ((_x select 1) == (_target)) ) exitWith { _found = true; _index = _forEachindex };
} forEach playerLives;

if (_found) then {
    playerLives set [_index, [(playerLives select _index) select 0, _target, _lives]];
    publicVariable "playerLives";
};

_index