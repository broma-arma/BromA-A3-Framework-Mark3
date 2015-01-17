/*
	Author: Cyrokrypto

	Description:
	- Activates when left mouse button is pressed for longer than _CSSA3_activateForTime.
	- Does not continue code if LMB is released before _CSSA3_activateForTime.
	- Centres the interact rose on the mouse cursor after _CSSA3_activateForTime.
	- To improve this, see: http://feedback.arma3.com/view.php?id=20749
	- Requires re-write.

	Parameter(s):
	_mX : position2D - Mouse cursor X position.
	_mY : position2D - Mouse cursor Y position.

	Returns:
	NOTHING
*/

private ["_display", "_CSSA3_activateForTime", "_mX", "_mY", "_nearestUnit", "_intersectedObjects", "_camera", "_cursorPos", "_interactRose", "_interactRosePos", "_roseGroupPos"];

disableSerialization;

#define CSSA3_cbClickToInteractIDC		79144
#define CSSA3_interactMenuGroupIDC		7915
#define CSSA3_addremoveButtonIDC		79155
#define CSSA3_nameTextIDC				79158

_display = findDisplay 7810;

_CSSA3_activateForTime = time + 0.5; //Defines how long LMB must be held.
CSSA3_lmbDown = true;
_mX = _this select 0;
_mY = _this select 1;
_nearestUnit = objNull;
_intersectedObjects = objNull;
_camera = missionnamespace getvariable ["CSSA3_mainCamera",objnull];
_cursorPos = screenToWorld [_mX,_mY]; //Cursor position on world (Position3D).

//---See if line intersects. (Only works for vehicles currently)
_intersectedObjects = lineIntersectsObjs [getPosASL _camera, ATLToASL _cursorPos, objNull, objNull,false];

//---Wait until LMB has been held for longer than _CSSA3_activateForTime.
waitUntil {(time > _CSSA3_activateForTime) || {!(CSSA3_lmbDown)}};

//---If LMB is still held after _CSSA3_activateForTime
if (CSSA3_lmbDown) then {

	//---If intersected line is a "Man" or "Vehicle", assign vehicle/man to _nearestUnit.
	{
		if (((_x isKindOf "Man")||{(_x isKindOf "AllVehicles")}) && (vehicle _x != vehicle CSSA3_CTIselectedUnit)) exitWith {_nearestUnit = _x;};
			_nearestUnit = _nearestUnit;
	} count _intersectedObjects;

	//---If line does not intersect, see if there is such a unit in the vicinity of the mouse cursor. (in Position3D)
	if (isNull _nearestUnit) then {
		_nearestUnit = (nearestObjects [_cursorPos, ["Man","AllVehicles"], 5]);

		if (count _nearestUnit < 1) then {
			_nearestUnit = objNull
		} else {
			_nearestUnit = _nearestUnit select 0
		};
	};

	//---If empty vehicle, exit.
	if ((count crew vehicle _nearestUnit < 1) || {!(driver _nearestUnit in CSSA3_spectatableUnits) }) exitWith {};

	if ("firstPerson" in CSSA3_allowedModes) then {ctrlEnable [79153, true]} else {ctrlEnable [79153, false]};
	if ("freeCam" in CSSA3_allowedModes) then {ctrlEnable [79152, true]} else {ctrlEnable [79152, false]};
	if ("thirdPerson" in CSSA3_allowedModes) then {ctrlEnable [79154, true]} else {ctrlEnable [79154, false]};

	//---If a unit has been found, centre the interact rose on the unit's location. (Position2D)
	if !(isNull _nearestUnit) exitWith {

		_interactRose = _display displayCtrl CSSA3_interactMenuGroupIDC;
		_interactRosePos = ctrlPosition _interactRose;
		_interactRose ctrlSetPosition [_mX-(_interactRosePos select 2)/2, _mY-(_interactRosePos select 3)/2, 0.221719 * safezoneW, 0.143 * safezoneH];
		_interactRose ctrlCommit 0;
		_interactRose ctrlShow true;

		//---If line is already drawn, stop drawing it.
		if !(isNil {CSSA3_fnc_DrawLine3D}) then
		{
			removemissioneventhandler ["draw3d",CSSA3_fnc_DrawLine3D];
			CSSA3_fnc_DrawLine3D = nil;
		};

		//---Set selected unit's name.
		CSSA3_CTIselectedUnit = _nearestUnit;
		ctrlSetText [CSSA3_nameTextIDC, name vehicle CSSA3_CTIselectedUnit];

		//---If unit is a favourite, change button text to 'remove', else change text to 'add'.
		if (CSSA3_CTIselectedUnit in CSSA3_favourites) then {
			ctrlSetText [CSSA3_addremoveButtonIDC,  "[-] " + "Favorites"];
		} else {
			ctrlSetText [CSSA3_addremoveButtonIDC, "[+] " + "Favorites"];
		};

		//---Draw a line between interact rose and selected unit.
		CSSA3_fnc_DrawLine3D = addMissionEventHandler ["Draw3D", {
				//---If command rose is still on screen, draw the line.
				if !(isNil {CSSA3_fnc_DrawLine3D}) then {
					//---Find the position of the interaction rose. (Each frame)
					_roseGroupPos = ctrlPosition (findDisplay 7810 displayCtrl CSSA3_interactMenuGroupIDC);
					drawLine3D [screenToWorld [((_roseGroupPos select 0) + (_roseGroupPos select 2) / 2), ((_roseGroupPos select 1) + (_roseGroupPos select 3) / 2)], ASLtoATL eyePos CSSA3_CTIselectedUnit, [1,0,0,1]];
				};
			}
		];
	};

	//---If in first person, open rose and interact with current unit (first person unit).
	if ((CSSA3_perspective == "firstPerson")||{(CSSA3_perspective == "thirdPerson")}) exitWith {
		CSSA3_CTIselectedUnit = CSSA3_spectatedUnit;
		ctrlSetText [CSSA3_nameTextIDC, name vehicle CSSA3_CTIselectedUnit];

		_interactRose = _display displayCtrl CSSA3_interactMenuGroupIDC;
		_interactRosePos = ctrlPosition _interactRose;
		_interactRose ctrlSetPosition [_mX-(_interactRosePos select 2)/2, _mY-(_interactRosePos select 3)/2, 0.221719 * safezoneW, 0.143 * safezoneH];
		_interactRose ctrlCommit 0;
	};
//	hint format ["%1", CSSA3_CTIselectedUnit];
	CSSA3_lmbDown = false;
};