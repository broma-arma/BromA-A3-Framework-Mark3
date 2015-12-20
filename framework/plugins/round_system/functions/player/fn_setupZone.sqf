sleep 1;
_logic =  _this select 0;
_radius = _this select 1;
_time =   _this select 2;
_side =   _this select 3;

_pos = getMarkerPos _logic;
_dir = 0;

if (isNil "setupZoneEnd") then { setupZoneEnd = false };

waitUntil {!isNull player};

_name = "setup_" + str _side;
createMarkerLocal [_name, _pos];
_name setMarkerDirLocal _dir;
_name setMarkerShapeLocal "RECTANGLE";
_name setMarkerSizeLocal [_radius, _radius];
_name setMarkerBrushLocal "Border";
_name setMarkerColorLocal "color" + ([side player, "color"] call BRM_fnc_getSideInfo);

_message = "Wait until the round setup is over!";

_barrierHandle = [_pos, _radius, _radius, _dir, "rectangle", _message] call BRM_Round_System_fnc_registerZone;

sleep 1;
_timetype = "";

[_barrierHandle, _name] spawn {
    _barrierHandle = _this select 0;
    _markerName = _this select 1;

    waitUntil {(setupZoneEnd)};

    sandi_barrier_barriers set [_barrierHandle, 0];
    deleteMarkerLocal _markerName;

    ["Alert",["BEGIN!"]] call BIS_fnc_showNotification;
};