/*
================================================================================

NAME:
    BRM_fnc_verboseArray
    
AUTHOR(s):
    Nife

DESCRIPTION:
    Converts an array into an english reading format.
    
PARAMETERS:
    0 - Array (ARRAY)

USAGE:
    myReadArray = [["Nife","Royal","Knite"]] call BRM_fnc_colorToHex
    >> "Nife, Royal and Knite"
    
RETURNS:
    Verbosed array (STRING)    

================================================================================
*/

_array = _this select 0;
_str = "";
{
    _punct = ", ";
    if (_forEachIndex+2 == (count _array)) then { _punct = " and " };
    if (_forEachIndex+1 == (count _array)) then { _punct = "" };
    _str = _str + _x + _punct;
} forEach _array;
_str