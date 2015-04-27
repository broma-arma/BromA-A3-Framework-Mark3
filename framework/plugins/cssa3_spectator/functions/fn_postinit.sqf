/*
	Author: Cyrokrypto

	Description:
	- CSSA3 init. Executes on mission start / Player join.
	- Needs to be tidied up.

	Parameter(s):
	_CSSA3_UID : String - Player UID
	_player : Object - Player

	Returns:
	NOTHING
*/

private ["_allowRejoin","_allowJIP","_timeToJIP","_allowJip", "_sentArray"];
_path = _this select 0;

CSSA3_version = 0.2;

//Server Init
if (isServer) then {
	CSSA3_beforeJIPClients = [];
	CSSA3_allowJIP = true;
	CSSA3_timeToJIP = 0;
};

//Player Init
if (hasInterface) then {

    0 spawn {
	//Wait until player is no longer null
	waitUntil {(!isNull player) && {alive player}};
	CSSA3_playerSide = side player;
	sleep 0.1;

	//Check if API vars are Nil.
	_defaultSides = [blufor,opfor,civilian,resistance];
	if (isNil {CSSA3_onlySpectatePlayers}) then {CSSA3_onlySpectatePlayers = false};
	if (isNil {CSSA3_allowedModes} || {count CSSA3_allowedModes < 1}) then {CSSA3_allowedModes = ["freeCam","firstPerson","thirdPerson"]};
	if (isNil {CSSA3_bluforSpectateable} || {count CSSA3_bluforSpectateable < 1}) then {CSSA3_bluforSpectateable = _defaultSides};
	if (isNil {CSSA3_opforSpectateable} || {count CSSA3_opforSpectateable < 1}) then {CSSA3_opforSpectateable = _defaultSides};
	if (isNil {CSSA3_civilianSpectateable} || {count CSSA3_civilianSpectateable < 1}) then {CSSA3_civilianSpectateable = _defaultSides};
	if (isNil {CSSA3_independentSpectateable} || {count CSSA3_independentSpectateable < 1}) then {CSSA3_independentSpectateable = _defaultSides};

	//Calculate player's spectateable units.
	_setSide = [] spawn {
		if (CSSA3_playerSide == blufor) exitWith {CSSA3_sideArray = CSSA3_bluforSpectateable};
		if (CSSA3_playerSide == opfor) exitWith {CSSA3_sideArray = CSSA3_opforSpectateable};
		if (CSSA3_playerSide == civilian) exitWith {CSSA3_sideArray = CSSA3_civilianSpectateable};
		if (CSSA3_playerSide == resistance) exitWith {CSSA3_sideArray = CSSA3_independentSpectateable};
	};
    };
};