/*
================================================================================

NAME:
    BRM_RespawnSystem_fnc_callRespawnSide

AUTHOR(s):
    Nife

DESCRIPTION:
    Revives either a player who was previously dead, or any number of
    units, filtered by side.

PARAMETERS:
    0 - Side to revive
    1 - Number of players
    2 - (OPTIONAL) Number of lives to give to players revived
    
USAGE:
    [west, 5] spawnBRM_RespawnSystem_fnc_callRespawnSide;
    
    [side_a_side, 10, 1] spawn BRM_RespawnSystem_fnc_callRespawnSide;
    
RETURNS:
    Nothing.

================================================================================
*/

private["_lives"];

_side = _this select 0;
_amount = _this select 1;
_am = _amount;

if (count _this > 2) then {
    _lives = _this select 2;
} else {
    _lives = mission_player_lives;
};

{
    if ((_x select 2) == _side) then {
        if (_amount == 0) exitWith {};
        [_x select 1, _lives] call BRM_RespawnSystem_fnc_setLives;

        mission_dead_players = mission_dead_players - [[_x select 0, _x select 1, _x select 2]];
        publicVariable "mission_dead_players";
        _amount = _amount - 1;
    };    
} forEach mission_dead_players;

private ["_message"];

_alert = "Alert";

switch (_side) do {
    case WEST: { _message = "%1 BLUFOR units have respawned."; _alert = "AlertBLU" };
    case EAST: { _message = "%1 OPFOR units have respawned."; _alert = "AlertOP" };
    case RESISTANCE: { _message = "%1 INDFOR units have respawned."; _alert = "AlertIND" };
    case CIVILIAN: { _message = "%1 CIVILIAN units have respawned." };
};

_respawned = _am - _amount;

if (_respawned > 0) then {
    [-1, {
        [_this select 2,[format [_this select 0, _this select 1]]] call BIS_fnc_showNotification 
    }, [_message, _respawned, _alert]] call CBA_fnc_globalExecute;
};