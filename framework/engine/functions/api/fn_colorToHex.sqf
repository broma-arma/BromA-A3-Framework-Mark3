/*
================================================================================

NAME:
    BRM_fnc_colorToHex
    
AUTHOR(s):
    Nife

DESCRIPTION:
    Converts a color name to its hexadecimal equivalent.
    
PARAMETERS:
    0 - Color name (STRING)

USAGE:
    myColor = ["red"] call BRM_fnc_colorToHex
    
RETURNS:
    Color hex code (STRING)

================================================================================
*/

private ["_ret"];

switch (_this select 0) do {
    case "green": { _ret = "#006600"; };
    case "red": { _ret = "#e00d0d" };
    case "blue": { _ret = "#0060ff" };
    case "yellow": { _ret = "#ffd800" };    
    case "white": { _ret = "#FFFFFF" };
    case "black": { _ret = "#000000" };
    default { _ret = "#FFFFFF" };
};

_ret