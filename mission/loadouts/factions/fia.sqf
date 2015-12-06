
// INFO ========================================================================
/*
    Believed to be chiefly composed of former and defected members of the
    Altis Armed Forces, disparate fragments of opposition to the 2026 Kavala
    coup d'etat joined together in the grind of bloody civil war.
*/

_defaultSide = WEST;
_defaultVoice = [_voiceALTIAN];
_defaultFace = [_faceGREEK];
_defaultName = [_nameAMERICAN];
_defaultInsignia = "";

// WEAPONS =====================================================================

_rifleList = [_TRG, _Mk20, _Mk20Camo, _Mk20C, _Mk20CCamo];
_rifleGLList = [_Mk20GL, _Mk20GLCamo, _TRGGL];

_randomRifle = _rifleList call BIS_fnc_selectRandom;
_randomRifleGL = _rifleGLList call BIS_fnc_selectRandom;

_commonRIFLE = _randomRifle;
_commonRIFLEGL = _randomRifleGL;
_commonPISTOL = _ACP45;
_commonMG = _Mk200;
_commonMARKSMAN = _Mk18;
_commonSNIPER = _Mk18;
_commonAT = _RPG42;
_specAT = _RPG42;
_commonSMG = _PDW;
_commonRCO = "optic_MRCO";
_commonCCO = "optic_ACO_grn";
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

_countRifleCARGO = 30;
_countPistolCARGO = 10;
_countMgCARGO = 20;
_countSniperCARGO = 30;
_countATCARGO = 15;
_countGrenadesCARGO = 20;
_count40mmCARGO = 40;

// MEDICAL SUPPLIES ============================================================

switch (true) do {

    case (mission_AGM_enabled): {

        _countBANDAGE = 20;
        _countMORPHINE = 15;
        _countEPI = 10;
        _countBLOODBAG = 5;

        _countBandageCARGO = 40;
        _countMorphineCARGO = 30;
        _countEpiCARGO = 20;
        _countBloodbagCARGO = 10;

        _suppliesMEDIC = [[_unit,[_bandage,_countBANDAGE], [_morphine,_countMORPHINE],[_epi,_countEPI],[_bloodbag,_countBLOODBAG]]];
        _suppliesNORMAL = [[_unit,[_bandage, 2], [_morphine,1],[_epi, 1]]];
    };

    case (mission_ACE3_enabled): {

        _countBANDAGE = 25;
        _countMORPHINE = 20;
        _countEPI = 10;
        _countCAT = 20;
        _countBLOODBAG = 3;

        _countBandageCARGO = 40;
        _countMorphineCARGO = 30;
        _countEpiCARGO = 20;
        _countBloodbagCARGO = 10;

        switch (param_ace3_medical_level) do {

            case 0: { // SIMPLE
                _suppliesMEDIC = [[_unit,[_fieldDressing,_countBANDAGE], [_morphine,_countMORPHINE],[_epi,_countEPI],[_bloodbag,_countBLOODBAG]]];
                _suppliesNORMAL = [[_unit,[_fieldDressing, 2], [_morphine,1],[_epi, 1]]];
            };
            case 1: { // ADVANCED
                _suppliesMEDIC = [[_unit,[_packingBandage,_countBANDAGE], [_morphine,_countMORPHINE],[_epi,_countEPI],[_saline250,_countBLOODBAG],[_defib,1],[_surgKit,1]]];
                _suppliesNORMAL = [[_unit,[_fieldDressing, 2],[_packingBandage, 1],[_tourniquet, 1],[_morphine,1],[_epi,1]]];
            };
        };
    };

    default {
        _suppliesMEDIC = [[_unit,["FirstAidKit",20],["Medikit",1]]];
        _suppliesNORMAL = [[_unit,["FirstAidKit",3]]];
    };
};

// UNIFORMS ====================================================================

_headsLIST = [
    "H_Bandanna_khk",
    "H_Bandanna_mcamo",
    "H_Bandanna_sgg",
    "H_Bandanna_sand",
    "H_Cap_blk",
    "H_Cap_blu",
    "H_Cap_oli_hs",
    "H_Shemag_olive",
    "H_Shemag_olive_hs",
    "H_ShemagOpen_tan",
    "H_ShemagOpen_khk"
];

