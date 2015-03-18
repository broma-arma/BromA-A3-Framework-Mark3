/*
================================================================================

NAME:
    BRM_ChairPlugin_canHoldChair
    
AUTHOR(s):
    Nife

DESCRIPTION:
    Checks if the unit can hold a chair.
    
PARAMETERS:
    Player OBJECT

USAGE:
    player call BRM_ChairPlugin_canHoldChair
    
RETURNS:
    Nothing.

================================================================================
*/

((speed _this < 15) && (alive _this) && (vehicle _this == _this))