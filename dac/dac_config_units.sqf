//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 2.1 - 2009    //
//--------------------------//
//    DAC_Config_Units      //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_TypNumber","_TempArray","_Unit_Pool_S","_Unit_Pool_V","_Unit_Pool_T","_Unit_Pool_A"];
_TypNumber = _this select 0;_TempArray = [];

switch (_TypNumber) do
{
//-------------------------------------------------------------------------------------------------
// REDFOR (A3)
  case 0:
  {
    _Unit_Pool_S = ["O_crew_F","O_Helipilot_F","O_Soldier_SL_F","O_soldier_AR_F","O_soldier_AR_F","O_soldier_exp_F","O_soldier_GL_F","O_soldier_GL_F","O_soldier_M_F","O_medic_F","O_soldier_AA_F","O_soldier_repair_F","O_Soldier_F","O_Soldier_F","O_soldier_LAT_F","O_soldier_LAT_F","O_soldier_lite_F","O_soldier_TL_F","O_soldier_TL_F"];
    _Unit_Pool_V = ["O_Truck_02_covered_F","O_MRAP_02_F","O_MRAP_02_F","O_MRAP_02_hmg_F"];
    _Unit_Pool_T = ["O_MBT_02_arty_F","I_APC_Wheeled_03_cannon_F","O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_F","O_MBT_02_cannon_F","O_APC_Tracked_02_AA_F"];
    _Unit_Pool_A = ["O_Heli_Attack_02_F","O_Heli_Light_02_F","O_Heli_Light_02_armed_F"];
  };
//-------------------------------------------------------------------------------------------------
// BLUFOR (A3)
  case 1:
  {
    _Unit_Pool_S = ["B_crew_F","B_Helipilot_F","B_Soldier_SL_F","B_soldier_AR_F","B_soldier_AR_F","B_soldier_exp_F","B_soldier_GL_F","B_soldier_GL_F","B_soldier_AA_F","B_soldier_M_F","B_medic_F","B_soldier_repair_F","B_Soldier_F","B_Soldier_F","B_soldier_LAT_F","B_soldier_LAT_F","B_soldier_lite_F","B_soldier_TL_F","B_soldier_TL_F"];
    _Unit_Pool_V = ["B_Truck_01_covered_F","B_MRAP_01_F","B_MRAP_01_F","B_MRAP_01_hmg_F"];
    _Unit_Pool_T = ["B_APC_Wheeled_01_cannon_F","B_APC_Tracked_01_AA_F","B_APC_Tracked_01_rcws_F","B_MBT_01_cannon_F","B_MBT_01_arty_F","B_MBT_01_mlrs_F"];
    _Unit_Pool_A = ["B_Heli_Light_01_armed_F","B_Heli_Transport_01_camo_F","B_Heli_Light_01_F"];
  };
//-------------------------------------------------------------------------------------------------
// Independent (A3)
  case 2:
  {
    _Unit_Pool_S = ["I_crew_F","I_helipilot_F","I_officer_F","I_Soldier_AT_F","I_Soldier_AA_F","I_Soldier_M_F","I_Soldier_GL_F","I_Soldier_exp_F","I_engineer_F","I_medic_F","I_Soldier_AR_F","I_Soldier_A_F"];
    _Unit_Pool_V = ["I_Truck_02_covered_F","I_Truck_02_transport_F","I_MRAP_03_hmg_F","I_MRAP_03_F","I_MRAP_03_F"];
    _Unit_Pool_T = ["I_MBT_03_cannon_F","I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F"];
    _Unit_Pool_A = ["I_Heli_light_03_F"];
  };
//-------------------------------------------------------------------------------------------------
// Civilians (A3)
  case 3:
  {
    _Unit_Pool_S = ["C_man_1","C_man_1","C_man_1","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F"];
    _Unit_Pool_V = ["C_Van_01_box_F","C_Van_01_transport_F","C_Offroad_01_F","C_Hatchback_01_sport_F","C_Hatchback_01_F"];
    _Unit_Pool_T = ["C_Van_01_box_F","C_Van_01_transport_F","C_Offroad_01_F","C_Hatchback_01_sport_F","C_Hatchback_01_F"];
    _Unit_Pool_A = [];
  };

//-------------------------------------------------------------------------------------------------
// RHS MSV (A3) 
  case 4:
  {
    _Unit_Pool_S = ["rhs_msv_crew","rhs_pilot_combat_heli","rhs_msv_sergeant","rhs_msv_at","rhs_msv_LAT","rhs_msv_rifleman","rhs_msv_machinegunner","rhs_msv_grenadier","rhs_msv_medic","rhs_msv_engineer","rhs_msv_rifleman"];
    _Unit_Pool_V = ["RHS_Ural_MSV_01","RHS_UAZ_MSV_01","rhs_btr70_msv","rhs_btr80_msv"];
    _Unit_Pool_T = ["rhs_bmp1_tv","rhs_bmp2_tv","rhs_t72bb_tv","rhs_t80bv"];
    _Unit_Pool_A = [];
  };
//-------------------------------------------------------------------------------------------------
// RHS VDV (A3) 
  case 5:
  {
    _Unit_Pool_S = ["rhs_vdv_crew","rhs_pilot_combat_heli","rhs_vdv_sergeant","rhs_msv_at","rhs_vdv_LAT","rhs_vdv_rifleman","rhs_vdv_machinegunner","rhs_vdv_grenadier","rhs_vdv_medic","rhs_vdv_engineer","rhs_vdv_rifleman"];
    _Unit_Pool_V = ["rhs_gaz66_vdv","rhs_uaz_open_vdv","rhs_btr70_msv","rhs_btr60_vdv"];
    _Unit_Pool_T = ["rhs_bmd1","rhs_bmd2","rhs_bmd4_vdv","rhs_bmd4ma_vdv"];
    _Unit_Pool_A = [];
  };
//-------------------------------------------------------------------------------------------------
// RHS US ARMY WOODLAND (A3) 
  case 6:
  {
    _Unit_Pool_S = ["rhsusf_army_ocp_crewman","rhsusf_army_ocp_helipilot","rhsusf_army_ocp_squadleader","rhsusf_army_ocp_riflemanat","rhsusf_army_ocp_rifleman","rhsusf_army_ocp_rifleman","rhsusf_army_ocp_autorifleman","rhsusf_army_ocp_grenadier","rhsusf_army_ocp_medic","rhsusf_army_ocp_engineer","rhsusf_army_ocp_rifleman"];
    _Unit_Pool_V = ["rhsusf_m1025_w_m2","rhsusf_m998_w_4dr_fulltop","rhsusf_m998_w_2dr_halftop","rhsusf_m113_usarmy"];
    _Unit_Pool_T = ["RHS_M2A2_wd","RHS_M2A3_BUSKI_wd","rhsusf_m1a1aimwd_usarmy","rhsusf_m1a1aim_tuski_wd"];
    _Unit_Pool_A = [];
  };
//-------------------------------------------------------------------------------------------------
// RHS US ARMY DESERT (A3) 
  case 7:
  {
    _Unit_Pool_S = ["rhsusf_army_ucp_crewman","rhsusf_army_ucp_helipilot","rhsusf_army_ucp_squadleader","rhsusf_army_ucp_riflemanat","rhsusf_army_ucp_rifleman","rhsusf_army_ucp_rifleman","rhsusf_army_ucp_autorifleman","rhsusf_army_ucp_grenadier","rhsusf_army_ucp_medic","rhsusf_army_ucp_engineer","rhsusf_army_ucp_rifleman"];
    _Unit_Pool_V = ["rhsusf_m1025_d_m2","rhsusf_m998_d_4dr_fulltop","rhsusf_m998_d_2dr_halftop","rhsusf_m113d_usarmy"];
    _Unit_Pool_T = ["RHS_M2A2","RHS_M2A3_BUSKI","rhsusf_m1a1aimd_usarmy","rhsusf_m1a1aim_tuski_d"];
    _Unit_Pool_A = [];
  };
//-------------------------------------------------------------------------------------------------
// Molation Army (A3) 
  case 8:
  {
    _Unit_Pool_S = ["ibr_mol_soldier_crew","ibr_mol_soldier_pilot","ibr_mol_soldier_sl","ibr_mol_soldier_at","ibr_mol_soldier_rifleman","ibr_mol_soldier_rifleman","ibr_mol_soldier_ar","ibr_mol_soldier_gl","ibr_mol_soldier_rifleman"];
    _Unit_Pool_V = ["rhs_gaz66_vdv","rhs_uaz_vdv","rhs_btr60_vdv"];
    _Unit_Pool_T = ["rhs_bmp1_tv","rhs_bmp2_tv","rhs_t72ba_tv"];
    _Unit_Pool_A = [];
  };
//-------------------------------------------------------------------------------------------------
// Afrenian Army (A3) 
  case 9:
  {
    _Unit_Pool_S = ["ibr_afr_soldier_crew","ibr_afr_soldier_pilot","ibr_afr_soldier_sl","ibr_afr_soldier_at","ibr_afr_soldier_rifleman","ibr_afr_soldier_rifleman","ibr_afr_soldier_ar","ibr_afr_soldier_gl","ibr_afr_soldier_rifleman"];
    _Unit_Pool_V = ["rhsusf_m1025_d_m2","rhsusf_m998_d_4dr_fulltop","rhsusf_m998_d_2dr_halftop","rhsusf_m113d_usarmy"];
    _Unit_Pool_T = ["rhs_bmp1_tv","rhs_bmp2_tv","rhs_t72ba_tv"];
    _Unit_Pool_A = [];
  };
//-------------------------------------------------------------------------------------------------
// RHS Insurgents (A3) 
  case 10:
  {
    _Unit_Pool_S = ["rhs_g_Soldier_F","rhs_g_Soldier_F","rhs_g_Soldier_SL_F","rhs_g_Soldier_AT_F","rhs_g_Soldier_F","rhs_g_Soldier_AR_F","rhs_g_medic_F","rhs_g_Soldier_GL_F","rhs_g_Soldier_SL_F"];
    _Unit_Pool_V = ["rhs_gaz66_vdv","rhs_uaz_vdv","rhs_btr60_vdv"];
    _Unit_Pool_T = ["rhs_bmp1_tv","rhs_bmp2_tv","rhs_t72ba_tv"];
    _Unit_Pool_A = [];
  };
//-------------------------------------------------------------------------------------------------
  Default
  {
    if(DAC_Basic_Value != 5) then
    {
      DAC_Basic_Value = 5;publicvariable "DAC_Basic_Value",
      hintc "Error: DAC_Config_Units > No valid config number";
    };
    if(true) exitwith {};
  };
};

if(count _this == 2) then
{
  _TempArray = _TempArray + [_Unit_Pool_S,_Unit_Pool_V,_Unit_Pool_T,_Unit_Pool_A];
}
else
{
  _TempArray = _Unit_Pool_V + _Unit_Pool_T + _Unit_Pool_A;
};
_TempArray