_uniformsLIST = [
    "U_BG_Guerrilla_6_1",
    "U_BG_Guerilla1_1",
    "U_BG_Guerilla2_2",
    "U_BG_Guerilla2_1",
    "U_BG_Guerilla2_3",
    "U_BG_Guerilla3_1",
    "U_BG_leader",
    "U_C_HunterBody_grn",
    "U_I_G_Story_Protagonist_F"
];

_vestsLIST = [
    "V_TacVest_blk",
    "V_TacVest_brn",
    "V_TacVest_camo",
    "V_TacVest_khk",
    "V_TacVest_oli"
];

_randomHEAD = _headsLIST call BIS_fnc_selectRandom;
_randomUNIFORM = _uniformsLIST call BIS_fnc_selectRandom;
_randomVEST = _vestsLIST call BIS_fnc_selectRandom;

_commonHEAD = _randomHEAD;
_leaderHEAD = "H_Watchcap_blk";
_officerHEAD = "empty";
_medicHEAD = _commonHEAD;
_crewmanHEAD = _commonHEAD;
_pilotHEAD = _commonHEAD;
_helicrewHEAD = _commonHEAD;
_helipilotHEAD = _commonHEAD;
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = "H_Booniehat_khk_hs";

_commonUNIFORM = _randomUNIFORM;
_officerUNIFORM = _commonUNIFORM;
_pilotUNIFORM = _commonUNIFORM;
_sniperUNIFORM = _commonUNIFORM;
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = _commonUNIFORM;
_crewUNIFORM = _commonUNIFORM;
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _commonUNIFORM;
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

_commonBACKPACK = "B_AssaultPack_dgtl";
_bigBACKPACK = "B_Carryall_oli";

_HMG = "I_HMG_01_A_high_weapon_F";
_tripod = "I_HMG_01_support_F";

