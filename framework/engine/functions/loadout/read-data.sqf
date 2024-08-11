// =============================================================================
// Includes the loadout sheets.

if (_loadoutCondition) then {
	#include "\broma_framework\loadouts\faction-list.sqf"
} else {
	#include "..\..\..\..\mission\loadouts\faction-list.sqf"
};
// =============================================================================

// =============================================================================
// Loads any local modifications applied to the loadout.

if (_factionID in mission_modified_loadouts) then {
	#include "..\..\..\..\mission\loadouts\mod-list.sqf"
};
// =============================================================================

_factionVehicles = _factionVehicles call BRM_FMK_fnc_setVehiclesArray;

// =============================================================================
// Include the faction structure, including hierarchy and medical equipment.

if (_assignLoadoutMode) then {
	if (_UAVBAg == "auto") then { _UAVBag = (([_unit, "vanilla"] call BRM_FMK_fnc_getSideUAV) select 0) };
	if (_UAVTerminal == "auto") then { _UAVTerminal = (([_unit, "vanilla"] call BRM_FMK_fnc_getSideUAV) select 1) };

	if (_factionStructure in mission_structures) then {
		#include "..\..\..\..\mission\loadouts\structure-list.sqf"
	} else {
		#include "\broma_framework\loadouts\structure-list.sqf"
	};
};
// =============================================================================

// INCLUDE DEFAULT VALUES ======================================================

#include "\broma_framework\loadouts\includes\default-values.sqf"

// =============================================================================
