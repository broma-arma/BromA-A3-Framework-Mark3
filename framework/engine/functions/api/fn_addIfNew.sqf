/*
================================================================================

NAME:
    BRM_fnc_addIfNew
    
AUTHOR(s):
    Nife

DESCRIPTION:
    Adds an item to an array if it doesn't currently exists in it - otherwise
    replaces the current index.
    
PARAMETERS:
    0 - Item to add (ANY)
    1 - Array (ARRAY)

USAGE:
    ["Nife", myArrayOfPlayers] call BRM_fnc_addIfNew
    
RETURNS:
    Index of the item.

================================================================================
*/

_item = _this select 0;
_array = _this select 1;

_index = (count _array);

{ if ((_x select 0) == _item) then { _index = _forEachIndex } } forEach _array;

_array set [_index, _item];

_index