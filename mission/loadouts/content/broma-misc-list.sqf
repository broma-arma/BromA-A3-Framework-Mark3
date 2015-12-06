
// =============================================================================
//                          MISCELLANEOUS ITEMS
// =============================================================================

// MEDICAL =====================================================================

switch (true) do {
    case (mission_AGM_enabled): {
        _bandage = "AGM_Bandage";
        _morphine = "AGM_Morphine";
        _epi = "AGM_Epipen";
        _bloodbag = "AGM_Bloodbag";
    };
    case (mission_ACE3_enabled): {
        _fieldDressing = "ACE_fieldDressing";
        _bandage = _fieldDressing;
        _packingBandage = "ACE_packingBandage";
        _elasticBandage = "ACE_elasticBandage";

        _quickClot = "ACE_quikclot";
        _personalAidKit = "ACE_personalAidKit";

        _tourniquet = "ACE_tourniquet";

        _morphine = "ACE_morphine";
        _atrophine = "ACE_atropine";
        _epi = "ACE_epinephrine";

        _saline1000 = "ACE_salineIV";
        _saline500 = "ACE_salineIV_500";
        _saline250 = "ACE_salineIV_250";

        _blood1000 = "ACE_bloodIV";
        _blood500 = "ACE_bloodIV_500";
        _blood250 = "ACE_bloodIV_250";

        _plasma1000 = "ACE_plasmaIV";
        _plasma500 = "ACE_plasmaIV_500";
        _plasma250 = "ACE_plasmaIV_250";

        _bloodbag = _blood1000;

        _surgKit = "ACE_surgicalKit";

        _bodyBag = "ACE_bodyBag";

        _defib = "ACE_Defibillator";
    };
};

// GRENADES ====================================================================

_wSMOKE = "SmokeShell";
_gSMOKE = "SmokeShellGreen";
_rSMOKE = "SmokeShellRed";
_ySMOKE = "SmokeShellYellow";

_wSMOKEopfor = "rhs_mag_rdg2_white";
_bSMOKEopfor = "rhs_mag_rdg2_black";
_oSMOKEopfor = "rhs_mag_nspd";
_ySMOKEopfor = "rhs_mag_nspn_yellow";
_rSMOKEopfor = "rhs_mag_nspn_red";
_gSMOKEopfor = "rhs_mag_nspn_green";

_rCHEMLIGHT = "chemlight_red";
_gCHEMLIGHT = "chemlight_green";
_bCHEMLIGHT = "chemlight_blue";

_irGRENADEblufor = "B_IR_Grenade";
_irGRENADEopfor = "O_IR_Grenade";
_irGRENADEindfor = "I_IR_Grenade";

_GRENADE = "HandGrenade";
_GRENADEopfor = "rhs_mag_rgd5";
_miniGRENADE = "MiniGrenade";
_m67GRENADE = "rhs_mag_m67";

_FLASHBANGblufor = "AGM_M84";
_rhsFLASHBANGblufor = "rhs_mag_mk84";
_FLASHBANGopfor = "rhs_mag_fakel";
_FLASHBANGopforS = "rhs_mag_fakels";
_flashbangZarya = "rhs_mag_zarya2";
_flashbangPlamyam = "rhs_mag_plamyam";

_CS = "rhs_mag_m7a3_cs";

_INCENDIARY = "rhs_mag_an_m14_th3";

switch (true) do {
    case (mission_AGM_enabled): {
        _wFLARE = "AGM_HandFlare_White";
        _rFLARE = "AGM_HandFlare_Red";
        _gFLARE = "AGM_HandFlare_Green";
        _yFLARE = "AGM_HandFlare_Yellow";
    };
    case (mission_ACE3_enabled): {
        _wFLARE = "ACE_HandFlare_White";
        _rFLARE = "ACE_HandFlare_Red";
        _gFLARE = "ACE_HandFlare_Green";
        _yFLARE = "ACE_HandFlare_Yellow";
    };
    default {
        _wFLARE = "";
        _rFLARE = "";
        _gFLARE = "";
        _yFLARE = "";
    };
};

// EXPLOSIVES ==================================================================

// IEDs

_iedURBAN = "IEDUrbanBig_Remote_Mag";
_iedURBANsmall = "IEDUrbanSmall_Remote_Mag";
_iedLAND = "IEDLandBig_Remote_Mag";
_iedLANDsmall = "IEDLandSmall_Remote_Mag";

// AT Mines

_atMINE = "ATMine_Range_Mag";
_atMINEopfor = "rhs_mine_tm62m_mag";
_atMINEblufor = "rhs_mine_M19_mag";

// AP Mines

_apMINE = "APERSMine_Range_Mag";
_apBoundingMINE = "APERSBoundingMine_Range_Mag";
_apTRIPWIRE = "APERSTripMine_Wire_Mag";
_claymore = "ClaymoreDirectionalMine_Remote_Mag";
_apMINEopfor = "rhs_mine_pmn2_mag";

// Explosives

_SLAM = "SLAMDirectionalMine_Wire_Mag";
_C4 = "DemoCharge_Remote_Mag";
_satchelCharge = "SatchelCharge_Remote_Mag";

// UTILITY =====================================================================

_mineDetector = "MineDetector";
_toolKit = "ToolKit";

switch (true) do {
    case (mission_AGM_enabled): {
        _cableTie = "AGM_CableTie";
        _uavBattery = "AGM_UAVBattery";
        _mapTools = "AGM_MapTools";
        _spareBarrel = "AGM_SpareBarrel";
        _kestrel = "AGM_ItemKestrel";
        _IRStrobe = "AGM_IR_Strobe_Item";
        _flashlight = "";
        _clacker = "AGM_Clacker";
        _M26clacker = "AGM_M26_Clacker";
        _defusalKit = "AGM_DefusalKit";
        _deadManSwitch = "AGM_DeadManSwitch";
        _earBuds = "AGM_EarBuds";
    };
    case (mission_ACE3_enabled): {
        _spareBarrel = "ACE_SpareBarrel";
        _IRStrobe = "ACE_IR_Strobe_Item";
        _cableTie = "ACE_CableTie";
        _flashlight = "ACE_Flashlight_XL50";
        _clacker = "ACE_Clacker";
        _M26clacker = "ACE_M26_Clacker";
        _defusalKit = "ACE_DefusalKit";
        _deadManSwitch = "ACE_DeadManSwitch";
        _cellphone = "ACE_Cellphone";
        _earBuds = "ACE_EarPlugs";
        _microDAGR = "ACE_microDAGR";
        _mapTools = "ACE_MapTools";
        _uavBattery = "ACE_UAVBattery";
        _kestrel = "ACE_Kestrel";
    };
    default {
        _spareBarrel = "";
        _IRStrobe = "";
        _cableTie = "";
        _clacker = "";
        _M26clacker = "";
        _defusalKit = "";
        _flashlight = "";
        _deadManSwitch = "";
        _cellphone = "";
        _earBuds = "";
        _microDAGR = "";
        _mapTools = "";
        _uavBattery = "";
        _kestrel = "";
    };
};

// ETC =========================================================================

_optics = ["Binocular","Rangefinder","Laserdesignator"];
_battery = ["Laserbatteries"];
