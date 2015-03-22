/*
================================================================================

NAME:
    BRM_fnc_endingGetContext
    
AUTHOR(s):
    Nife

DESCRIPTION:
    Decides based on the current ending whether the player is considered
    victorious or not.

PARAMETERS:
    None.
    
USAGE:
    [] call BRM_fnc_endingGetContext;
    
RETURNS:
    Nothing.

================================================================================
*/

private["_titleColor"];

// Stringifies both sides and colors them accordingly.

_fncStringSides = {
    _str = "";
    {        
        _name = [_x,"name"] call BRM_fnc_getSideInfo;
        _punct = ", ";
        if (_forEachIndex+2 == (count _this)) then { _punct = " and " };
        if (_forEachIndex+1 == (count _this)) then { _punct = "" };
        _str = _str + _name + _punct;
    } forEach _this;
    _str
};

_fncStringSidesColor = {
    _str = "";
    {
        _color = [_x,"color"] call BRM_fnc_getSideInfo;
        _color = [_color] call BRM_fnc_colorToHex;
        _name = [_x,"name"] call BRM_fnc_getSideInfo;
        _punct = ", ";
        if (_forEachIndex+2 == (count _this)) then { _punct = " and " };
        if (_forEachIndex+1 == (count _this)) then { _punct = "" };
        _str = _str + "<t color='" + _color + "'>" + _name + "</t>" + _punct;
    } forEach _this;
    _str
};

// Sets the values to the relevant variables.

_side = player getVariable ["unit_side", side player];

_success = ((_side in (mission_ending_details select 0)) && !(_side in (mission_ending_details select 1)));

if (_success) then { _titleColor = "green" } else { _titleColor = "red" };

mission_ending_personal = [_success, _titleColor];

if (count (mission_ending_details select 0) > 0) then { 
    mission_ending_details set [0, [(mission_ending_details select 0) call _fncStringSides, (mission_ending_details select 0) call _fncStringSidesColor]];
};

if (count (mission_ending_details select 1) > 0) then { 
    mission_ending_details set [1, [(mission_ending_details select 1) call _fncStringSides, (mission_ending_details select 1) call _fncStringSidesColor]];
};