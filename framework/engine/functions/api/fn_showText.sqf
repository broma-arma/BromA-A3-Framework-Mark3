/*
================================================================================

NAME:
    BRM_fnc_showText
    
AUTHOR(s):
    Nife

DESCRIPTION:
    Shows text in an organized and timed fashion.
    
PARAMETERS:
    n Screens to display (ARRAY):
        0 - Text to show (STRING)
        1 - Type of title (STRING)
        2 - How long to display (NUMBER)

USAGE:
    [
        ["This is an intro...", "BLACK FADED", 3], 
        ["And it just ended!", "PLAIN", 5]
    ] spawn BRM_fnc_showText
    
RETURNS:
    All titles have been displayed. (BOOLEAN)

================================================================================
*/

{
    titleText [(_x select 0), (_x select 1)];
    sleep (_x select 2);
} forEach _this;

titleText ["", "PLAIN"];

true