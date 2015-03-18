/*
================================================================================

NAME:
    BRM_ChairPlugin_chairStandUp
    
AUTHOR(s):
    Nife

DESCRIPTION:
    Makes a unit stand up from a chair, resetting both their states.
    
PARAMETERS:
    0 - Chair (OBJECT)
    1 - Player (OBJECT)

USAGE:
    [objChair, player] spawn BRM_ChairPlugin_chairStandUp
    
RETURNS:
    Nothing.

================================================================================
*/

_this = _this select 3;

_chair = _this select 0; 
_unit = _this select 1; 

_unit enableSimulation true;
[[_unit, ""], "MAC_fnc_switchMove"] spawn BIS_fnc_MP;
_unit removeaction standChair;

_chair setVariable ["chair_occupied", false, true];
_unit setVariable ["unit_sitting", false, false];