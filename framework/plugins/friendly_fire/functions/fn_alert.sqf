private ["_unit","_attacker","_damage","_sideUnit","_sideAtk","_isUncon"];

#include "includes\settings.sqf"

_unit = _this select 0;
_attacker = _this select 1;
_damage = _this select 2;

_sideUnit = _unit getVariable ["unit_side", side _unit];
_sideAtk = _attacker getVariable ["unit_side", side _attacker];

_limit = 0.2;

if ((vehicle _unit) == (vehicle _attacker)) exitWith {};

if ((name _attacker) == "Error: No Unit") exitWith {};

if (((!isPlayer _unit)||(!isPlayer _attacker))&&(!friendly_fire_count_AI)) exitWith {};

if (_damage > _limit) then {
        
    if ((_sideUnit == _sideAtk)&&(!(name _unit == name _attacker))) exitWith {
        
        _msg = format ["FRIENDLY FIRE: %2 has wounded %1!",name _unit, name _attacker];
        
        _msg spawn {
            sleep (friendly_fire_timer_minutes*60);
            ["ALL", "CHAT", _this] call BRM_fnc_doLog;
        };
        
        [_attacker,-2] call BIS_fnc_addScore;
    };
};