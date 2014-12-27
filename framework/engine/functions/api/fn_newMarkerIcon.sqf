/*
================================================================================

DESCRIPTION:
    Easier and shorter way to create markers. Makes an icon marker.
    
AUTHOR:
    Nife

PARAMETERS:
    0 - Position.
    1 - Type: The marker's icon. See https://community.bistudio.com/wiki/cfgMarkers
    2 - (OPTIONAL) Color: "ColorRed", "ColorBlue" etc.
    3 - (OPTIONAL) Text.
    4 - (OPTIONAL) Size: an array with the width and the height, 1 being the default.
    5 - (OPTIONAL) Direction in degrees.
    6 - (OPTIONAL) Opacity, from 0 to 1.
    
    
RETURNS:
    Object of the marker created.

USAGE:
    _mynewMarker = [ (getPos player), "hd_flag", "ColorBlue", "Help us!", [1,1], 0, 1] call fnc_newMarkerIcon
    
    _mynewMarker = [ (getPos enemy), "hd_warning", "ColorRed", "Enemy infantry", [0.5,0.5], 0, 0.3] call fnc_newMarkerIcon

================================================================================
*/

_count = 0;

_name = format ["%1", floor(random(100000000000000000))];

_marker = createMarker [_name, (_this select _count)];

_marker setMarkerShape "ICON";

_count = _count+1;

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

_marker