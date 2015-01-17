/*
	Author: Cyrokrypto

	Description:
	- Checks wether the calss exists and compiles and calls sent code.

	Parameter(s):
	0 : String - Location class inherits from (CfgPatches)
	1 : String - Name of class.
	2 : String - Code that must be compiled called.

	Execution:
	["forced"] spawn CSSA3_fnc_createSpectateDialog;

	Returns:
	NOTHING
*/


private "_className";
_className = _this select 1;

if (isClass(configFile >> (_this select 0) >> _className)) then {
	diag_log text ("[CSSA3 Notice]: Detected " + _className);
	call compile (_this select 2);
};