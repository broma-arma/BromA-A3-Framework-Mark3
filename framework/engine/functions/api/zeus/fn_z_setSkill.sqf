private["_loadout","_size","_side","_return"];

_skill = _this select 0;
_size = _this select 1;

_side = nil;
if (count _this > 2) then { _side = _this select 2; };

_units = (curatorSelected select 0);

if ( (count _units) > 0) then {
    {
        [-2, {            
            (_this select 0) setSkill (_this select 1);
        }, [_x,_skill]] call CBA_fnc_globalExecute;
    } forEach _units;
};