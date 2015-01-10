private["_lives"];

_target = _this select 0;

if (count _this > 1) then {
    _lives = _this select 1;
} else {
    _lives = mission_player_lives;
};

switch (typeName _target) do {
    case "STRING": {
        _found = false;
        _index = 0;

        {
            if ((_x select 1) == (_target)) exitWith { _found = true; _index = _forEachindex };
        } forEach playerLives;
        
        if (_found) then {
            playerLives set [_index, [(playerLives select _index) select 0, _target, _lives]];
            publicVariable "playerLives";
            
            deadPlayersArray = deadPlayersArray - [[(playerLives select _index) select 0, _target]];
            publicVariable "deadPlayersArray";
        };
    };
    case "SCALAR": {
        for "_i" from 0 to (_target-1) do {            
            if (_i <= count deadPlayersArray) then {
                deadPlayersArray = deadPlayersArray - [[(deadPlayersArray select _i) select 0, (deadPlayersArray select _i) select 1]];
                publicVariable "deadPlayersArray";
            };
        };
    };
};