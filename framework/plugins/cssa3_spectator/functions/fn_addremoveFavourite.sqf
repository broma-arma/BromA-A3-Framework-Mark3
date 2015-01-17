/*
	Author: Cyrokrypto

	Description:
	- Adds or removed a unit from the favourites list. (CSSA3_favourites array)

	Parameter(s):
	0 : Object - Unit to be added/removed.

	Returns:
	NOTHING
*/

private "_unitName";

_unitName = _this select 0;

//If _unitName is not of type OBJECT or if empty vehicle.
if ((!(typename _unitName in ["OBJECT"]))||{count crew _unitName == 0}) exitWith {diag_log text "Can not add non-object to favourites. (fn_addremoveFavourite)"};

//If _unitname is vehicle, change _unitName to owner of vehicle instead of the vehicle itself. (_unit != vehicle _uni)
if (_unitName in vehicles) then {_unitName = [str _unitName] call CSSA3_fnc_strToUnit};

//Debug
//hint format ["%1, %2, %3", _unitName, _unitName in CSSA3_favourites, vehicle _unitName in CSSA3_favourites];

//Add or remove unit from CSSA3_favourites dependent on whether it is already in the array.
if (_unitName in CSSA3_favourites) then {
	CSSA3_favourites = CSSA3_favourites - [_unitName];
} else {
	CSSA3_favourites pushBack _unitName;
};

//Update the unit list.
[] spawn CSSA3_fnc_updateUnitList;