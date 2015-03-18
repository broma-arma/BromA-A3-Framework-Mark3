/*
================================================================================

NAME:
    BRM_fnc_newMarkerIcon

AUTHOR(s):
    Nife

DESCRIPTION:
    Easier and shorter way to create markers. Makes an icon marker.

PARAMETERS:
    0 - Locality - "global" or "local" (STRING)
    1 - Position. (ARRAY)
    2 - Type: The marker's icon. See https://community.bistudio.com/wiki/cfgMarkers (STRING)
    3 - (OPTIONAL) Color: "ColorRed", "ColorBlue" etc. (STRING)
    4 - (OPTIONAL) Text. (STRING)
    5 - (OPTIONAL) Size: an array with the width and the height, 1 being the default. (ARRAY)
    6 - (OPTIONAL) Direction in degrees. (NUMBER)
    7 - (OPTIONAL) Opacity, from 0 to 1. (NUMBER)
    
USAGE:
    _mynewMarker = ["global", (getPos player), "hd_flag", "ColorBlue", "Help us!", [1,1], 0, 1] call BRM_fnc_newMarkerIcon
    
    _mynewMarker = ["local", (getPos enemy), "hd_warning", "ColorRed", "Enemy infantry", [0.5,0.5], 0, 0.3] call BRM_fnc_newMarkerIcon    
    
RETURNS:
    Object of the marker created. (MARKER)

================================================================================
*/

private ["_marker"];

if (_this select 0 == "local") then {
    
    _count = 1;

    _name = format ["%1", floor(random(100000000000000000))];

    _marker = createMarkerLocal [_name, (_this select _count)];

    _marker setMarkerShapeLocal "ICON";

    _count = _count + 1;

    _marker setMarkerTypeLocal (_this select _count);
                                                 _count = _count+1; if (count _this <= _count) exitWith {_marker};

    _marker setMarkerColorLocal (_this select _count);
                                                 _count = _count+1; if (count _this <= _count) exitWith {_marker};

    _marker setMarkerTextLocal (_this select _count);
                                                 _count = _count+1; if (count _this <= _count) exitWith {_marker};

    _marker setMarkerSizeLocal (_this select _count);
                                                 _count = _count+1; if (count _this <= _count) exitWith {_marker};

    _marker setMarkerDirLocal (_this select _count);
                                                 _count = _count+1; if (count _this <= _count) exitWith {_marker};

    _marker setMarkerAlphaLocal (_this select _count);
                                                 _count = _count+1; if (count _this <= _count) exitWith {_marker};

} else {
    
    _count = 1;

    _name = format ["%1", floor(random(100000000000000000))];

    _marker = createMarker [_name, (_this select _count)];

    _marker setMarkerShape "ICON";

    _count = _count + 1;

    _marker setMarkerType (_this select _count);
                                                 _count = _count+1; if (count _this <= _count) exitWith {_marker};

    _marker setMarkerColor (_this select _count);
                                                 _count = _count+1; if (count _this <= _count) exitWith {_marker};

    _marker setMarkerText (_this select _count);
                                                 _count = _count+1; if (count _this <= _count) exitWith {_marker};

    _marker setMarkerSize (_this select _count);
                                                 _count = _count+1; if (count _this <= _count) exitWith {_marker};

    _marker setMarkerDir (_this select _count);
                                                 _count = _count+1; if (count _this <= _count) exitWith {_marker};

    _marker setMarkerAlpha (_this select _count);
                                                 _count = _count+1; if (count _this <= _count) exitWith {_marker};
    
};

_marker