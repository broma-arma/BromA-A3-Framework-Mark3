private["_unit","_playerid","_found","_index","_return"];

waitUntil{!(isNil"mission_player_lives")};

_unit = _this select 0;

_playerID = getPlayerUID _unit;

_found = false;
_index = 0;

{
    if ((_x select 0) == (_playerID)) exitWith { _found = true; _index = _forEachindex };
} forEach mission_players_lives;

if (_found) then {
    _return = (((mission_players_lives) select _index) select 2);
    _return
} else {
    mission_players_lives pushBack [_playerID, name _unit, mission_player_lives];
    publicVariable "mission_players_lives";
    _return = ((mission_players_lives select _index) select 2);
    _return
};