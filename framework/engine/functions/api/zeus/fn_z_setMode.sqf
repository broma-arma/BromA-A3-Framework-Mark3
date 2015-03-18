/*
================================================================================

NAME:
    BRM_fnc_z_setMode
    
AUTHOR(s):
    Nife

DESCRIPTION:
    Changes the combat mode of all units currently selected by Zeus.
    
PARAMETERS:
    0 - Combat mode (STRING)
    1 - Behavior (STRING)
    2 - (OPTIONAL) Side to filter units. (SIDE)

USAGE:
    While in Zeus mode, select the desired units first.
    
    ["GREEN", "SAFE"] spawn BRM_fnc_z_setMode
    ["RED", "STEALTH", east] spawn BRM_fnc_z_setMode
    
RETURNS:
    Nothing.

================================================================================
*/

private["_combat","_behav","_side"];

_combat = toUpper(_this select 0);
_behav = toUpper(_this select 1);

_side = nil;
if (count _this > 2) then { _side = _this select 2 };

_units = (curatorSelected select 0);

if ( (count _units) > 0) then {
    {
        if (count _this > 2) then {
            if (side _x == _side) then {
                [-2, {
                    (group (_this select 0)) setCombatMode (_this select 1);
                    (group (_this select 0)) setBehaviour (_this select 2);
                }, [_x,_combat,_behav]] call CBA_fnc_globalExecute;
            };
        } else {
            [-2, {            
                (group (_this select 0)) setCombatMode (_this select 1);
                (group (_this select 0)) setBehaviour (_this select 2);
            }, [_x,_combat,_behav]] call CBA_fnc_globalExecute;
        };
    } forEach _units;
};