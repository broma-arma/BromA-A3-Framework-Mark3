[{ !(isNil "mission_settings_loaded") }, {
	[{ (pluginsLoaded) }, {
		_unit = _this select 0;
		_faction = _this select 1;
		_type = "";

		_isLeader = false;
		_isMan = _unit isKindOf "Man";
		if (_isMan) then {
			_isLeader = isFormationLeader _unit;
		};

		if (!_isMan) exitWith {};
		if (!(local _unit)) exitWith {};

		#include "\broma_framework\loadouts\includes\private-variables.sqf"
		#include "\broma_framework\loadouts\includes\faction-info-index.sqf"
		#include "\broma_framework\loadouts\includes\get-faction.sqf"

		_loadoutCondition = (!((_faction) in mission_loadouts));

		_unit setVariable ["BIS_enableRandomization", false];

		#include "\broma_framework\loadouts\includes\clear-object.sqf"

		#include "\broma_framework\loadouts\includes\get-type.sqf"

		#include "\broma_framework\loadouts\includes\classes-list.sqf"

		_assignLoadoutMode = true;

		#include "\broma_framework\loadouts\content\content-list.sqf"

		#include "read-data.sqf"

		#include "\broma_framework\loadouts\includes\set-identity.sqf"

	}, _this] call CBA_fnc_waitUntilAndExecute;
}, _this] call CBA_fnc_waitUntilAndExecute;
