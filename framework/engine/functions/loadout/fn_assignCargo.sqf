if (!isNil "BRM_FMK_fnc_assignCargo") then { _this call BRM_FMK_fnc_assignCargo };

params ["_object", "_faction", "_type"];

if (!isServer || _object isKindOf "Man" || _object getVariable ["unit_initialized", false]) exitWith {};
_object setVariable ["unit_initialized", true];

[{ missionNamespace getVariable ["pluginsLoaded", false] }, {
	params ["_object", "_faction", "_type"];

	private _unit = _object;
	if !(_type isEqualType []) then { _type = [_type] };

	private _isMan = false;
	private _isLeader = false;

	#include "\broma_framework\loadouts\includes\private-variables.sqf"
	#include "\broma_framework\loadouts\includes\clear-object.sqf"
	#include "\broma_framework\loadouts\content\content-list.sqf"
	#include "\broma_framework\loadouts\includes\get-faction.sqf"

	_assignLoadoutMode = false;

	#include "read-data.sqf"

	{
		_x = toLower _x;
		private _overrideCargo = true;
		#include "..\..\..\..\mission\loadouts\cargo-list.sqf"
		if (!_overrideCargo) then {
			#include "\broma_framework\loadouts\cargo-list.sqf"
		};
	} forEach _type;
}, _this] call CBA_fnc_waitUntilAndExecute;
