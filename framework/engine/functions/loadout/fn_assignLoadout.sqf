params ["_unit", "_faction", ["_type", ""]];

if !(_unit isKindOf "Man" && local _unit) exitWith {};

[{ missionNamespace getVariable ["pluginsLoaded", false] }, {
	params ["_unit", "_faction", ["_type", ""]];

	private _isMan = true;
	private _isLeader = isFormationLeader _unit;

	#include "\broma_framework\loadouts\includes\private-variables.sqf"
	#include "\broma_framework\loadouts\includes\clear-object.sqf"
	#include "\broma_framework\loadouts\content\content-list.sqf"
	#include "\broma_framework\loadouts\includes\get-faction.sqf"
	#include "\broma_framework\loadouts\includes\get-type.sqf"
	#include "\broma_framework\loadouts\includes\classes-list.sqf"

	_assignLoadoutMode = true;

	#include "read-data.sqf"

	#include "\broma_framework\loadouts\includes\set-identity.sqf"
}, _this] call CBA_fnc_waitUntilAndExecute;
