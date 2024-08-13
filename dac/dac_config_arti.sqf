//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Config_Arti       //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

params ["_type"];

if (_type == 0) exitwith {};

private _set0  = [20, 2, 0, 60];
private _set1  = [2, 0.1, 10, [], 3, 30];
private _set2  = [100, 10, 50, 500, 4, 1, 0];
private _set3  = [];
private _set4  = [5, 5, 1];
private _set5  = [10, 30, 1];
private _set6  = [10, 30, 1];
private _set7  = [0.1, 0.5, 1];
private _set8  = [];
private _set9  = [];
private _set10 = 15000;

switch (_type) do {
	case 1: {
		_set3  = [["O_Mortar_01_F", ["M_PG_AT"]]];
	};

	case 2: {
		_set3  = [["B_Mortar_01_F", ["M_PG_AT"]]];
	};

	case 3: {
		_set0  = [0, 0, 0, 0];
		_set1  = [0, 0, 0, [], 1, 5];
		_set2  = [100, 0, 0, 500, 4, 1, 1];
		_set3  = [["B_Mortar_01_F", ["M_Mo_82mm_AT_LG"]], ["B_MBT_01_arty_F", ["R_60mm_HE"]]];
		_set4  = [2, 5, 0];
		_set5  = [5, 10, 1];
		_set6  = [5, 10, 1];
		_set7  = [0.1, 1, 1];
		_set10 = 1500;
	};

	default {
		if (DAC_Basic_Value != 5) then {
			DAC_Basic_Value = 5; publicVariable "DAC_Basic_Value";
			hintC "Error: DAC_Config_Camps > No valid config number";
		};
	};
};

[_set0, _set1, _set2, _set3, _set4, _set5, _set6, _set7, _set8, _set9, _set10]
