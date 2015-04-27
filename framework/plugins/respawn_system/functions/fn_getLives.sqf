private["_unit","_playerid","_found","_index","_return"];

waitUntil{!(isNil"mission_player_lives")};

_unit = _this select 0;

_playerID = getPlayerUID _unit;

_found = false;
_index = 0;

_unitLives = mission_player_lives;

switch (side _unit) do {
    case (side_a_side): {
        if (mission_lives_side_a > -1) then {
            _unitLives = mission_lives_side_a;
        };
    };
    case (side_b_side): {
        if (mission_lives_side_b > -1) then {
            _unitLives = mission_lives_side_b;
        };
    };
    case (side_c_side): {
        if (mission_lives_side_c > -1) then {
            _unitLives = mission_lives_side_c;
        };
    };     
};

{
    if ((_x select 0) == (_playerID)) exitWith { _found = true; _index = _forEachindex };
} forEach mission_players_lives;

if (_found) then {
    _return = (((mission_players_lives) select _index) select 2);
    _return
} else {
    mission_players_lives pushBack [_playerID, name _unit, _unitLives];
    publicVariable "mission_players_lives";
    _return = ((mission_players_lives select _index) select 2);
    _return
};