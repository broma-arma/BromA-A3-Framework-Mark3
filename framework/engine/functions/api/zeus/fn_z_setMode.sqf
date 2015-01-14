private["_combat","_behav","_size","_side","_return"];

_combat = toUpper(_this select 0);
_behav = toUpper(_this select 1);
_size = _this select 2;

_side = nil;
if (count _this > 3) then { _side = _this select 3; };

_units = (curatorSelected select 0);

if ( (count _units) > 0) then {
    {
        [-2, {            
            (group (_this select 0)) setCombatMode (_this select 1);
            (group (_this select 0)) setBehaviour (_this select 2);
        }, [_x,_combat,_behav]] call CBA_fnc_globalExecute;
    } forEach _units;
};