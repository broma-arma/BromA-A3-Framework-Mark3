
private ["_CampTyp","_campBasic","_campAmmo","_campStatic","_campWall", "_array",
"_campObjInit","_campUserObj","_campAddUnit","_campRandomObj","_Unit_Pool_C","_campInfo","_ammoBoxes"];

#include "\broma_framework\loadouts\includes\vehicles-index.sqf"
#include "\broma_framework\loadouts\includes\faction-info-index.sqf"

_CampTyp = _this select 0;_array = [];

switch (_CampTyp) do {
// =============================================================================
    case 0: { // OPFOR CAMP

        _campInfo = [EAST] call BRM_FMK_DAC_fnc_generateCampInfo;

        _campBasic     = _campInfo select CAMP_RET_BASIC;
        _campAmmo      = _campInfo select CAMP_RET_OBJECTS;
        _campStatic    = _campInfo select CAMP_RET_STATIC;
        _campAddUnit   = _campInfo select CAMP_RET_GUARDS;
        _campUserObj   = [];
        _campRandomObj = [];
        _campWall      = _campInfo select CAMP_RET_WALLS;
        _ammoBoxes     = _campInfo select CAMP_RET_AMMO;
        _campObjInit   = [[],[format ["[_x, 'opfor', %1] remoteExecCall ['BRM_FMK_fnc_assignCargo', 2];", _ammoBoxes]],[],[],[],[],[]];
    };
// =============================================================================
    case 1: { // BLUFOR CAMP

        _campInfo = [WEST] call BRM_FMK_DAC_fnc_generateCampInfo;

        _campBasic     = _campInfo select CAMP_RET_BASIC;
        _campAmmo      = _campInfo select CAMP_RET_OBJECTS;
        _campStatic    = _campInfo select CAMP_RET_STATIC;
        _campAddUnit   = _campInfo select CAMP_RET_GUARDS;
        _campUserObj   = [];
        _campRandomObj = [];
        _campWall      = _campInfo select CAMP_RET_WALLS;
        _ammoBoxes     = _campInfo select CAMP_RET_AMMO;
        _campObjInit   = [[],[format ["[_x, 'blufor', %1] remoteExecCall ['BRM_FMK_fnc_assignCargo', 2];", _ammoBoxes]],[],[],[],[],[]];
    };
// =============================================================================
    case 2: { // INDFOR CAMP

        _campInfo = [RESISTANCE] call BRM_FMK_DAC_fnc_generateCampInfo;

        _campBasic     = _campInfo select CAMP_RET_BASIC;
        _campAmmo      = _campInfo select CAMP_RET_OBJECTS;
        _campStatic    = _campInfo select CAMP_RET_STATIC;
        _campAddUnit   = _campInfo select CAMP_RET_GUARDS;
        _campUserObj   = [];
        _campRandomObj = [];
        _campWall      = _campInfo select CAMP_RET_WALLS;
        _ammoBoxes     = _campInfo select CAMP_RET_AMMO;
        _campObjInit   = [[],[format ["[_x, 'indfor', %1] remoteExecCall ['BRM_FMK_fnc_assignCargo', 2];", _ammoBoxes]],[],[],[],[],[]];
    };
// =============================================================================
    default {
        if (DAC_Basic_Value != 5) then {
            DAC_Basic_Value = 5; publicvariable "DAC_Basic_Value";
            hintc "Error: DAC_Config_Camps > No valid config number";
        };
        if (true) exitwith {};
    };
// =============================================================================
};

_array = [_campBasic,_campAmmo,_campStatic,_campAddUnit,_campUserObj,_campRandomObj,_campWall,_campObjInit];

_array