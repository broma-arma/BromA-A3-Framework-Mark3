/*
	Author: Cyrokrypto

	Description:
	- Code that occurs when a new unit is selected to be spectated.
	- The camera is positioned on specified unit based on the currently selected
	  view mode (First Person, Third Person, FreeCam).
	- The size (boundingbox) of vehicles are taken into account so that the camera
	  is positioned in a non-obstructed position.
	- Length/height calculation needs some love.

	Parameter(s):
	None

	Returns:
	NOTHING
*/

//CSSA3_spectatedUnit: 		Object - Unit being spectated currently, only change when unit changes!
//CSSA3_CTIselectedUnit: 	Object - Unit selected by click to interact menu, changes when interacting with unit.
//CSSA3_perspective: 			String - Mode of viewing: freeCam, firstPerson, thirdPerson.

private ["_cam", "_unit", "_bbr", "_p1", "_p2", "_vehicleLength", "_vehicleHeight", "_lengthSpacing", "_heightSpacing", "_newCamPosition", "_vector", "_objectloc", "_angle", "_unitRole", "_display", "_ctrlText"];
disableSerialization;

if (isNull (findDisplay 7810)) exitWith {};

if !(CSSA3_perspective in CSSA3_allowedModes) exitWith {CSSA3_perspective = CSSA3_allowedModes select 0;};

_cam = missionnamespace getvariable ["CSSA3_mainCamera",objNull];

//First, check if there are spectable units.
if (count CSSA3_spectatableUnits < 1) exitWith {
	CSSA3_spectatedUnit = objNull;
	CSSA3_placeHolder switchCamera "Internal";
	CSSA3_placeHolder cameraeffect ["INTERNAL","BACK"];
	_cam attachTo [CSSA3_placeHolder];
	cutText ["No spectatable units alive!","PLAIN",30,true];
};

//Destroy the camera, if it exists.
if (!isNull _cam) then {
	camDestroy _cam;
};

//Now we create a new camera.
_cam = "camera" camcreate getPos CSSA3_spectatedUnit;
_cam camSetFocus [50, 0];
_cam camCommit 0;

//cameraEffectEnableHUD true;
showcinemaborder false;
missionnamespace setvariable ["CSSA3_mainCamera",_cam];

//If using interact rose, set _unit to rose selected unit.
if (CSSA3_fromRose) then {
	CSSA3_spectatedUnit = CSSA3_CTIselectedUnit;
};

_unit = CSSA3_spectatedUnit;

//Now we need to see if the currently spectated unit exists and is not dead.
if ((isNull CSSA3_spectatedUnit) || {isNil {"CSSA3_spectatedUnit"}} || {!alive CSSA3_spectatedUnit}) exitWith {
	CSSA3_perspective = CSSA3_allowedModes select 0;
	CSSA3_spectatedUnit = CSSA3_spectatableUnits select 0;
	[] spawn CSSA3_fnc_changeView;
};

//---If free camera view mode is selected.
if (CSSA3_perspective == "freeCam") then {

	//Begin positioning new camera.

	//---If selected unit is in vehicle.
	if (vehicle _unit != _unit) then {
		//---Find length and height of vehicle for placement.
		_bbr = boundingBoxReal vehicle _unit;
		_p1 = _bbr select 0;
		_p2 = _bbr select 1;
		_vehicleLength = abs ((_p2 select 1) - (_p1 select 1));
		_vehicleHeight = abs ((_p2 select 2) - (_p1 select 2));
		_lengthSpacing = _vehicleLength; // 1.5;
		_heightSpacing = _vehicleHeight / 1.5; // 2.5;

		//---Position camera based on vehicle length and height.
		_newCamPosition = vehicle _unit modelToWorld [0,-_lengthSpacing,_heightSpacing];

	} else {
		_newCamPosition = _unit modelToWorld [0,-3.5,2.5];
	};

	if (CSSA3_settings select 3 == 1) then {waitUntil {preloadCamera _newCamPosition};};

	_cam setPos _newCamPosition;

	//---Set camera direction relative to target.
	_vector = ((((getPos vehicle _unit select 0) - (getPos _cam select 0)) atan2 ((getPos vehicle _unit select 1) - (getPos _cam select 1))) + 360) % 360;
	_cam setDir _vector;

	//---Determine angle.
	_objectloc = (getPosASL _cam) vectorDiff (getPosASL _unit);

	_angle = 90 - (atan (sqrt((((_objectloc select 0)^2)+((_objectloc select 1)^2)) / (_objectloc select 2))));

	[+0,-_angle] call CSSA3_fnc_camRotate;

	//Change to camera.
	vehicle _unit switchCamera "Internal";
	_cam cameraeffect ["INTERNAL","BACK"];
	cameraEffectEnableHUD true;

};

//---If first person mode is slected.
if (CSSA3_perspective == "firstPerson") then
{
	_cam attachTo [_unit,[0,0,0]];
	_cam cameraEffect ["terminate","back"];
	cameraEffectEnableHUD true;

	//---Debug
//	hint format ["%1, %2", _unit, assignedVehicleRole _unit];

	//---Placement based on position in vehicle.
	if (vehicle _unit != _unit) then { //If in vehicle.
		//---If Driver
		_unitRole = (assignedVehicleRole _unit) select 0;
		if (_unitRole == "Driver") exitWith {
			vehicle _unit switchCamera "Internal";
		};

		//---If Gunner
		if (_unitRole == "Gunner") exitWith {
			vehicle _unit switchCamera "GUNNER";
		};

		//---If Turret
		if (_unitRole == "Turret") exitWith {
			_unit switchCamera "INTERNAL";
		};

		//---If passenger (Cargo)
		if (_unitRole == "Cargo") exitWith {
			_unit switchCamera "INTERNAL";
		};

		//---If Commander
		if (_unitRole == "Commander") exitWith {
			vehicle _unit switchCamera "Internal";
		};
	} else { //---If not in vehicle.
		_unit switchCamera "INTERNAL";
	};
};

//If third person mode is selected.
if (CSSA3_perspective == "thirdPerson") then {

	_cam cameraeffect ["INTERNAL","BACK"];
	cameraEffectEnableHUD true;
	_cam camSetTarget vehicle _unit;
	_cam camCommit 0;

	//---Find length and height of vehicle for placement.
	_bbr = boundingBoxReal vehicle _unit;
	_p1 = _bbr select 0;
	_p2 = _bbr select 1;
	_vehicleLength = abs ((_p2 select 1) - (_p1 select 1));
	_vehicleHeight = abs ((_p2 select 2) - (_p1 select 2));
	_lengthSpacing = _vehicleLength; // 1.5;
	_heightSpacing = _vehicleHeight / 1.5; // 2.5;

	_cam attachTo [vehicle _unit, [0, -_vehicleLength, _vehicleHeight]];
};

//Finally, update.
CSSA3_fromRose = false;

_display = findDisplay 7810;
_ctrlText = _display displayCtrl 79135;
ctrlSetText [79135, name CSSA3_spectatedUnit];
if (count CSSA3_validGroupsDataArray > 0) then {
	_ctrlText ctrlSetTextColor ((CSSA3_validGroupsDataArray select (CSSA3_validGroupsArray find (group CSSA3_spectatedUnit))) select 2);
};

//Close interact rose (if open)
[] spawn CSSA3_fnc_closeInteractRose;