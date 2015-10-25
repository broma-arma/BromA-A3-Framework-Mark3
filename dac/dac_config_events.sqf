//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Config_Events     //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_TypNumber","_TempArray","_Events_Vehicle","_loadout",
			"_Events_Unit_S","_Events_Unit_V","_Events_Unit_T","_Events_Unit_A","_Events_Unit_C","_Events_Unit_H"
		];

			_TypNumber = _this select 0;_TempArray = [];

_initGroup = { format ["{ [_x, '%1'] spawn BRM_fnc_initAI } forEach units _group;", _this] };
_initUnit = { format ["[_unit, '%1'] spawn BRM_fnc_initAI", _this] };

switch (_TypNumber) do
{
//-------------------------------------------------------------------------------------------------------------------------------------------
//------------ Events => Create | ReachWP | NotAliveGroup | NotAliveUnit | (BeforeReduce) | (AfterBuildUp)  | (DetectEnemys) ----------------
//-------------------------------------------------------------------------------------------------------------------------------------------

	case 1: { _loadout = "auto" };

	case 2: { _loadout = "vanilla" };

        case 3: { _loadout = "RACS" };
        case 4: { _loadout = "SLA" };
        case 5: { _loadout = "MUJAHIDEEN" };
        case 6: { _loadout = "ANA" };
        case 7: { _loadout = "AHKMA-PMC" };
        case 8: { _loadout = "CHEDAKI" };
        case 9: { _loadout = "MARINES" };
        case 10: { _loadout = "IONPMC" };
        case 11: { _loadout = "TKMILITIA" };
        case 12: { _loadout = "FINNS" };
        case 13: { _loadout = "CSAT" };
        case 14: { _loadout = "NATO" };
        case 15: { _loadout = "AAF" };
        case 16: { _loadout = "FIA" };
        case 17: { _loadout = "VDV" };

// =============================================================================

	default {
                    if (DAC_Basic_Value != 5) then {
                        DAC_Basic_Value = 5; publicvariable "DAC_Basic_Value";
                        hintc "Error: DAC_Config_Events > No valid config number";
                    };
                };
};

_Events_Unit_S =	[[_loadout call _initGroup],[],[],[],[],[_loadout call _initUnit],[]];
_Events_Unit_V = 	[[_loadout call _initGroup],[],[],[],[],[_loadout call _initUnit],[]];
_Events_Unit_T = 	[[_loadout call _initGroup],[],[],[],[],[_loadout call _initUnit],[]];
_Events_Unit_A = 	[[_loadout call _initGroup],[],[],[],[],[_loadout call _initUnit],[]];
_Events_Unit_C = 	[[],[],[],[],[],[]];
_Events_Unit_H = 	[[],[],[],[]];
_Events_Vehicle =	[[],[],[]];

_TempArray = [_Events_Unit_S,_Events_Unit_V,_Events_Unit_T,_Events_Unit_A,_Events_Unit_C,_Events_Unit_H,_Events_Vehicle];
_TempArray