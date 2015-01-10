private["_lives"];

_target = _this select 0;

if (count _this > 1) then {
    _lives = _this select 1;
} else {
    _lives = mission_player_lives;
};

switch (typeName _target) do {
    case "STRING": {
        _index = [_target, _lives] call BRM_fnc_setLives;
        deadPlayersArray = deadPlayersArray - [[(playerLives select _index) select 0, _target]];
        publicVariable "deadPlayersArray";
    };
    case "SCALAR": {
        for "_i" from 0 to (_target-1) do {
            if (_i <= count deadPlayersArray) then {
                [(deadPlayersArray select _i) select 1, _lives] call BRM_fnc_setLives;                
                    
                deadPlayersArray = deadPlayersArray - [[(deadPlayersArray select _i) select 0, (deadPlayersArray select _i) select 1]];
                publicVariable "deadPlayersArray";                                
            };
        };
    };
};