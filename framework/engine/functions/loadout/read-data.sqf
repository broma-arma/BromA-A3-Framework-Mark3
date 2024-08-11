if (_loadoutCondition) then {
	#include "\broma_framework\loadouts\faction-list.sqf"
} else {
	#include "..\..\..\..\mission\loadouts\faction-list.sqf"
};

if (_factionID in mission_modified_loadouts) then {
	#include "..\..\..\..\mission\loadouts\mod-list.sqf"
};

_factionVehicles = _factionVehicles call BRM_FMK_fnc_setVehiclesArray;

if (_assignLoadoutMode) then {
	if (_UAVBAg == "auto") then { _UAVBag = (([_unit, "vanilla"] call BRM_FMK_fnc_getSideUAV) select 0) };
	if (_UAVTerminal == "auto") then { _UAVTerminal = (([_unit, "vanilla"] call BRM_FMK_fnc_getSideUAV) select 1) };

	if (_factionStructure in mission_structures) then {
		#include "..\..\..\..\mission\loadouts\structure-list.sqf"
	} else {
		#include "\broma_framework\loadouts\structure-list.sqf"
	};
};

#include "\broma_framework\loadouts\includes\default-values.sqf"
