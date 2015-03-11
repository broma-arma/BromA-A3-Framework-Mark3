//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Config_Creator    //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

scalar = "any";DAC_Init_Camps = 0;

waitUntil{(!isNil "mission_AI_controller")};

if (mission_AI_controller) then {    
    if (local player) then {
        DAC_Code = 1;
    } else {
        DAC_Code = 0;
    }
} else {
    if (isnull player) then {
        DAC_Code = 3;
    } else {
        DAC_Code = 2;
    };
};

_markers = 2;
_com = [1,2,3,0];

if (isMultiplayer) then {
    _markers = 0;
    _com = [0,0,0,0];
};

//===============|
// DAC_Settings	 |
//===============|=============================================================================================|

    if(isNil "DAC_STRPlayers")          then {		DAC_STRPlayers		= ["s1","s2","s3","s4","s5","s6","s7","s8","s9","s10"]  };
    if(isNil "DAC_AI_Count_Level")	then {		DAC_AI_Count_Level      = [[2,4],[3,6],[4,8],[6,12],[1,0]]			};
    if(isNil "DAC_Dyn_Weather") 	then {		DAC_Dyn_Weather		= [0,0,0,[0, 0, 0],0]					};
    if(isNil "DAC_Reduce_Value") 	then {		DAC_Reduce_Value	= [800,850,0.3]						};
    if(isNil "DAC_AI_Spawn")            then {		DAC_AI_Spawn		= [[10,5,5],[10,5,15],0,120,250,0]			};
    if(isNil "DAC_Delete_Value") 	then {		DAC_Delete_Value	= [[180,150],[180,150],6000]				};
    if(isNil "DAC_Del_PlayerBody") 	then {		DAC_Del_PlayerBody	= [0,0]							};
    if(isNil "DAC_Com_Values")          then {		DAC_Com_Values		= _com  						};
    if(isNil "DAC_AI_AddOn")            then {		DAC_AI_AddOn		= 1							};
    if(isNil "DAC_AI_Level")            then {		DAC_AI_Level		= 3							};
    if(isNil "DAC_Res_Side")            then {		DAC_Res_Side		= 0							};
    if(isNil "DAC_Marker") 		then {		DAC_Marker		= _markers              				};
    if(isNil "DAC_WP_Speed")            then {		DAC_WP_Speed		= 0.01							};
    if(isNil "DAC_Join_Action")         then {		DAC_Join_Action		= false							};
    if(isNil "DAC_Fast_Init")           then {		DAC_Fast_Init		= true							};
    if(isNil "DAC_Player_Marker")	then {		DAC_Player_Marker	= false							};
    if(isNil "DAC_Direct_Start")	then {		DAC_Direct_Start	= false							};
    if(isNil "DAC_Activate_Sound")	then {		DAC_Activate_Sound	= false							};
    if(isNil "DAC_Auto_UnitCount")	then {		DAC_Auto_UnitCount	= [20,10]						};
    if(isNil "DAC_Player_Support")	then {		DAC_Player_Support	= [10,[4,2000,3,1000]]					};
    if(isNil "DAC_SaveDistance")	then {		DAC_SaveDistance	= [500,["DAC_Save_Pos"]]				};
    if(isNil "DAC_Radio_Max")           then {		DAC_Radio_Max		= DAC_AI_Level						};

    DAC_BadBuildings            = 	[];
    DAC_GunNotAllowed           = 	[];
    DAC_VehNotAllowed           = 	[];
    DAC_Locked_Veh		=	[];
    DAC_SP_Soldiers             =       ["B_soldier_AR_F","B_G_soldier_AR_F","O_soldier_AR_F","O_soldierU_AR_F","O_G_soldier_AR_F","I_soldier_AR_F","I_G_soldier_AR_F"];
    DAC_Data_Array 		= 	[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,[]];
    DAC_Marker_Val		= 	[];
    DAC_Zones                   =	[];

    //=============================================================================================================|

    _scr = [] spawn (compile preprocessFile "\DAC_Source\Scripts\DAC_Start_Creator.sqf");
    waituntil {scriptdone _scr};
    sleep 0.1;
    waituntil {(DAC_Basic_Value > 0)};