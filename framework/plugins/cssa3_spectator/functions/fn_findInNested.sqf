//Finds value in a nested array
private ["_findThis", "_found"];
//Returns index.
//If nothing is found, returns -1;
_findThis = _this select 0;
_found = -1;

{	//_x == Nested array.
	if (_findThis in _x) exitWith {_found == _forEachIndex};
} forEach (_this select 1);

_found;