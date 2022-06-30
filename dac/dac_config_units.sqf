
// =============================================================================
// AA_VEHICLES, ATTACK_HELOS, ATTACK_PLANES, HEAVY_VEHICLES, LIGHT_VEHICLES,
// MEDIUM_VEHICLES, MOBILE_ARTILLERY, TRANSPORT_HELOS, TRANSPORT_PLANES,
// TRANSPORT_TRUCKS, STATIC_DEFENSE, BOATS, UAV, UGV, SUPPORT, SUBMARINES
// =============================================================================

#include "\broma_framework\loadouts\includes\vehicles-index.sqf"

// =============================================================================

private ["_TypNumber","_TempArray","_Unit_Pool_S","_Unit_Pool_V","_Unit_Pool_T","_Unit_Pool_A"];

_TypNumber = _this select 0;_TempArray = [];

_OFaction = [EAST, "FACTION"] call BRM_FMK_fnc_getSideInfo;
_OVehicles = [_OFaction, "VEHICLES"] call BRM_fnc_getLoadoutProperty;

_BFaction = [WEST, "FACTION"] call BRM_FMK_fnc_getSideInfo;
_BVehicles = [_BFaction, "VEHICLES"] call BRM_fnc_getLoadoutProperty;

_IFaction = [RESISTANCE, "FACTION"] call BRM_FMK_fnc_getSideInfo;
_IVehicles = [_IFaction, "VEHICLES"] call BRM_fnc_getLoadoutProperty;

// =============================================================================

switch (_TypNumber) do {
// ============================================================================
//  OPFOR                                                                      |
// ============================================================================
    case 0: {
        _Unit_Pool_S = [EAST] call BRM_FMK_fnc_getUnitsArray;
        _Unit_Pool_V = [_OVehicles, [LIGHT_VEHICLES, TRANSPORT_TRUCKS]] call BRM_FMK_fnc_appendIndices;
        _Unit_Pool_T = [_OVehicles, [MEDIUM_VEHICLES, HEAVY_VEHICLES]] call BRM_FMK_fnc_appendIndices;
        _Unit_Pool_A = [_OVehicles, [ATTACK_HELOS, TRANSPORT_HELOS]] call BRM_FMK_fnc_appendIndices;
    };

// ============================================================================
//  BLUFOR                                                                     |
// ============================================================================
    case 1: {
        _Unit_Pool_S = [WEST] call BRM_FMK_fnc_getUnitsArray;
        _Unit_Pool_V = [_BVehicles, [LIGHT_VEHICLES, TRANSPORT_TRUCKS]] call BRM_FMK_fnc_appendIndices;
        _Unit_Pool_T = [_BVehicles, [MEDIUM_VEHICLES, HEAVY_VEHICLES]] call BRM_FMK_fnc_appendIndices;
        _Unit_Pool_A = [_BVehicles, [ATTACK_HELOS, TRANSPORT_HELOS]] call BRM_FMK_fnc_appendIndices;
    };

// ============================================================================
//  INDEPENDENT                                                                |
// ============================================================================
    case 2:
    {
        _Unit_Pool_S = [RESISTANCE] call BRM_FMK_fnc_getUnitsArray;
        _Unit_Pool_V = [_IVehicles, [LIGHT_VEHICLES, TRANSPORT_TRUCKS]] call BRM_FMK_fnc_appendIndices;
        _Unit_Pool_T = [_IVehicles, [MEDIUM_VEHICLES, HEAVY_VEHICLES]] call BRM_FMK_fnc_appendIndices;
        _Unit_Pool_A = [_IVehicles, [ATTACK_HELOS, TRANSPORT_HELOS]] call BRM_FMK_fnc_appendIndices;
    };

// ============================================================================
//  CIVILIANS                                                                  |
// ============================================================================
    case 3: {
        _Unit_Pool_S = ["C_man_1","C_man_1","C_man_1","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F"];
        _Unit_Pool_V = ["C_Van_01_box_F","C_Van_01_transport_F","C_Offroad_01_F","C_Hatchback_01_sport_F","C_Hatchback_01_F"];
        _Unit_Pool_T = ["C_Van_01_box_F","C_Van_01_transport_F","C_Offroad_01_F","C_Hatchback_01_sport_F","C_Hatchback_01_F"];
        _Unit_Pool_A = [];
    };

// =============================================================================
    default {
        if (DAC_Basic_Value != 5) then {
            DAC_Basic_Value = 5;publicvariable "DAC_Basic_Value",
            hintC "Error: DAC_Config_Units > No valid config number";
        };
        if (true) exitwith {};
    };
// =============================================================================
};

if (count _this == 2) then { _TempArray = _TempArray + [_Unit_Pool_S,_Unit_Pool_V,_Unit_Pool_T,_Unit_Pool_A] }
else { _TempArray = _Unit_Pool_V + _Unit_Pool_T + _Unit_Pool_A };

_TempArray
