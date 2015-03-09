// F3 - Automatic Body Removal
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// RUN THE SCRIPT ONLY SERVER SIDE AND ON HEADLESS CLIENT

if (!isServer && hasInterface) exitWith {};

_path = _this select 0;

f_fnc_removeBody = compile preprocessFileLineNumbers (_path+"fn_removeBody.sqf");
f_fnc_nearPlayer = compile preprocessFileLineNumbers (_path+"fn_nearPlayer.sqf");

// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_men","_str_Men","_handle"];

// ====================================================================================

// SET KEY VARIABLES
// Using a common variable, we will create an array containing all men, minus playable units.

_men = allUnits - playableUnits;

// ====================================================================================

// PREVENT UNTIS FROM BEING REMOVED
// All units in the corresponding array are flagged to never be removed
if (isNil "f_var_doNotRemoveBodies") then {f_var_doNotRemoveBodies = []};

{
	if (!isNil format ["%1",_x]) then {_x setVariable ["f_removeBodyEH",true];};
} forEach f_var_doNotRemoveBodies;

// ====================================================================================

// ADD EVENT HANDLER
// A killed event handler is added to all units in the array _men that are not part of the exempt group

{
    _handle = _x getVariable ["f_removeBodyEH",false];
    if !(_handle && local _x) then {
        _x addEventHandler ["killed", {(_this select 0) spawn f_fnc_removeBody}];
        _x setVariable ["f_removeBodyEH",true];
    };
} forEach _men;


// ====================================================================================