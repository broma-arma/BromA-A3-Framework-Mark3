/*
	Author: Cyrokrypto

	Description:
	- Called on each frame to draw icons and floating namesplates.

	Parameter(s):
	NONE

	Returns:
	NOTHING
*/

private ["_cam", "_fadeStart", "_fadeEnd", "_iconColour", "_nameText", "_iconSize", "_color", "_pos", "_distance", "_icon", "_show3D", "_dis", "_coef"];

if (CSSA3_visibleHUD) then {
	//Define varaibles.
	_cam = missionnamespace getvariable "CSSA3_mainCamera";
	_fadeStart = 20;
	_fadeEnd = 800;
	_iconColour = [0.251,0.251,0.251,1];
	_nameText = "";
	_iconSize = [0,0];

	if (CSSA3_settings select 1 == 1) then {_iconSize = [0.8,0.8]};
	{
		if (alive _x) then {

			_color = call {
				if (side _x == east) exitWith {_iconColour = [1,0,0,0.6]};
				if (side _x == west) exitWith {_iconColour = [0,0,1,0.6]};
				if (side _x == civilian) exitWith {_iconColour = [0.373,0.016,0.706,0.6]};
				if (side _x == resistance) exitWith {_iconColour= [0,1,0,0.6]};
			};

			if (CSSA3_settings select 0 == 1) then {_nameText = format ["%1", name _x]};

			_pos = visiblePositionASL _x;
			_pos set [2, (_x modelToWorld [0,0,2.3]) select 2];
			_distance = _pos distance _cam;
			_icon = ["\A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\whitedot_ca.paa",_iconColour,_pos,_iconSize select 0,_iconSize select 1,0,_nameText,0, ((0.16 / (_distance max 0.01)) * 2) min 0.08];
			if (count _icon > 0) then {
				_show3D = true;
				if (_show3D) then {
					_pos = _icon select 2;
					_dis = _pos distance _cam;
					if (_dis < _fadeEnd) then {
						_coef = linearconversion [_fadeStart,_fadeEnd,_distance,1,0,true];
						_icon set [3,(_icon select 3) * _coef];
						_icon set [4,(_icon select 4) * _coef];
						drawicon3d _icon;
					};
				};
			};
		};
	} count CSSA3_spectatableUnits;
};