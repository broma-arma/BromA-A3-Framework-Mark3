/*
	Author: Cyrokrypto

	Description:
	- Primary dialog and map update loop.

	Parameter(s):
	None

	Returns:
	NOTHING
*/

private ["_CSSA3_fnc_playersInGroup", "_players", "_groupIsLiving", "_alive", "_groupHasPlayer", "_hasPlayer", "_display", "_timeToRespawn", "_tempCSSA3_spectatableUnits", "_tempCSSA3_validGroupsArray", "_tempCSSA3_validGroupsDataArray", "_spectatableUnits", "_unitColour", "_colour", "_object_str", "_color", "_i"];

//Loop for updating dialog and player markers.
disableSerialization;

#define CSSA3_mapIDC                7911
#define CSSA3_TimeToRespawnIDC      79133

	_CSSA3_fnc_playersInGroup = {
		_players = [];
		{
			if ((alive _x) && {isPlayer _x}) then {_players pushBack _x};
		} forEach units (_this select 0);
		_players;
	};

	_groupIsLiving = {
		_alive = false;
		{
			if (alive _x) exitWith {_alive = true};
		} forEach units (_this select 0);
		_alive;
	};

	_groupHasPlayer = {
		_hasPlayer = false;
		{
			if ((alive _x) && {isPlayer _x}) exitWith {_hasPlayer = true;};
		} forEach units (_this select 0);
		_hasPlayer;
	};

for "_i" from 0 to 1 step 0 do
{
	_display = findDisplay 7810;

	//Loop while spectate display is open.
	if (!isNull _display) then {
		_timeToRespawn = 0;
		_tempCSSA3_spectatableUnits = [];
		_tempCSSA3_validGroupsArray = [];
		_tempCSSA3_validGroupsDataArray = [];

		{
			if ((side _x) in CSSA3_sideArray && {[_x] call _groupIsLiving}) then {

				//If only players may be spectated and specified group has no player, ignore this group.
				if (CSSA3_onlySpectatePlayers && {!([_x] call _groupHasPlayer)}) exitWith {};

				_spectatableUnits = [];
				_unitColour = [0.251,0.251,0.251,1];

				if (CSSA3_onlySpectatePlayers) then {
					_spectatableUnits = [_x] call _CSSA3_fnc_playersInGroup;
					{_tempCSSA3_spectatableUnits pushBack _x} forEach _spectatableUnits;

				} else {
					_spectatableUnits = units _x;
					{_tempCSSA3_spectatableUnits pushBack _x} forEach _spectatableUnits;
				};

				//Find colour of unit based on side.
				_colour = call {
					//#1919D1
					if (side _x == WEST) exitWith {_unitColour = [0.098,0.361,0.62,1]};
					if (side _x == EAST) exitWith {_unitColour = [0.502,0,0,1]};
					if (side _x == civilian) exitWith {_unitColour = [0.373,0.016,0.706,0.7]};
					if (side _x == resistance) exitWith {_unitColour = [0,1,0,0.7]};
					_unitColour = [0.251,0.251,0.251,1];
			    };

				_tempCSSA3_validGroupsArray pushBack _x;
				_tempCSSA3_validGroupsDataArray pushBack [_spectatableUnits, side _x, _unitColour];
			};
		} forEach allGroups;

		CSSA3_validGroupsArray = + _tempCSSA3_validGroupsArray;
		CSSA3_validGroupsDataArray = + _tempCSSA3_validGroupsDataArray;
		CSSA3_spectatableUnits = + _tempCSSA3_spectatableUnits;

		if (!isNil {CSSA3_spectatedUnit} && {!alive CSSA3_spectatedUnit}) then {CSSA3_spectatedUnit = CSSA3_spectatableUnits select 0};

		//Updates unit list listbox.
		if !(CSSA3_spectatableUnits isEqualTo CSSA3_oldUnitList) then {
			[] spawn CSSA3_fnc_updateUnitList;
		};

		CSSA3_oldUnitList = + CSSA3_spectatableUnits;

		if (playerRespawnTime >= 999999) then {_timeToRespawn = 'No Respawn'; setPlayerRespawnTime 9999999;} else {_timeToRespawn = playerRespawnTime;};
		(_display displayCtrl CSSA3_TimeToRespawnIDC) ctrlSetText format ["Respawn: %1",_timeToRespawn, "Respawn:"];

		if (ctrlFade (_display displayCtrl CSSA3_mapIDC) < 0.8) then { //If map is open

			zamf_var_allUnitsPos = [];
			{

				// String representation of object
				_object_str = str _x;

				// Create the marker and set it's type using the string reper of the object it's tracking
				createMarkerLocal [_object_str, getPosAtl _x];
				_object_str setMarkerTypeLocal "mil_dot";

				// Decide marker color depending on side
				_color = call {
					if (side group _x == east) exitWith {"colorRed"};
					if (side group _x == west) exitWith {"colorBlue"};
					if (side group _x == civilian) exitWith {"colorCivilian"};
					if (side group _x == resistance) exitWith {"colorGreen"};
					"colorBlack"
				};

				// Set the color
				_object_str setMarkerColorLocal _color;

				// Give the marker the player's name if a player
				if (alive _x && {isPlayer _x}) then {_object_str setMarkerTextLocal (name _x)};

				// Add to the marker array in order to delete later for refresh
				zamf_var_allUnitsPos set [count zamf_var_allUnitsPos, _object_str];

			} count CSSA3_spectatableUnits;
		};

		//Repeat above code every second.
		sleep 1;

		// Delete all the previously created markers in order to refresh them
		if !(isNil "zamf_var_allUnitsPos") then {
			{deleteMarkerLocal _x} count zamf_var_allUnitsPos;
		};
	}
	else
	{
		//Stop looping (exit function)
		_i = 2;

		//Destroy variables.
		CSSA3_spectatableUnits = nil;
		CSSA3_validGroupsArray = nil;
		CSSA3_validGroupsDataArray = nil;
		CSSA3_spectatedUnit = nil;
		CSSA3_CTIselectedUnit = nil;
		CSSA3_oldUnitList = nil;
	};
};