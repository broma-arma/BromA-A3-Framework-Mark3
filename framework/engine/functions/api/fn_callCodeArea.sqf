/*
================================================================================

NAME:
    BRM_fnc_callCodeArea
    
AUTHOR(s):
    Nife

DESCRIPTION:
    Executes code on all units inside a trigger area. Call this from a trigger init field.
    
PARAMETERS:
    0 - thisTrigger (TRIGGER)
    1 - Filter (STRING that evaluates as an EXPRESSION)
    2 - Code to be executed (STRING that evaluates as CODE)

USAGE:
    ON A TRIGGER'S INIT FIELD (make sure you set the condition to TRUE):
    
    _nul = [thisTrigger, "(side _x == east)", "[_x, 'side_b'] call BRM_fnc_initAI"] spawn BRM_fnc_callCodeArea
    _nul = [thisTrigger, "(side _x == civilian) && (alive _x)", "[_x, 'RACS'] call BRM_fnc_initAI"] spawn BRM_fnc_callCodeArea
    
RETURNS:
    All titles have been displayed. (BOOLEAN)

================================================================================
*/

_trg = _this select 0;
_filter = _this select 1;
_code = _this select 2;

_trg setTriggerActivation ["ANY", "PRESENT", false];

waitUntil{(time > 1)};

_selected = [];

{
    call compile format ["_pass = false; if (%1) then { _pass = true }; if (_pass) then { _selected pushBack _x };", _filter];
} forEach (list _trg);

{ call compile format ["%1", _code] } forEach _selected;