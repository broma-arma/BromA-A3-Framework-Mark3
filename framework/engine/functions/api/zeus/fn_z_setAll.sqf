private["_combat","_behav","_skill","_loadout","_size","_side","_return"];

_loadout = _this select 0;
_skill = _this select 1;
_combat = toUpper(_this select 2);
_behav = toUpper(_this select 3);
_size = _this select 4;

_side = nil;
if (count _this > 5) then { _side = _this select 5; };

_units = (curatorSelected select 0);

if ( (count _units) > 0) then {
    {
        [-2, {
            _unit = _this select 0;
            _loadout = _this select 1;
            _skill = _this select 2;
            _combat = _this select 3;
            _behav = _this select 4;
                        
            [_loadout,_unit] call FNC_arsenalLoadout;
            _unit setSkill _skill;
            (group _unit) setCombatMode _combat;
            (group _unit) setBehaviour _behav;
            
        }, [_x,_loadout,_skill,_combat,_behav]] call CBA_fnc_globalExecute;        
    } forEach _units;
};