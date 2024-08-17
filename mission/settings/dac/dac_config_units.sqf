#include "\broma_framework\loadouts\includes\vehicles-index.sqf"

private ["_Unit_Pool_S", "_Unit_Pool_V", "_Unit_Pool_T", "_Unit_Pool_A"];

params ["_type"];

switch (_type) do {
	case 0; // OPFOR
	case 1; // BLUFOR
	case 2: { // INDFOR
		private _side = [OPFOR, BLUFOR, INDEPENDENT] select _type;
		_Unit_Pool_S = [_side, "units"] call BRM_FMK_fnc_getSideInfo;
		private _vehicles = [[_side, "FACTION"] call BRM_FMK_fnc_getSideInfo, "VEHICLES"] call BRM_fnc_getLoadoutProperty;

		// AA_VEHICLES, ATTACK_HELOS, TRANSPORT_HELOS, ATTACK_PLANES, TRANSPORT_PLANES
		// LIGHT_VEHICLES, MEDIUM_VEHICLES, HEAVY_VEHICLES, TRANSPORT_TRUCKS, SUPPORT
		// MOBILE_ARTILLERY, STATIC_DEFENSE, BOATS, SUBMARINES, UAV, UGV

		_Unit_Pool_V = [_vehicles, [LIGHT_VEHICLES, TRANSPORT_TRUCKS]] call BRM_FMK_fnc_appendIndices;
		_Unit_Pool_T = [_vehicles, [MEDIUM_VEHICLES, HEAVY_VEHICLES]] call BRM_FMK_fnc_appendIndices;
		_Unit_Pool_A = [_vehicles, [ATTACK_HELOS, TRANSPORT_HELOS]] call BRM_FMK_fnc_appendIndices;
	};

	case 3: { // CIVFOR
		_Unit_Pool_S = ["C_man_1", "C_man_1", "C_man_1", "C_man_polo_1_F", "C_man_polo_2_F", "C_man_polo_3_F", "C_man_polo_4_F", "C_man_polo_5_F", "C_man_polo_6_F", "C_man_1_1_F", "C_man_1_2_F", "C_man_1_3_F"];
		_Unit_Pool_V = ["C_Offroad_01_F", "C_Quadbike_01_F", "C_Truck_02_covered_F", "C_Truck_02_transport_F", "C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_SUV_01_F", "C_Truck_02_box_F", "C_Van_01_transport_F", "C_Van_01_box_F", "C_Offroad_02_unarmed_F"];
		_Unit_Pool_T = [];
		_Unit_Pool_A = ["C_Heli_Light_01_civil_F"];
	};

	default {
		if (DAC_Basic_Value != 5) then {
			DAC_Basic_Value = 5; publicVariable "DAC_Basic_Value";
			hintC "Error: DAC_Config_Units > No valid config number";
		};
	};
};

if (count _this == 2) then {
	[_Unit_Pool_S, _Unit_Pool_V, _Unit_Pool_T, _Unit_Pool_A]
} else {
	_Unit_Pool_V + _Unit_Pool_T + _Unit_Pool_A
}
