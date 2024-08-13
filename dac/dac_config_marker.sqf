//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Config_Marker     //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

params ["_type"];

if (_type == 0) exitwith {};

private _setShowZones = 2;
private _setShowWPs = 1;
private _setShowUnit = [1, 1, 1, 1];
private _setGroupType = 1;
private _setMarkerText = ["if (isNull _group) then { """" } else { format [""(%1)"", count units _group] }"];
private _setMarkerDel = 1;
private _setMarkerRefresh = [0.3, 0.3];
private _setSizeWpLine = [1, 1];
private _setSizeLeaderLine = 1;
private _setSizeZoneLine = 2;
private _setSizeCampLine = 4;
private _setSizeZoneBorder = 4;
private _setArtiMarker = 1;
private _setCampMarker = 2;
private _setSideColor = [
	"ColorRed",
	"ColorBlue",
	"ColorYellow",
	"ColorGreen",
	"ColorWhite",
	"ColorBlack",
	"ColorBlack",
	"ColorBlack"
];
private _setMarkerClass = [
	[["STATICWEAPON", "o_recon", [0.8, 0.8], 0]],
	[["MAN", "o_inf", [0.8, 0.8], 0]],
	[["CAR", "o_motor_inf", [0.8, 0.8], 0], ["TRUCK", "o_motor_inf", [0.8, 0.8], 0]],
	[["TANK", "o_armor", [0.8, 0.8], 0], ["APC", "o_armor", [0.8, 0.8], 0]],
	[["MOTORCYCLE", "o_mech_inf", [0.8, 0.8], 0]],
	[["AIR", "o_air", [1, 1], 0]],
	[["SHIP", "o_uav", [1, 1], 0]],
	[["OTHER", "n_unknown", [0.8, 0.8], 0]]
];

switch (_type) do {
	case 1: {
		
	};
};

[
	_setShowZones, _setShowWPs, _setShowUnit, _setGroupType, _setMarkerText,
	_setMarkerDel, _setMarkerRefresh, _setSizeWpLine, _setSizeLeaderLine,
	_setSizeZoneLine, _setSizeCampLine, _setSizeZoneBorder, _setArtiMarker,
	_setCampMarker, _setSideColor, _setMarkerClass
]
