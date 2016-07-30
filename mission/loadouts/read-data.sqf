
// =============================================================================
// Includes the loadout sheets.

if ((!((_faction) in read_local_cargo_specific))) then {
    #include "\broma_framework\loadouts\faction-list.sqf"
} else {
    #include "faction-list.sqf"
};
// =============================================================================

// =============================================================================
// Loads any local modifications applied to the loadout.

if (_factionID in modified_loadouts) then {
    #include "mod-list.sqf"
};
// =============================================================================

_factionVehicles = _factionVehicles call BRM_FMK_fnc_setVehiclesArray;

// =============================================================================
// Include the faction structure, including hierarchy and medical equipment.

if (_assignLoadoutMode) then {
    if (_UAVBAg == "auto") then { _UAVBag = (([_unit, "vanilla"] call BRM_FMK_fnc_getSideUAV) select 0) };
    if (_UAVTerminal == "auto") then { _UAVTerminal = (([_unit, "vanilla"] call BRM_FMK_fnc_getSideUAV) select 1) };

    if (_factionStructure in read_local_structure_specific) then {
        #include "structure-list.sqf"
    } else {
        #include "\broma_framework\loadouts\structure-list.sqf"
    };
};
// =============================================================================

// INCLUDE DEFAULT VALUES ======================================================

#include "\broma_framework\loadouts\includes\default-values.sqf"

// =============================================================================