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

	CSSA3_fnc_addToJIP = {
		private ["_playerNetID","_CSSA3_UID","_player","_currentTime"];

		if (isServer) then
		{
			_playerNetID = _this select 0;
			_player = objectFromNetId _playerNetID;
			_CSSA3_UID = getPlayerUID _player;
			_currentTime = time;

			if (_currentTime <= CSSA3_timeToJIP) then {
				if !(_CSSA3_UID in CSSA3_beforeJIPClients) then
				{
					CSSA3_beforeJIPClients pushBack _CSSA3_UID;
				};
			};

			if !(CSSA3_allowJIP) exitWith
			{
				if ((_currentTime > CSSA3_timeToJIP) && {!(_CSSA3_UID in CSSA3_beforeJIPClients)}) then
				{
                                    forceRespawn _player;
				};
			};
		};
	};
};

//Player Init
if (hasInterface) then {

    0 spawn {
	//Wait until player is no longer null
	waitUntil {(!isNull player) && {alive player}};
	CSSA3_playerSide = side player;
	sleep 0.1;

	//Add player UID to array of players who joined before out of time (_timeToJIP).
	_sentArray = [[netID player],"CSSA3_fnc_addToJIP",false,false,false] call bis_fnc_MP;

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