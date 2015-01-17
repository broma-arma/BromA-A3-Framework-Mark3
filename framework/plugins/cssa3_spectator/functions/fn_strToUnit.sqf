/*
	Author: Cyrokrypto

	Description:
	- Converts a string to a unit.

	Parameter(s):
	0 : string - Unit name as string.

	Returns:
	Unit, objNull if unit does not exist.
*/

private "_result";
_result = objNull;
{
	if (str _x == _this select 0) exitWith {_result = _x};
} count CSSA3_spectatableUnits;

_result;