// =============================================================================
if (!_isMan) exitWith {};
switch (true) do {
// =============================================================================

    case (_isOfficer): {
        [_officerHEAD, _officerUNIFORM, _officerVEST, "empty"] call _useUniform;
        [[_unit,[_wsmoke,2],[_rsmoke,2],[_mapTools,1]]] call _addtoVest;
        [_commonRIFLE, _countRIFLE] call _addWeaponKit;
        [_commonPISTOL, _countPISTOL] call _addWeaponKit;
        ["laserdesignator"] call _addOptics;
        ["LR"] call _addRadio;
        ["BP"] call _addRadio;
    };

    case (_isSquadLeader): {
        [_leaderHEAD, _commonUNIFORM, _slVEST, "empty"] call _useUniform;
        [[_unit,[_wsmoke,2],[_rsmoke,2],[_mapTools,1]]] call _addtoVest;
        [_commonRIFLE, _countRIFLE] call _addWeaponKit;
        [_commonPISTOL, _countPISTOL] call _addWeaponKit;
        ["primary", _commonRCO] call _attachToWeapon;
        ["rangefinder"] call _addOptics;
        ["LR"] call _addRadio;
        ["BP"] call _addRadio;
    };

    case (_isTeamLeader): {
        [_leaderHEAD, _commonUNIFORM, _ftlVEST, "empty"] call _useUniform;
        [[_unit,[_wsmoke,2],[_rsmoke,2]]] call _addtoVest;
        [_commonRIFLE, _countRIFLE] call _addWeaponKit;
        [_commonPISTOL, _countPISTOL] call _addWeaponKit;
        ["primary", _commonCCO] call _attachToWeapon;
        ["binoc"] call _addOptics;
        ["LR"] call _addRadio;
    };

    case (_isReconLeader): {
        [_reconHEAD, _reconUNIFORM, _reconVEST, "empty"] call _useUniform;
        [[_unit,[_wsmoke,2],[_rsmoke,2],[_gsmoke,2],[_rchemlight,2],[_bchemlight,2],[_wflare,2],[_mapTools,1]]] call _addtoVest;
        ["laserdesignator"] call _addOptics;
        [_commonRIFLE, _countRIFLELOW] call _addWeaponKit;
        [_commonPISTOL, _countPISTOL] call _addWeaponKit;
        ["primary", _commonSUPPRESSOR] call _attachToWeapon;
        ["primary", _commonRCO] call _attachToWeapon;
        ["secondary", _commonPISTOLSUPPRESSOR] call _attachToWeapon;
        ["LR"] call _addRadio;
        ["BP"] call _addRadio;
    };

    case (_isRTO): {
        [_commonHEAD, _commonUNIFORM, _commonVEST, "empty"] call _useUniform;
        [[_unit,[_wsmoke,2], [_grenade,_countGRENADES],[_mapTools,1]]] call _addtoVest;
        [_commonRIFLE, _countRIFLE] call _addWeaponKit;
        ["laserdesignator"] call _addOptics;
        ["BP"] call _addRadio;
    };

    case (_isRifleman): {
        [_commonHEAD, _commonUNIFORM, _commonVEST, "empty"] call _useUniform;
        [[_unit,[_wsmoke,2],[_grenade,_countGRENADES]]] call _addtoVest;
        [_commonRIFLE, _countRIFLE] call _addWeaponKit;
    };

    case (_isDemo): {
        [_commonHEAD, _commonUNIFORM, _commonVEST, _bigBACKPACK] call _useUniform;
        [[_unit, [_clacker,1],[_mineDetector,1],[_defusalKit,1]]] call _addtoUniform;
        [[_unit,[_apMINE,2],[_apBoundingMINE,2]]] call _addtoVest;
        [[_unit,[_C4,3],[_satchelCharge,1],[_deadManSwitch,1]]] call _addtoBackpack;
        [_commonRIFLE, _countRIFLELOW] call _addWeaponKit;
    };

    case (_isRiflemanAT): {
        [_commonHEAD, _commonUNIFORM, _commonVEST, _bigBACKPACK] call _useUniform;
        [[_unit,[_wsmoke,2], [_rsmoke,2]]] call _addtoVest;
        [_commonRIFLE, _countRIFLELOW] call _addWeaponKit;
        [_specAT] call _addWeapon;
        [[_unit, [_specAT select 1, _countAT] ]] call _addToBackpack;
    };

    case (_isMarksman): {
        [_commonHEAD, _marksmanUNIFORM, _marksmanVEST, "empty"] call _useUniform;
        [[_unit,[_wsmoke,2], [_rsmoke,2]]] call _addtoVest;
        [_commonMARKSMAN, _countRIFLE] call _addWeaponKit;
        ["primary", _commonRCO] call _attachToWeapon;
    };

    case (_isAutorifleman): {
        [_commonHEAD, _mgUNIFORM, _mgVEST, _commonBACKPACK] call _useUniform;
        [[_unit,[_wsmoke,2],[_spareBarrel,1]]] call _addtoVest;
        [_commonMG, _countMG] call _addWeaponKit;
    };

    case (_isGrenadier): {
        [_commonHEAD, _commonUNIFORM, _grenadierVEST, _commonBACKPACK] call _useUniform;
        [[_unit,[_wsmoke,2],[_rsmoke,2]]] call _addtoVest;
        [[_unit,[_commonRIFLEGL select 2, _count40mm]]] call _addtoBackpack;
        [_commonRIFLEGL, _countRIFLELOW] call _addWeaponKit;
    };

    case (_isLifeSaver): {
        [_medicHEAD, _medicUNIFORM, _medicVEST, _commonBACKPACK] call _useUniform;
        [[_unit,[_wsmoke,2], [_gsmoke,3]]] call _addtoVest;
        _suppliesMEDIC call _addtoBackpack;
        [_commonRIFLE, _countRIFLELOW] call _addWeaponKit;
        _defaultInsignia = "MedB";
    };

    case (_isMMG): {
        [_commonHEAD, _commonUNIFORM, _commonVEST, _HMG] call _useUniform;
        [[_unit,[_wsmoke,2]]] call _addtoVest;
        [_commonRIFLE, _countRIFLE] call _addWeaponKit;
    };

    case (_isMMGTripod): {
        [_commonHEAD, _commonUNIFORM, _commonVEST, _tripod] call _useUniform;
        [[_unit,[_wsmoke,2]]] call _addtoVest;
        [_commonRIFLE, _countRIFLE] call _addWeaponKit;
    };

    case (_isRecon): {
        [_reconHEAD, _reconUNIFORM, _reconVEST, "empty"] call _useUniform;
        ["binoc"] call _addOptics;
        [[_unit,[_wsmoke,2],[_rsmoke,2],[_gsmoke,2],[_rchemlight,2],[_bchemlight,2],[_wflare,2],[_mapTools,1]]] call _addtoVest;
        [_commonRIFLE, _countRIFLE] call _addWeaponKit;
        ["primary", _commonSUPPRESSOR] call _attachToWeapon;
    };

    case (_isReconMedic): {
        [_medicHEAD, _reconUNIFORM, _reconVEST, _commonBACKPACK] call _useUniform;
        ["binoc"] call _addOptics;
        [[_unit,[_wsmoke,2],[_rsmoke,2],[_gsmoke,2],[_mapTools,1]]] call _addtoVest;
        _suppliesMEDIC call _addtoBackpack;
        [_commonRIFLE, _countRIFLE] call _addWeaponKit;
        ["primary", _commonSUPPRESSOR] call _attachToWeapon;
        _defaultInsignia = "MedB";
    };

    case (_isReconDemo): {
        [_reconHEAD, _reconUNIFORM, _reconVEST, _bigBACKPACK] call _useUniform;
        ["binoc"] call _addOptics;
        [[_unit, [_clacker,1],[_mineDetector,1],[_defusalKit,1]]] call _addtoUniform;
        [[_unit,[_wsmoke,2],[_rsmoke,2],[_gsmoke,2],[_mapTools,1]]] call _addtoVest;
        [[_unit,[_C4,3],[_satchelCharge,1],[_deadManSwitch,1]]] call _addtoBackpack;
        [_commonRIFLE, _countRIFLELOW] call _addWeaponKit;
        ["primary", _commonSUPPRESSOR] call _attachToWeapon;
    };

    case (_isPilot): {
        [_pilotHEAD, _pilotUNIFORM, "empty", _parachute] call _useUniform;
        [[_unit,[_wsmoke,2],[_rsmoke,2],[_mapTools,1]]] call _addtoVest;
        [_commonPISTOL, _countPISTOL] call _addWeaponKit;
    };

    case (_isHelicopterCrew): {
        [_helicrewHEAD, _helicrewUNIFORM, "empty", _parachute] call _useUniform;
        [[_unit,[_wsmoke,2],[_rsmoke,2]]] call _addtoVest;
        [_commonSMG, _countRIFLELOW] call _addWeaponKit;
    };

    case (_isHelicopterPilot): {
        [_helipilotHEAD, _helicrewUNIFORM, "empty", _parachute] call _useUniform;
        [[_unit,[_wsmoke,2],[_rsmoke,2]]] call _addtoVest;
        [_commonSMG, _countRIFLELOW] call _addWeaponKit;
    };

    case (_isCrewman): {
        [_crewmanHEAD, _crewUNIFORM, "empty", "empty"] call _useUniform;
        [[_unit,[_wsmoke,2]]] call _addtoVest;
        [_commonSMG, _countRIFLELOW] call _addWeaponKit;
        if (_isLeader) then { ["BP"] call _addRadio };
    };

    case (_isSniper): {
        [_sniperHEAD, _sniperUNIFORM, _commonVEST, "empty"] call _useUniform;
        [[_unit,[_wsmoke,2],[_mapTools,1],[_kestrel,1]]] call _addtoVest;
        [_commonSNIPER, _countSNIPER] call _addWeaponKit;
        ["primary", _commonMAGNIFIED] call _attachToWeapon;
        if (_isLeader) then { ["BP"] call _addRadio };
    };

    case (_isSpotter): {
        [_sniperHEAD, _sniperUNIFORM, _commonVEST, _commonBACKPACK] call _useUniform;
        [[_unit,[_wsmoke,2],[_rsmoke,2],[_gsmoke,2],[_mapTools,1],[_kestrel,1]]] call _addtoVest;
        [[_unit,[_commonSNIPER select 1, (_countSNIPER*2)]]] call _addtoBackpack;
        [_commonRIFLE, _countRIFLELOW] call _addWeaponKit;
        ["laserdesignator"] call _addOptics;
    };

    default {
        [_commonHEAD, _commonUNIFORM, _commonVEST, "empty"] call _useUniform;
        [[_unit,[_wsmoke,2],[_grenade,3]]] call _addtoVest;
        [_commonRIFLE, 5] call _addWeaponKit;
    };
};

// ADDS ESSENTIALS =============================================================

_suppliesNORMAL call _addtoUniform;

["ItemMap", "ItemCompass", "ItemWatch"] call _linkItem;

["SR"] call _addRadio;

if ((mission_AGM_enabled)||(mission_ACE3_enabled)) then { [[_unit, [_earBuds,1]]] call _addtoUniform };
