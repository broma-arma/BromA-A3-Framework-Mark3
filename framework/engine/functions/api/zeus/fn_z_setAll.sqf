/*
================================================================================

NAME:
    BRM_fnc_z_setAll
    
AUTHOR(s):
    Nife

DESCRIPTION:
    Changes the relevant attributes of all units currently selected by Zeus.
    
PARAMETERS:
    0 - Loadout (STRING)
    1 - Skill (NUMBER)
    2 - Combat mode (STRING)
    3 - Behavior (STRING)
    4 - (OPTIONAL) Side to filter units. (SIDE)

USAGE:
    While in Zeus mode, select the desired units first.
    
    ["RACS", 0.3, "GREEN", "ALERT", west] spawn BRM_fnc_z_setMode
    
RETURNS:
    Nothing.

================================================================================
*/

private["_combat","_behav","_skill","_loadout","_side"];

_loadout = _this select 0;
_skill = _this select 1;
_combat = toUpper(_this select 2);
_behav = toUpper(_this select 3);

_side = nil;
if (count _this > 4) then { _side = _this select 4 };

_units = (curatorSelected select 0);

if ( (count _units) > 0) then {
    {
        if (count _this > 4) then {
            if (side _x == _side) then {
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
            };
        } else {
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
        };
    } forEach _units;
};