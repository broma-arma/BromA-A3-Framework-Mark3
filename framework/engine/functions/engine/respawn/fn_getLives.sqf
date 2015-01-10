private["_unit","_playerid","_found","_index","_return"];

waitUntil{!(isNil"mission_player_lives")};

_unit = _this select 0;

_playerID = getPlayerUID _unit;

_found = false;
_index = 0;

{
    if ((_x select 0) == (_playerID)) exitWith { _found = true; _index = _forEachindex };
} forEach playerLives;

if (_found) then {
    _return = (((playerLives) select _index) select 2);
    _return
} else {
    playerLives pushBack [_playerID, name _unit, mission_player_lives];
    publicVariable "playerLives";
    _return = ((playerLives select _index) select 2);
    _return
};