//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Config_Creator    //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

scalar = "any";
DAC_Init_Camps = 0;

waitUntil { !isNil "mission_AI_controller_name" && missionNamespace getVariable ["pluginsLoaded", false] };

if (mission_AI_controller) then {
	DAC_Code = parseNumber hasInterface;
} else {
	DAC_Code = parseNumber didJIP + 2;
};

//===============|
// DAC_Settings  |
//===============|=============================================================================================|

if (isNil "DAC_STRPlayers") then {
	// All playable units. Chances are you can just leave this alone.
	DAC_STRPlayers = [
		// BLUFOR
		"blu_0_0_1", "blu_0_0_2", "blu_0_0_3",
			"blu_1_0_1", "blu_1_0_2",
				"blu_1_1_1", "blu_1_1_2", "blu_1_1_3", "blu_1_1_4",
				"blu_1_2_1", "blu_1_2_2", "blu_1_2_3", "blu_1_2_4",
			"blu_2_0_1", "blu_2_0_2",
				"blu_2_1_1", "blu_2_1_2", "blu_2_1_3", "blu_2_1_4",
				"blu_2_2_1", "blu_2_2_2", "blu_2_2_3", "blu_2_2_4",
			"blu_3_0_1", "blu_3_0_2",
				"blu_3_1_1", "blu_3_1_2", "blu_3_1_3", "blu_3_1_4",
				"blu_3_2_1", "blu_3_2_2", "blu_3_2_3", "blu_3_2_4",
			"blu_4_0_1", "blu_4_0_2",
				"blu_4_1_1", "blu_4_1_2", "blu_4_1_3", "blu_4_1_4",
				"blu_4_2_1", "blu_4_2_2", "blu_4_2_3", "blu_4_2_4",
			"blu_5_0_1", "blu_5_0_2", "blu_5_0_3", "blu_5_0_4",
			"blu_6_0_1", "blu_6_0_2", "blu_6_0_3", "blu_6_0_4",
			"blu_7_0_1", "blu_7_0_2", "blu_7_0_3", "blu_7_0_4",
			"blu_8_0_1", "blu_8_0_2", "blu_8_0_3",
			"blu_9_0_1", "blu_9_0_2",
			"blu_10_1_1", "blu_10_1_2",
			"blu11_1_1", "blu_11_1_2", "blu_11_1_3",
			"blu_12_1_1", "blu_12_1_2", "blu_12_1_3", "blu_12_1_4",
			"blu_13_1_1", "blu_13_1_2", "blu_13_1_3", "blu_13_1_4", "blu_13_1_5",
			"blu_14_2_1", "blu_14_2_2",
			"blu_14_2_1", "blu_14_2_2",

		// OPFOR
		"op_0_0_1", "op_0_0_2", "op_0_0_3",
			"op_1_0_1", "op_1_0_2",
				"op_1_1_1", "op_1_1_2", "op_1_1_3", "op_1_1_4",
				"op_1_2_1", "op_1_2_2", "op_1_2_3", "op_1_2_4",
			"op_2_0_1", "op_2_0_2",
				"op_2_1_1", "op_2_1_2", "op_2_1_3", "op_2_1_4",
				"op_2_2_1", "op_2_2_2", "op_2_2_3", "op_2_2_4",
			"op_3_0_1", "op_3_0_2",
				"op_3_1_1", "op_3_1_2", "op_3_1_3", "op_3_1_4",
				"op_3_2_1", "op_3_2_2", "op_3_2_3", "op_3_2_4",
			"op_4_0_1", "op_4_0_2",
				"op_4_1_1", "op_4_1_2", "op_4_1_3", "op_4_1_4",
				"op_4_2_1", "op_4_2_2", "op_4_2_3", "op_4_2_4",
			"op_5_0_1", "op_5_0_2", "op_5_0_3", "op_5_0_4",
			"op_6_0_1", "op_6_0_2", "op_6_0_3", "op_6_0_4",
			"op_7_0_1", "op_7_0_2", "op_7_0_3", "op_7_0_4",
			"op_8_0_1", "op_8_0_2", "op_8_0_3",
			"op_9_0_1", "op_9_0_2",
			"op_10_1_1", "op_10_1_2",
			"op11_1_1", "op_11_1_2", "op_11_1_3",
			"op_12_1_1", "op_12_1_2", "op_12_1_3", "op_12_1_4",
			"op_13_1_1", "op_13_1_2", "op_13_1_3", "op_13_1_4", "op_13_1_5",
			"op_14_2_1", "op_14_2_2",
			"op_14_2_1", "op_14_2_2",

		// Independent
		"ind_0_0_1", "ind_0_0_2", "ind_0_0_3",
			"ind_1_0_1", "ind_1_0_2",
				"ind_1_1_1", "ind_1_1_2", "ind_1_1_3", "ind_1_1_4",
				"ind_1_2_1", "ind_1_2_2", "ind_1_2_3", "ind_1_2_4",
			"ind_2_0_1", "ind_2_0_2",
				"ind_2_1_1", "ind_2_1_2", "ind_2_1_3", "ind_2_1_4",
				"ind_2_2_1", "ind_2_2_2", "ind_2_2_3", "ind_2_2_4",
			"ind_3_0_1", "ind_3_0_2",
				"ind_3_1_1", "ind_3_1_2", "ind_3_1_3", "ind_3_1_4",
				"ind_3_2_1", "ind_3_2_2", "ind_3_2_3", "ind_3_2_4",
			"ind_4_0_1", "ind_4_0_2",
				"ind_4_1_1", "ind_4_1_2", "ind_4_1_3", "ind_4_1_4",
				"ind_4_2_1", "ind_4_2_2", "ind_4_2_3", "ind_4_2_4",
			"ind_5_0_1", "ind_5_0_2", "ind_5_0_3", "ind_5_0_4",
			"ind_6_0_1", "ind_6_0_2", "ind_6_0_3", "ind_6_0_4",
			"ind_7_0_1", "ind_7_0_2", "ind_7_0_3", "ind_7_0_4",
			"ind_8_0_1", "ind_8_0_2", "ind_8_0_3",
			"ind_9_0_1", "ind_9_0_2",
			"ind_10_1_1", "ind_10_1_2",
			"ind11_1_1", "ind_11_1_2", "ind_11_1_3",
			"ind_12_1_1", "ind_12_1_2", "ind_12_1_3", "ind_12_1_4",
			"ind_13_1_1", "ind_13_1_2", "ind_13_1_3", "ind_13_1_4", "ind_13_1_5",
			"ind_14_2_1", "ind_14_2_2",
			"ind_14_2_1", "ind_14_2_2",

		// Civilian (Reporters)
		"civ_0_0_1", "civ_0_0_2"
	];
};
if (isNil "DAC_AI_Count_Level") then { DAC_AI_Count_Level = [[2, 4], [3, 6], [4, 8], [6, 12], [1, 0]] };
if (isNil "DAC_Dyn_Weather") then { DAC_Dyn_Weather = [0, 0, 0, [0, 0, 0], 0] };
if (isNil "DAC_Reduce_Value") then { DAC_Reduce_Value = [800, 850, 0.3] };
if (isNil "DAC_AI_Spawn") then { DAC_AI_Spawn = [[10, 5, 5], [10, 5, 15], 0, 60, 250, 0] };
if (isNil "DAC_Delete_Value") then { DAC_Delete_Value = [[180, 150], [180, 150], 6000] };
if (isNil "DAC_Del_PlayerBody") then { DAC_Del_PlayerBody = [0, 0] };
if (isNil "DAC_Com_Values") then { DAC_Com_Values = [[1, 2, 0, 0], [0, 0, 0, 0]] select isMultiplayer };
if (isNil "DAC_AI_AddOn") then { DAC_AI_AddOn = 1 };
if (isNil "DAC_AI_Level") then { DAC_AI_Level = 3 };
if (isNil "DAC_Res_Side") then {
	getMissionConfigValue ["IntelIndepAllegiance", [1, 0]] params ["_west", "_east"];
	_east = _east > 0;
	DAC_Res_Side = [[2, 0] select _east, [1, 2] select _east] select (_west > 0);
};
if (isNil "DAC_Marker") then { DAC_Marker = parseNumber !isMultiplayer };
if (isNil "DAC_WP_Speed") then { DAC_WP_Speed = 0.01 };
if (isNil "DAC_Join_Action") then { DAC_Join_Action = false };
if (isNil "DAC_Fast_Init") then { DAC_Fast_Init = true };
if (isNil "DAC_Player_Marker") then { DAC_Player_Marker = false };
if (isNil "DAC_Direct_Start") then { DAC_Direct_Start = false };
if (isNil "DAC_Activate_Sound") then { DAC_Activate_Sound = false };
if (isNil "DAC_Auto_UnitCount") then { DAC_Auto_UnitCount = [20, 10] };
if (isNil "DAC_Player_Support") then { DAC_Player_Support = [10, [4, 2000, 3, 1000]] };
if (isNil "DAC_SaveDistance") then { DAC_SaveDistance = [500, ["DAC_Save_Pos"]] };
if (isNil "DAC_Radio_Max") then { DAC_Radio_Max = DAC_AI_Level };

DAC_BadBuildings = [];
DAC_GunNotAllowed = [];
DAC_VehNotAllowed = [];
DAC_Locked_Veh = [];
DAC_SP_Soldiers = ["B_soldier_AR_F", "B_G_soldier_AR_F", "O_soldier_AR_F", "O_soldierU_AR_F", "O_G_soldier_AR_F", "I_soldier_AR_F", "I_G_soldier_AR_F"];
DAC_Data_Array = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, []];
DAC_Marker_Val = [];
DAC_Zones = [];

//=============================================================================================================|

private _scr = [] spawn (compile preprocessFile "\DAC_Source\Scripts\DAC_Start_Creator.sqf");
waitUntil { scriptDone _scr };
sleep 0.1;
waitUntil { (DAC_Basic_Value > 0) };
