/*
================================================================================

DESCRIPTION:
    Easier and shorter way to create markers. Makes an area marker.
    
AUTHOR:
    Nife

PARAMETERS:
    0 - Locality - "global" or "local"
    1 - Position.
    2 - Type: The area type - "RECTANGLE" or "ELLIPSE"
    3 - Brush: Fill: see https://community.bistudio.com/wiki/setMarkerBrush
    4 - (OPTIONAL) Color: "ColorRed", "ColorBlue" etc.
    5 - (OPTIONAL) Size: an array with the width and the height, 1 being the default.
    6 - (OPTIONAL) Direction in degrees.
    7 - (OPTIONAL) Opacity, from 0 to 1.
    
    
RETURNS:
    Object of the marker created.

USAGE:
    _mynewMarker = ["global", (getPos player), "RECTANGLE", "Solid", "ColorBlue", [250,250], 0, 0.5] call BRM_fnc_newMarkerArea
    
    _mynewMarker = ["local", (getPos player), "ELLIPSE", "Cross", "ColorRed", [250,250], 0, 0.5] call BRM_fnc_newMarkerArea

================================================================================
*/

if (_this select 0 == "local") then {

    _count = 1;

    _name = format ["%1", floor(random(100000000000000000))];

    _marker = createMarkerLocal [_name, (_this select _count)];

    _count = _count+1;

    _marker setMarkerShapeLocal (_this select _count);

    _count = _count+1;

    _marker setMarkerBrushLocal (_this select _count);

        _count = _count+1; if (count _this <= _count) exitWith {_marker};

    _marker setMarkerColorLocal (_this select _count);

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

    _count = _count+1;

    _marker setMarkerShape (_this select _count);

    _count = _count+1;

    _marker setMarkerBrush (_this select _count);

        _count = _count+1; if (count _this <= _count) exitWith {_marker};

    _marker setMarkerColor (_this select _count);

        _count = _count+1; if (count _this <= _count) exitWith {_marker};

    _marker setMarkerSize (_this select _count);

        _count = _count+1; if (count _this <= _count) exitWith {_marker};

    _marker setMarkerDir (_this select _count);

        _count = _count+1; if (count _this <= _count) exitWith {_marker};

    _marker setMarkerAlpha (_this select _count);

        _count = _count+1; if (count _this <= _count) exitWith {_marker};    

};

_marker