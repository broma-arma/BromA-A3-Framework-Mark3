//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Config_Camps      //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_CampTyp","_campBasic","_campAmmo","_campStatic","_campWall","_campObjInit",
			"_campUserObj","_campAddUnit","_campRandomObj","_Unit_Pool_C","_array"
		];

			_CampTyp = _this select 0;_array = [];

_init = { format ["if (_x isKindOf 'CAManBase') then { [_x, '%1'] spawn BRM_fnc_initAI }; campObjsUNITS pushBack [_x, '%1']", _this] };

campObjsSTATIC = [];
campObjsUNITS = [];

switch (_CampTyp) do {
//-------------------------------------------------------------------------------------------------------------------------
	case 0: // OPFOR CAMP
	{
            _loadout = "auto";
            _ammoBoxes = ["medical","ammo"];
            
		_campBasic     = ["FlagCarrierOPFOR_EP1",["FirePlace_burning_f",15,10,0],["Land_BagBunker_Tower_F",10,0,0],["Logic",10,15,0],0];
		_campAmmo      = [["O_CargoNet_01_ammo_F",20,2,0],["O_CargoNet_01_ammo_F",20,0,0]];
		_campStatic    = [["O_Mortar_01_F",-7,25,0,"O_Soldier_F"],["O_Mortar_01_F",25,25,0,"O_Soldier_F"],["O_Mortar_01_F",25,-20,180,"O_Soldier_F"],["O_Mortar_01_F",-7,-20,180,"O_Soldier_F"]];
		_campAddUnit   = ["O_soldier_LAT_F","O_soldier_lite_F","O_soldier_TL_F","O_soldier_TL_F"];
		_campUserObj   = [];
		_campRandomObj = [];
		_campWall      = ["FenceWood",[-2,35],[40,40,1],[7,0,0,4],[1,0.1],[1,90]];
		_campObjInit   = [[],[format ["[0, { [(_this select 0), 'opfor', (_this select 1)] spawn BRM_fnc_assignCargo }, [_x, %1]] call CBA_fnc_globalExecute", _ammoBoxes]],["campObjsSTATIC pushBack [_x, '"+_loadout+"']"],[_loadout call _init],[],[],[]];
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 1: // BLUFOR CAMP
	{
            _loadout = "auto";
            _ammoBoxes = ["medical","ammo"];
            
		_campBasic     = ["FlagCarrierBLUFOR_EP1",["FirePlace_burning_f",15,10,0],["Land_BagBunker_Tower_F",10,0,0],["Logic",10,15,0],0];
		_campAmmo      = [["B_CargoNet_01_ammo_F",20,2,0],["B_CargoNet_01_ammo_F",20,0,0]];
		_campStatic    = [["B_Mortar_01_F",-7,25,0,"B_Soldier_F"],["B_Mortar_01_F",25,25,0,"B_Soldier_F"],["B_Mortar_01_F",25,-20,180,"B_Soldier_F"],["B_Mortar_01_F",-7,-20,180,"B_Soldier_F"]];
		_campAddUnit   = ["B_soldier_LAT_F","B_soldier_lite_F","B_soldier_TL_F","B_soldier_TL_F"];
		_campUserObj   = [];
		_campRandomObj = [];
		_campWall      = ["FenceWood",[-2,35],[40,40,1],[7,0,0,4],[1,0.1],[1,90]];
		_campObjInit   = [[],[format ["[0, { [(_this select 0), 'blufor', (_this select 1)] spawn BRM_fnc_assignCargo }, [_x, %1]] call CBA_fnc_globalExecute", _ammoBoxes]],["campObjsSTATIC pushBack [_x, '"+_loadout+"']"],[_loadout call _init],[],[],[]];
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 2: // INDFOR CAMP
	{
            _loadout = "auto";
            _ammoBoxes = ["medical","ammo"];
            
		_campBasic     = ["FlagCarrierINDFOR_EP1",["FirePlace_burning_f",15,10,0],["Land_BagBunker_Tower_F",10,0,0],["Logic",10,15,0],0];
		_campAmmo      = [["I_CargoNet_01_ammo_F",20,2,0],["I_CargoNet_01_ammo_F",20,0,0]];
		_campStatic    = [["I_Mortar_01_F",-7,25,0,"I_Soldier_F"],["I_Mortar_01_F",25,25,0,"I_Soldier_F"],["I_Mortar_01_F",25,-20,180,"I_Soldier_F"],["I_Mortar_01_F",-7,-20,180,"I_Soldier_F"]];
		_campAddUnit   = ["I_soldier_LAT_F","I_soldier_lite_F","I_soldier_TL_F","I_soldier_TL_F"];
		_campUserObj   = [];
		_campRandomObj = [];
		_campWall      = ["FenceWood",[-2,35],[40,40,1],[7,0,0,4],[1,0.1],[1,90]];
		_campObjInit   = [[],[format ["[0, { [(_this select 0), 'indfor', (_this select 1)] spawn BRM_fnc_assignCargo }, [_x, %1]] call CBA_fnc_globalExecute", _ammoBoxes]],["campObjsSTATIC pushBack [_x, '"+_loadout+"']"],[_loadout call _init],[],[],[]];
	};        
//-------------------------------------------------------------------------------------------------------------------------
	default {
                    if(DAC_Basic_Value != 5) then
                    {
                            DAC_Basic_Value = 5;publicvariable "DAC_Basic_Value";
                            hintc "Error: DAC_Config_Camps > No valid config number";
                    };
                    if(true) exitwith {};
                };
};

[] spawn {
    waitUntil{(DAC_Basic_Value == 1)};
    
    sleep 2;
        
    if (count campObjsSTATIC > 0) then {
        {
            _object = (_x select 0);
            _loadout = (_x select 1);        
            _unit = gunner _object;

            [_unit, _loadout] spawn BRM_fnc_initAI;

        } forEach campObjsSTATIC;
    };
};

[] spawn {
    waitUntil{(DAC_Basic_Value == 1)};
    
    sleep 5;
    
    if (count campObjsUNITS > 0) then {
        {
            _unit = (_x select 0);
            _loadout = (_x select 1);
            { [_x, _loadout] call BRM_fnc_initAI } forEach units group _unit;
        } forEach campObjsUNITS;
    };
};

_array = [_campBasic,_campAmmo,_campStatic,_campAddUnit,_campUserObj,_campRandomObj,_campWall,_campObjInit];
_array