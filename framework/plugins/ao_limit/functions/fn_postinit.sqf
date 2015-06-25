/*
Written by beta
Ideas from Sandiford
Does not allow a player to leave the AO
*/

if !(hasInterface) exitWith {};

0 spawn {
    
if (player_is_spectator) exitWith {};

private ["_sleep", "_pos", "_aoPos", "_player"];

_pos = [0,0,0];
_aoPos = [(getMarkerPos "ao") select 0, (getMarkerPos "ao") select 1, 0];
_sleep = 1;

#include "includes\settings.sqf"

while {(alive player)} do {
    _player = vehicle player;
    _isDead = player getVariable ["isDead",false];
    
    if (!_isDead) then {
        if (_player isKindOf "Land") then {

            if (!([getPos _player, "ao"] call CBA_fnc_inArea)) then {
                _pos = [getPos _player, 1, ([_player, _aoPos] call BIS_fnc_dirTo)] call BIS_fnc_relPos;
                _sleep = 0.1;

                call left_ao_do;
            }
            else { _sleep = 1 };
        };
    };

    sleep _sleep;
};

};