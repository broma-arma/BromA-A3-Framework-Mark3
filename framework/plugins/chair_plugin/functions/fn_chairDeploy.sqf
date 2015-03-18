/*
================================================================================

NAME:
    BRM_ChairPlugin_chairDeploy
    
AUTHOR(s):
    Nife

DESCRIPTION:
    Puts down a chair a unit might be carrying.
    
PARAMETERS:
    0 - Player (OBJECT)

USAGE:
    [player] spawn BRM_ChairPlugin_chairDeploy
    
RETURNS:
    Nothing.

================================================================================
*/

_unit = _this;

_unitChair = _unit getVariable ["chair_holding", "nothing"];

player removeaction deployChair;

_chair = _unitChair createVehicle (position player);
_eyePos = (ASLtoATL eyePos player);
_eyePos set [2, 0.8];
_pos = _eyePos vectorAdd ( positionCameraToWorld [0,0,1] vectorDiff positionCameraToWorld [0,0,0]);
_chair setPos _pos;
_chair setDir (getDir _unit) - 180;

[_chair,"BRM_ChairPlugin_fnc_initChair",true,true] spawn BIS_fnc_MP;

_unit setVariable ["chair_holding", "nothing", false];