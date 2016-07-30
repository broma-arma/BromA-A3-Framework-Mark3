
// INFO ========================================================================
/*
    This is the template you can use to create your own loadouts.

    Customize it as you wish.
*/
// =============================================================================

_factionID = "TEMPLATE";
_factionName = "Template Faction";
_factionStructure = "HIGH-TIER";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceALTIAN, _voiceAMERICAN, _voiceBRITISH, _voiceFARSI, _voiceRUSSIAN, _voiceCHINESE, _voiceTANOAN];
_defaultFace = [_faceGREEK, _faceWHITE, _faceBLACK, _faceASIAN, _facePERSIAN, _faceTANOAN];
_defaultName = [_nameAMERICAN];
_defaultInsignia = "";
_defaultColor = "blue";

// WEAPONS =====================================================================

_commonRIFLE = _Mk20;
_commonRIFLEGL = _Mk20GL;
_commonPISTOL = _Rook;
_commonMG = _Zafir;
_commonMARKSMAN = _Mk20;
_commonSNIPER = _GM6;
_commonAT = _RPG42;
_specAT = _RPG42;
_commonSMG = _Mk20C;
_commonRCO = _ARCO;
_commonCCO = _EOT;
_commonMAGNIFIED = _SOS;
_commonSUPPRESSOR = "muzzle_snds_M";
_commonPISTOLSUPPRESSOR = "muzzle_snds_L";
_NVG = _NVGEN1;

// AMMO COUNT ==================================================================

_countRIFLE = 7;
_countRIFLELOW = 4;
_countPISTOL = 2;
_countMG = 3;
_countSNIPER = 5;
_countAT = 3;
_countGRENADES = 3;
_count40mm = 20;

_countTracerRIFLE = 2;
_countTracerMG = 1;
_countHE = 1;

_countRifleCARGO = 30;
_countPistolCARGO = 10;
_countMgCARGO = 20;
_countSniperCARGO = 30;
_countATCARGO = 15;
_countGrenadesCARGO = 20;
_count40mmCARGO = 40;

// MEDICAL =====================================================================

_countBANDAGE = 20;
_countMORPHINE = 10;
_countEPI = 5;
_countCAT = 3;
_countBLOODBAG = 5;
_countPAK = 2;

_countBandageCARGO = 40;
_countMorphineCARGO = 30;
_countEpiCARGO = 20;
_countBloodbagCARGO = 20;
_countPAKCARGO = 10;

// UNIFORMS ====================================================================

_headsLIST = [
    "H_Bandanna_khk",
    "H_Bandanna_mcamo",
    "H_Bandanna_sgg",
    "H_Bandanna_sand"
];

_uniformsLIST = [
    "U_C_Poloshirt_blue",
    "U_C_Poloshirt_burgundy",
    "U_C_Poloshirt_redwhite",
    "U_C_Poloshirt_salmon",
    "U_C_Poloshirt_stripped",
    "U_C_Poloshirt_tricolour"
];

_vestsLIST = [
    "V_BandollierB_blk",
    "V_BandollierB_cbr",
    "V_BandollierB_rgr",
    "V_BandollierB_khk",
    "V_BandollierB_oli"
];

_gogglesLIST = [
];

_randomHEAD = _headsLIST call BIS_fnc_selectRandom;
_randomUNIFORM = _uniformsLIST call BIS_fnc_selectRandom;
_randomVEST = _vestsLIST call BIS_fnc_selectRandom;

_commonHEAD = _randomHEAD;
_leaderHEAD = _commonHEAD;
_officerHEAD = _commonHEAD;
_medicHEAD = "H_Bandanna_cbr";
_crewmanHEAD = "rhsusf_cvc_ess";
_pilotHEAD = "rhsusf_hgu56p";
_helicrewHEAD = "rhsusf_hgu56p_mask";
_helipilotHEAD = "rhsusf_hgu56p";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = "H_caf_ag_paktol_04";

_commonUNIFORM = _randomUNIFORM;
_officerUNIFORM = "U_BG_Guerilla2_3";
_pilotUNIFORM = "U_B_PilotCoveralls";
_sniperUNIFORM = "U_B_GhillieSuit";
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = _commonUNIFORM;
_crewUNIFORM = _commonUNIFORM;
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = "U_Marshal";
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = _commonUNIFORM;

_commonVEST = _randomVEST;
_officerVEST = _commonVEST;
_ftlVEST = _commonVEST;
_slVEST = _commonVEST;
_mgVEST = _commonVEST;
_grenadierVEST = _commonVEST;
_medicVEST = _commonVEST;
_demoVEST = _commonVEST;
_marksmanVEST = _commonVEST;
_reconVEST = _commonVEST;

_commonBACKPACK = "B_AssaultPack_rgr";
_bigBACKPACK = "B_Carryall_ocamo";

// EXTRA EQUIPMENT =============================================================

_HMG = "B_HMG_01_high_weapon_F";
_HMGTripod = "B_HMG_01_support_F";

_StaticAT = "B_AT_01_weapon_F";
_ATTripod = "B_HMG_01_support_F";

_mortar = "B_Mortar_01_weapon_F";
_mortarTripod = "B_Mortar_01_support_F";

_UAVBag = "auto";
_UAVTerminal = "auto";

// VEHICLES ====================================================================

_factionVehicles = [
/* 0 - Anti Air Vehicles */      ["B_APC_Tracked_01_AA_F"]
/* 1 - Attack Helos 	 */	,["B_Heli_Attack_01_F","B_Heli_Light_01_armed_F"]
/* 2 - Attack Planes 	 */	,["B_UAV_02_CAS_F","B_UAV_02_F"]
/* 3 - Heavy Vehicles 	 */	,["B_MBT_01_cannon_F","B_MBT_01_TUSK_F"]
/* 4 - Light Vehicles 	 */	,["B_MRAP_01_hmg_F", "B_MRAP_01_hmg_F"]
/* 5 - Medium Vehicles 	 */	,["B_APC_Tracked_01_rcws_F","B_APC_Wheeled_01_cannon_F"]
/* 6 - Mobile Artillery  */	,["B_MBT_01_arty_F","B_MBT_01_mlrs_F"]
/* 7 - Transport Helos 	 */	,["B_Heli_Light_01_F","B_Heli_Transport_01_F","B_Heli_Transport_01_camo_F"]
/* 8 - Transport Planes  */	,[]
/* 9 - Transport Trucks  */	,["B_Truck_01_transport_F","B_Truck_01_covered_F"]
/*10 - Static Defence	 */	,["B_HMG_01_high_F","B_static_AA_F","B_static_AT_F","B_Mortar_01_F"]
/*11 - Boats 		 */	,["B_Boat_Armed_01_minigun_F"]
/*12 - UAV 		 */	,["B_UAV_02_CAS_F","B_UAV_02_F"]
/*13 - UGV		 */	,["B_UGV_01_F","B_UGV_01_rcws_F"]
/*14 - Support 		 */	,["B_APC_Tracked_01_CRV_F","B_Truck_01_ammo_F","B_Truck_01_fuel_F"]
/*15 - Submarines 	 */	,["B_SDV_01_F"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "Flag_NATO_F",
/* Objects      */ ["B_CargoNet_01_ammo_F"],
/* Walls        */ ["Land_Mil_WallBig_4m_F"],
/* Structures   */ ["Land_Cargo_House_V3_F"]
];

// =============================================================================