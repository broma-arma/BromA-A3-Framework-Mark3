private ["_unit","_attacker","_damage","_sideUnit","_sideAtk","_isUncon"];

_unit = _this select 0;
_attacker = _this select 1;
_damage = _this select 2;

_sideUnit = side _unit;
_sideAtk = side _attacker;

_limit = 0.2;

if ((vehicle _unit) == (vehicle _attacker)) exitWith {};

if ((name _attacker) == "Error: No Unit") exitWith {};

if (_damage > _limit) then {    

    if ((_sideUnit == _sideAtk)&&(!(name _unit == name _attacker))) exitWith {
        
        [-2, {             
            _attacker = (_this select 0);
            _unit= (_this select 1);
            _msg = format ["FRIENDLY FIRE: %2 has wounded %1!",name _unit, name _attacker];

            _unit globalchat _msg;
        }, [_attacker, _unit]] call CBA_fnc_globalExecute;
        
        [-1, { _this addScore -2 }, _attacker] call CBA_fnc_globalExecute;
    };
};