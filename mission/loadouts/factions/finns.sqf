
// INFO ========================================================================
/*
    Tasked with the defence of Finland's national borders and sovereign interests, the Finnish Armed Forces
	are a highly-mobilized military force with large combined-arms capabilities.
*/

_defaultSide = WEST;
_defaultVoice = [_voiceRUSSIAN];
_defaultFace = [_faceWHITE];
_defaultInsignia = "";

// WEAPONS =====================================================================

_commonRIFLE = _G3KA4;
_commonRIFLEGL = _G3KA4GL;
_commonPISTOL = _G17;
_commonMG = _Minimi765;
_commonMARKSMAN = _G3KA4;
_commonSNIPER = _SVDS;
_commonAT = _AT4;
_specAT = _MAAWS;
_commonSMG = _Mk20C;
_commonRCO = "optic_MRCO";
_commonCCO = _EOT;
_commonMAGNIFIED = "rhs_acc_pso1m2";
_commonSUPPRESSOR = "muzzle_snds_B";
_commonPISTOLSUPPRESSOR = "RH_gemtech9";
_NVG = _NVGEN4;

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


_uniformsLIST = [
    "MNP_CombatUniform_Fin_A",
    "MNP_CombatUniform_Fin_B"
];

_vestsLIST = [
    "MNP_Vest_FIN_1",
    "MNP_Vest_FIN_2"
];


_randomUNIFORM = _uniformsLIST call BIS_fnc_selectRandom;
_randomVEST = _vestsLIST call BIS_fnc_selectRandom;

_commonHEAD = "MNP_Helmet_FIN_T";
_leaderHEAD = _commonHEAD;
_officerHEAD = "H_MilCap_dgtl";
_medicHEAD = "H_Bandanna_cbr";
_crewmanHEAD = "rhsusf_cvc_ess";
_pilotHEAD = "rhsusf_hgu56p";
_helicrewHEAD = "rhsusf_hgu56p_mask";
_helipilotHEAD = "rhsusf_hgu56p";
_sniperHEAD = "MNP_Boonie_FIN";
_demoHEAD = _commonHEAD;
_reconHEAD = "MNP_Boonie_FIN";

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

_commonBACKPACK = "MNP_B_WD_FP";
_bigBACKPACK = "MNP_B_WD_CA";

_HMG = "RHS_M2_Gun_Bag";
_tripod = "RHS_M2_Tripod_Bag";

// =============================================================================
if (!_isMan) exitWith {};
switch (true) do {
// =============================================================================

    case (_isOfficer): {
        [_officerHEAD, _officerUNIFORM, _officerVEST, "empty"] call _useUniform;
        [[_unit,[_wsmoke,2],[_rsmoke,2],[_mapTools,1]]] call _addtoVest;
        ["ItemGPS"] call _linkItem;
        [_commonRIFLE, _countRIFLE] call _addWeaponKit;
        [_commonPISTOL, _countPISTOL] call _addWeaponKit;
        ["laserdesignator"] call _addOptics;
        ["LR"] call _addRadio;
        ["BP"] call _addRadio;
    };

    case (_isSquadLeader): {
        [_leaderHEAD, _commonUNIFORM, _slVEST, "empty"] call _useUniform;
        [[_unit,[_wsmoke,2],[_rsmoke,2],[_mapTools,1]]] call _addtoVest;
        ["ItemGPS"] call _linkItem;
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
        ["ItemGPS"] call _linkItem;
        ["laserdesignator"] call _addOptics;
        [_commonRIFLE, _countRIFLELOW] call _addWeaponKit;
        [_commonPISTOL, _countPISTOL] call _addWeaponKit;
        ["primary", _commonSUPPRESSOR] call _attachToWeapon;
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

["ItemMap", "ItemCompass", "ItemWatch", _NVG] call _linkItem;

["SR"] call _addRadio;

if ((mission_AGM_enabled)||(mission_ACE3_enabled)) then { [[_unit, [_earBuds,1]]] call _addtoUniform };
