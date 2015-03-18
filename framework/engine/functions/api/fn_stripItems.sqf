/*
================================================================================

NAME:
    BRM_fnc_stripItems
    
AUTHOR(s):
    Nife

DESCRIPTION:
    Remove all items from a unit object.

PARAMETERS:
    0 - Unit (OBJECT)
    
USAGE:
    [player] call BRM_fnc_stripItems
    
RETURNS:
    Nothing.

================================================================================
*/

_unit = _this select 0;

removeallweapons _unit;
removeallitems _unit;
clearAllItemsFromBackpack _unit;
clearWeaponCargo _unit;
clearmagazinecargo _unit;
removeAllAssignedItems _unit;
removeBackpack _unit;
removeuniform _unit;
removeVest _unit;
removeGoggles _unit;
removeHeadgear _unit;