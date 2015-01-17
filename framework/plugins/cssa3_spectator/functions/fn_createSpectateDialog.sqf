/*
	Author: Cyrokrypto

	Description:
	- Opens the spectate dialog. Checks wether dialog is already open.

	Parameter(s):
	_mode : String - "killed" = Player killed. "respawn" = On player respawned.

	Execution:
	["forced"] spawn CSSA3_fnc_createSpectateDialog;

	Returns:
	NOTHING
*/

private ["_mode","_cam"];

_mode = _this select 0;

//On player killed.
if (_mode == "killed") exitWith
{
	sleep 5;
	if (alive player) exitWith {diag_log text "[CSSA3 Error]: Player not dead."};
	if (!isNull (findDisplay 7810)) exitWith {diag_log text "[CSSA3 Error]: Display already exists."};

	diag_log text "[CSSA3 Notice]: Startup conditions met. Starting.";
	createDialog "CSSA3_openMain";
	waitUntil {!(isNull (findDisplay 7810))};

	['Init'] call CSSA3_fnc_mainSpectateFunctions;
};

//On player respawn.
if (_mode == "respawn") exitWith
{
	if (!isNull (findDisplay 7810)) then {closeDialog 0};

	if (!isNil {CSSA3_LMB}) then {
		['Exit'] call CSSA3_fnc_mainSpectateFunctions;
	};
};

//Force spectator script to open.
if (_mode == "forced") exitWith {
	if (isNull (findDisplay 7810)) then {
		createDialog "CSSA3_openMain";
		waitUntil {!(isNull (findDisplay 7810))};

		['Init'] call CSSA3_fnc_mainSpectateFunctions;
	};
};