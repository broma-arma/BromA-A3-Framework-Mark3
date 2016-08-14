//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Config_Marker     //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private
    ["_MarkerConfig","_MarkerSet","_s","_setShowZones","_setShowWPs","_setShowUnit","_setGroupType",
    "_setMarkerText","_setMarkerDel","_setMarkerRefresh","_setSizeWpLine","_setSizeLeaderLine",
    "_setSizeZoneLine","_setSizeCampLine","_setSizeZoneBorder","_setArtiMarker","_setCampMarker",
    "_setMarkerClass","_setSideColor","_MarkerValues"];

_MarkerSet = [
"_setShowZones","_setShowWPs","_setShowUnit","_setGroupType","_setMarkerText",
"_setMarkerDel","_setMarkerRefresh","_setSizeWpLine","_setSizeLeaderLine",
"_setSizeZoneLine","_setSizeCampLine","_setSizeZoneBorder","_setArtiMarker",
"_setCampMarker","_setSideColor","_setMarkerClass"];

_MarkerConfig = _this select 0;_MarkerValues = [0];_s = 0;

if (_MarkerConfig == 0) exitwith {};

switch (_MarkerConfig) do {
    default {
    _setShowZones 		= 2;
    _setShowWPs 		= 1;
    _setShowUnit 		= [1,1,1,1];
    _setGroupType 		= 1;
    _setMarkerText		= ["if(format[""%1"",_group] == ""<NULL-group>"") then {format["""",typeof _unit]} else {format[""(%1)"",count units _group]}"];
    _setMarkerDel 		= 1;
    _setMarkerRefresh           = [0.3,0.3];
    _setSizeWpLine 		= [1,1];
    _setSizeLeaderLine          = 1;
    _setSizeZoneLine            = 2;
    _setSizeCampLine            = 4;
    _setSizeZoneBorder          = 4;
    _setArtiMarker 		= 1;
    _setCampMarker 		= 2;
    _setSideColor 		= [
        "ColorRed",
        "ColorBlue",
        "ColorYellow",
        "ColorGreen",
        "ColorWhite",
        "ColorBlack",
        "ColorBlack",
        "ColorBlack"
    ];
    _setMarkerClass = [
        [["STATICWEAPON","o_recon",[0.8,0.8],0]],
        [["MAN","o_inf",[0.8,0.8],0]],
        [["CAR","o_motor_inf",[0.8,0.8],0],["TRUCK","o_motor_inf",[0.8,0.8],0]],
        [["TANK","o_armor",[0.8,0.8],0],["APC","o_armor",[0.8,0.8],0]],
        [["MOTORCYCLE","o_mech_inf",[0.8,0.8],0]],
        [["AIR","o_air",[1,1],0]],
        [["SHIP","o_uav",[1,1],0]],
        [["OTHER","n_unknown",[0.8,0.8],0]]
    ];
    };
};

while{_s < count _MarkerSet} do {
    _MarkerValues set[_s, (call compile (_MarkerSet select _s))];
    _s = _s + 1;
};

_MarkerValues