/*
================================================================================

DESCRIPTION:
    Easier and shorter way to create markers. Makes an area marker.
    
AUTHOR:
    Nife

PARAMETERS:
    0 - Position.
    1 - Type: The area type - "RECTANGLE" or "ELLIPSE"
    2 - Brush: Fill: see https://community.bistudio.com/wiki/setMarkerBrush
    3 - (OPTIONAL) Color: "ColorRed", "ColorBlue" etc.
    4 - (OPTIONAL) Size: an array with the width and the height, 1 being the default.
    5 - (OPTIONAL) Direction in degrees.
    6 - (OPTIONAL) Opacity, from 0 to 1.
    
    
RETURNS:
    Object of the marker created.

USAGE:
    _mynewMarker = [ (getPos player), "RECTANGLE", "Solid", "ColorBlue", [250,250], 0, 0.5] call fnc_newMarkerArea
    
    _mynewMarker = [ (getPos player), "ELLIPSE", "Cross", "ColorRed", [250,250], 0, 0.5] call fnc_newMarkerArea

================================================================================
*/

_count = 0;

_name = format ["%1", floor(random(100000000000000000))];

_marker = createMarker [_name, (_this select _count)];

_count = _count+1;

_marker setMarkerShape (_this select _count);

_count = _count+1;

_marker setMarkerBrush (_this select _count);

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