private["_lives"];

_target = _this select 0;

if (count _this > 1) then {
    _lives = _this select 1;
} else {
    _lives = mission_player_lives;
};

switch (typeName _target) do {
    case "STRING": {
        _index = [_target, _lives] call BRM_RespawnSystem_fnc_setLives;
        mission_dead_players = mission_dead_players - [[(mission_players_lives select _index) select 0, _target]];
        publicVariable "mission_dead_players";
    };
    case "SCALAR": {
        for "_i" from 0 to (_target-1) do {
            if (_i <= count mission_dead_players) then {
                [(mission_dead_players select _i) select 1, _lives] call BRM_RespawnSystem_fnc_setLives;                
                    
                mission_dead_players = mission_dead_players - [[(mission_dead_players select _i) select 0, (mission_dead_players select _i) select 1]];
                publicVariable "mission_dead_players";                                
            };
        };
    };
};