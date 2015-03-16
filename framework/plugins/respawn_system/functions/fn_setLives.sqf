private["_lives","_target"];

_target = _this select 0;
_lives = _this select 1;

_found = false;
_index = -1;

if (typeName _target == "OBJECT") then { _target = name _target };

{
    if ( ((_x select 1) == (_target)) ) exitWith { _found = true; _index = _forEachindex };
} forEach mission_players_lives;

if (_found) then {
    mission_players_lives set [_index, [(mission_players_lives select _index) select 0, _target, _lives]];
    publicVariable "mission_players_lives";
};

_index