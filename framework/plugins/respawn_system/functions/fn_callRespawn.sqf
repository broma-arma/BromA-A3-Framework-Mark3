/*
================================================================================

NAME:
    BRM_RespawnSystem_fnc_callRespawn

AUTHOR(s):
    Nife

DESCRIPTION:
    Revives either a player who was previously dead, or any number of
    units.

PARAMETERS:
    0 - Who to revive - maybe either a STRING with a player's in-game name,
    or the amount of players who will be revived.
    1 - (OPTIONAL) How many lives they will get. If left blank
    default parameter number will be used. (NUMBER)
    
USAGE:
    ["Nife",2"] spawn BRM_RespawnSystem_fnc_callRespawn;
    
    [4] spawn BRM_RespawnSystem_fnc_callRespawn;
    
RETURNS:
    Nothing.

================================================================================
*/

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
        mission_dead_players = mission_dead_players - [[(mission_players_lives select _index) select 0, _target, (mission_dead_players select _index) select 2]];
        publicVariable "mission_dead_players";
    };
    case "SCALAR": {
        _amount = 0;
        for "_i" from 0 to (_target-1) do {
            if (_i < count mission_dead_players) then {
                [(mission_dead_players select _i) select 1, _lives] call BRM_RespawnSystem_fnc_setLives;                
                    
                mission_dead_players = mission_dead_players - [[(mission_dead_players select _i) select 0, (mission_dead_players select _i) select 1, (mission_dead_players select _i) select 2]];
                publicVariable "mission_dead_players";      
                _amount = _amount + 1;
            };
        };
        if (_amount > 0) then {
            _message = "%1 units have respawned.";

            [-1, {
                ["Alert",[format [_this select 0, _this select 1]]] call BIS_fnc_showNotification 
            }, [_message, _amount]] call CBA_fnc_globalExecute;        
        };
    };
};