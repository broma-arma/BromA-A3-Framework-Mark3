/*
================================================================================

NAME:
    BRM_ChairPlugin_initChair
    
AUTHOR(s):
    Nife

DESCRIPTION:
    Initializes all variables and actions to a chair object.
    
PARAMETERS:
    Chair (OBJECT)

USAGE:
    myChairObject call BRM_ChairPlugin_initChair
    
RETURNS:
    Nothing.

================================================================================
*/

_this setVariable ["chair_occupied", false, true];
_this addAction ["<t color='#0099FF'>Sit down</t>",{ _this spawn BRM_ChairPlugin_fnc_chairSitDown },nil,0.5,true,true,"'", take_chair_cond];
_this addAction ["<t color='#0099FF'>Pick up chair</t>",{ _this spawn BRM_ChairPlugin_fnc_chairPickUp },nil,0.5,true,true,"'", take_chair_cond];