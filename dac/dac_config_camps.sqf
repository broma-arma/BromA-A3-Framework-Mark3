
private ["_CampTyp","_campBasic","_campAmmo","_campStatic","_campWall", "_array",
"_campObjInit","_campUserObj","_campAddUnit","_campRandomObj","_Unit_Pool_C"];

#include "\broma_framework\loadouts\includes\vehicles-index.sqf"
#include "\broma_framework\loadouts\includes\faction-info-index.sqf"

_CampTyp = _this select 0;_array = [];

_init = { format ["if (_x isKindOf 'CAManBase') then { [_x, '%1'] call BRM_fnc_initAI }; campObjsUNITS pushBack [_x, '%1']", _this] };

campObjsSTATIC = [];
campObjsUNITS = [];

switch (_CampTyp) do {
// =============================================================================
    case 0: { // OPFOR CAMP

        _loadout = "auto";
        _campInfo = [EAST] call BRM_FMK_DAC_fnc_generateCampInfo;

        _campBasic     = _campInfo select CAMP_RET_BASIC;
        _campAmmo      = _campInfo select CAMP_RET_OBJECTS;
        _campStatic    = _campInfo select CAMP_RET_STATIC;
        _campAddUnit   = _campInfo select CAMP_RET_GUARDS;
        _campUserObj   = [];
        _campRandomObj = [];
        _campWall      = _campInfo select CAMP_RET_WALLS;
        _ammoBoxes     = _campInfo select CAMP_RET_AMMO;
        _campObjInit   = [[],[format ["[0, { [(_this select 0), 'opfor', (_this select 1)] call BRM_fnc_assignCargo }, [_x, %1]] call CBA_fnc_globalExecute", _ammoBoxes]],["campObjsSTATIC pushBack [_x, '"+_loadout+"']"],[_loadout call _init],[],[],[]];
    };
// =============================================================================
    case 1: { // BLUFOR CAMP

        _loadout = "auto";
        _campInfo = [WEST] call BRM_FMK_DAC_fnc_generateCampInfo;

        _campBasic     = _campInfo select CAMP_RET_BASIC;
        _campAmmo      = _campInfo select CAMP_RET_OBJECTS;
        _campStatic    = _campInfo select CAMP_RET_STATIC;
        _campAddUnit   = _campInfo select CAMP_RET_GUARDS;
        _campUserObj   = [];
        _campRandomObj = [];
        _campWall      = _campInfo select CAMP_RET_WALLS;
        _ammoBoxes     = _campInfo select CAMP_RET_AMMO;
        _campObjInit   = [[],[format ["[0, { [(_this select 0), 'blufor', (_this select 1)] call BRM_fnc_assignCargo }, [_x, %1]] call CBA_fnc_globalExecute", _ammoBoxes]],["campObjsSTATIC pushBack [_x, '"+_loadout+"']"],[_loadout call _init],[],[],[]];
    };
// =============================================================================
    case 2: { // INDFOR CAMP

        _loadout = "auto";
        _campInfo = [RESISTANCE] call BRM_FMK_DAC_fnc_generateCampInfo;

        _campBasic     = _campInfo select CAMP_RET_BASIC;
        _campAmmo      = _campInfo select CAMP_RET_OBJECTS;
        _campStatic    = _campInfo select CAMP_RET_STATIC;
        _campAddUnit   = _campInfo select CAMP_RET_GUARDS;
        _campUserObj   = [];
        _campRandomObj = [];
        _campWall      = _campInfo select CAMP_RET_WALLS;
        _ammoBoxes     = _campInfo select CAMP_RET_AMMO;
        _campObjInit   = [[],[format ["[0, { [(_this select 0), 'indfor', (_this select 1)] call BRM_fnc_assignCargo }, [_x, %1]] call CBA_fnc_globalExecute", _ammoBoxes]],["campObjsSTATIC pushBack [_x, '"+_loadout+"']"],[_loadout call _init],[],[],[]];
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

[{(dac_basic_value == 1)}, {
    [{
        if (count campObjsSTATIC > 0) then {
            {
                _object = (_x select 0);
                _loadout = (_x select 1);
                _unit = gunner _object;

                [_unit, _loadout] call BRM_fnc_initAI;

            } forEach campObjsSTATIC;
        };

        if (count campObjsUNITS > 0) then {
            {
                _unit = (_x select 0);
                _loadout = (_x select 1);
                { [_x, _loadout] call BRM_fnc_initAI } forEach (units group _unit);
            } forEach campObjsUNITS;
        };
    }, [], 5] call CBA_fnc_waitAndExecute;
}, []] call CBA_fnc_waitUntilAndExecute;

_array = [_campBasic,_campAmmo,_campStatic,_campAddUnit,_campUserObj,_campRandomObj,_campWall,_campObjInit];

_array