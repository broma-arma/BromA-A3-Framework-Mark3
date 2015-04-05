/*
================================================================================

NAME:
    BRM_fnc_endingScreen
    
AUTHOR(s):
    Nife

DESCRIPTION:
    After all stats and personal context is calculated, display everything
    in a formatted fashion to the player.

PARAMETERS:
    None.
    
USAGE:
    [] spawn BRM_fnc_endingScreen;
    
RETURNS:
    Nothing.

================================================================================
*/

// Closes all dialogs ==========================================================

if (dialog) then { closeDialog 0 };

_title = (mission_ending_details select 3);
_reasonColor = format [(mission_ending_details select 4), (mission_ending_details select 0) select 1, (mission_ending_details select 1) select 1, (mission_ending_details select 6)];
_reason = format [(mission_ending_details select 4), (mission_ending_details select 0) select 0, (mission_ending_details select 1) select 0, (mission_ending_details select 6)];
_color = [mission_ending_personal select 1] call BRM_fnc_colorToHex;

// How long to display the screen ==============================================

_displayTime = 15;

// How to format time. =========================================================

_time = [time, "H:MM:SS"] call CBA_fnc_formatElapsedTime;

_thirdSideStats = "";

if (mission_enable_side_c) then {
    _thirdSideStats = format ["|| %1 casualties: %2", side_c_name, mission_dead_side_c];
};

// Formats a player's final score. =============================================

_personalScore = format ["PERSONAL SCORE: %1 kills and %2 deaths. ", player getVariable ["unit_score",0], player getVariable ["unit_deaths",0]];

_endingScreen = format [
// =============================================================================
//                            Ending message:                                  |
//   Note: the "\n\n" symbols are used to break the message into a new line,   |
//              and the "+" are used to concatenate them.                      |
// =============================================================================

                          "=======  %1  =======" + "\n\n"
    +                              "%2" + "\n\n"                       // The margin.
    +                      "MISSION STATS:\n\n"
    +           "%3 casualties: %4  ||  %5 casualties: %6 %7" + "\n\n" // Here we take the each side name and the number of casualties
    +                           "%8" + "\n\n"
    +                     "TIME PLAYED: %9 \n\n"                       // Now we show the time played with the hours, minutes and seconds
    +                  "===========================",
    
// =============================================================================
//              Variables being used:
// Note: If you want to add more variables to be used, remember that after declaring
// it below, it'll become %x, x being the current number of variables +1.

//    %1       %2        %3             %4                %5                %6             %7
    _title, _reason, side_a_name, mission_dead_side_a, side_b_name, mission_dead_side_b, _thirdSideStats, _personalScore, _time];  
// =============================================================================

// =============================================================================
_msg = format ["
<t size='1.3' color='%3'>%1</t><br/>
<t size='0.8' color='#FFFFFF'>- %2 -</t>"
,_title, _reasonColor, _color];
// =============================================================================

// Displays the ending screen. =================================================

sleep 3;

[_msg,-1,-1,15,1] call BIS_fnc_dynamicText;

[""] call BIS_fnc_dynamicText;

titleText ["", "BLACK"];
titleText [_endingScreen, "BLACK"];

sleep _displayTime;

titleText [" ", "PLAIN DOWN", 2];