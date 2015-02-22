
// INFO ========================================================================

_defaultSide = EAST;
_defaultVoice = [_voiceFARSI];
_defaultFace = [_facePERSIAN];
_defaultInsignia = "none";

// WEAPONS =====================================================================

_commonRIFLE = _AKM;
_commonRIFLEGL = _AKMGL;
_commonPISTOL = _Makarov;
_commonMG = _RPK;
_commonMARKSMAN = _SVDCAMO;
_commonAT = _RPG26;
_specAT = _RPG26;
_commonSMG = _AKS74U;
_commonRCO = "HLC_Optic_PSO1";
_commonCCO = "HLC_Optic_PSO1";
_commonMAGNIFIED = "HLC_Optic_PSO1";

// UNIFORMS ====================================================================

_uniforms = [
    "U_CAF_AG_ME_ROBES_Mil_01",
    "U_CAF_AG_ME_ROBES_mil_01a",
    "U_CAF_AG_ME_ROBES_01b",
    "U_CAF_AG_ME_ROBES_01c",
    "U_CAF_AG_ME_ROBES_01d",
    "U_CAF_AG_ME_ROBES_01c",
    "U_CAF_AG_ME_ROBES_02",
    "U_CAF_AG_ME_ROBES_02a",
    "U_CAF_AG_ME_ROBES_02b",
    "U_CAF_AG_ME_ROBES_02c",
    "U_CAF_AG_ME_ROBES_03",
    "U_CAF_AG_ME_ROBES_03a",
    "U_CAF_AG_ME_ROBES_03b",
    "U_CAF_AG_ME_ROBES_03c",
    "U_CAF_AG_ME_ROBES_04",
    "U_CAF_AG_ME_ROBES_04a",
    "U_CAF_AG_ME_ROBES_04b",
    "U_CAF_AG_ME_ROBES_04c",
    "U_CAF_AG_ME_ROBES_04d"
];

_vests = [
    "V_TacVest_blk",
    "V_TacVest_brn",
    "V_TacVest_camo",
    "V_TacVest_khk",
    "V_TacVest_oli"
];

_randomUNIFORM = _uniforms call BIS_fnc_selectRandom;
_randomVEST = _vests call BIS_fnc_selectRandom;

_commonHEAD = "H_caf_ag_turban";
_leaderHEAD = "H_caf_ag_wrap";
_officerHEAD = "H_caf_ag_wrap";
_medicHEAD = "H_caf_ag_paktol";

_commonUNIFORM = _randomUNIFORM;
_officerUNIFORM = _randomUNIFORM;

_commonVEST = _randomVEST;
_officerVEST = _randomVEST;
_ftlVEST = _randomVEST;
_slVEST = _randomVEST;
_mgVEST = _randomVEST;
_grenadierVEST = _randomVEST;
_medicVEST = _randomVEST;

_commonBACKPACK = "B_AssaultPack_blk";

// =============================================================================
if (!_isMan) exitWith {};
switch (true) do {
// =============================================================================    
    
    case (_isOfficer): {   
        [_officerHEAD, _officerUNIFORM, _officerVEST, "empty"] call _useUniform;
        [[_unit,[_wsmoke,2]]] call _addtoVest;
        [_commonRIFLE, 5] call _addWeaponKit;
        [_commonPISTOL, 2] call _addWeaponKit;
        ["binoc"] call _addOptics;
        ["LR"] call _addRadio;
        ["BP"] call _addRadio;
    };
    
    case (_isSquadLeader): {
        [_leaderHEAD, _commonUNIFORM, _slVEST, "empty"] call _useUniform;
        [[_unit,[_wsmoke,2],[_rsmoke,2]]] call _addtoVest;
        [_commonRIFLE, 5] call _addWeaponKit;
        [_commonPISTOL, 2] call _addWeaponKit;
        ["primary", _commonRCO] call _attachToWeapon;
        ["binoc"] call _addOptics;
        ["LR"] call _addRadio;
        ["BP"] call _addRadio;
    };
    
    case (_isTeamLeader): {
        [_leaderHEAD, _commonUNIFORM, _ftlVEST, "empty"] call _useUniform;
        [[_unit,[_wsmoke,2],[_rsmoke,2]]] call _addtoVest;
        [_commonRIFLE, 5] call _addWeaponKit;
        [_commonPISTOL, 2] call _addWeaponKit;
        ["binoc"] call _addOptics;
        ["LR"] call _addRadio;
    };
    
    case (_isRifleman): {
        [_commonHEAD, _commonUNIFORM, _commonVEST, "empty"] call _useUniform;
        [[_unit,[_wsmoke,2], [_grenade,3]]] call _addtoVest;
        [_commonRIFLE, 5] call _addWeaponKit;
    };
    
    case (_isRiflemanAT): {
        [_commonHEAD, _commonUNIFORM, _commonVEST, _commonBACKPACK] call _useUniform;
        [[_unit,[_wsmoke,2], [_rsmoke,2]]] call _addtoVest;
        [_commonRIFLE, 3] call _addWeaponKit;
        [_specAT] call _addWeapon;
        [[_unit, [_specAT select 1,3] ]] call _addToBackpack;
    };
    
    case (_isMarksman): {
        [_commonHEAD, _commonUNIFORM, _commonVEST, "empty"] call _useUniform;
        [[_unit,[_wsmoke,2], [_rsmoke,2]]] call _addtoVest;
        [_commonRIFLE, 5] call _addWeaponKit;
        ["primary", _commonRCO] call _attachToWeapon;
    };    
    
    case (_isAutorifleman): {
        [_commonHEAD, _commonUNIFORM, _mgVEST, _commonBACKPACK] call _useUniform;
        [[_unit,[_wsmoke,2]]] call _addtoVest;
        [[_unit,[_commonMG select 1,5]]] call _addtoBackpack;
        [_commonMG,2] call _addWeaponKit;
    };
    
    case (_isGrenadier): {
        [_commonHEAD, _commonUNIFORM, _grenadierVEST, _commonBACKPACK] call _useUniform;
        [[_unit,[_wsmoke,2],[_rsmoke,2]]] call _addtoVest;
        [[_unit,[_commonRIFLEGL select 2,10]]] call _addtoBackpack;
        [_commonRIFLEGL,5] call _addWeaponKit;      
    };
    
    case (_isLifeSaver): {
        [_medicHEAD, _commonUNIFORM, _medicVEST, _commonBACKPACK] call _useUniform;
        [[_unit,[_wsmoke,2], [_gsmoke,3]]] call _addtoVest;
        [[_unit,[_bandage,15], [_morphine,10],[_epi,10]]] call _addtoBackpack;
        [_commonRIFLE, 5] call _addWeaponKit;
    };
    
    default {
        [_commonHEAD, _commonUNIFORM, _commonVEST, "empty"] call _useUniform;
        [[_unit,[_wsmoke,2],[_grenade,3]]] call _addtoVest;
        [_commonRIFLE, 5] call _addWeaponKit;
    };
};

// ADDS ESSENTIALS =============================================================

[[_unit,[_bandage, 2], [_morphine,1],[_epi, 1]]] call _addtoUniform;

["ItemMap", "ItemCompass", "ItemWatch"] call _linkItem;

["SR"] call _addRadio;

if ("agm_plugin" in usedPlugins) then {
    [[_unit, ["AGM_EarBuds",1]]] call _addtoUniform;
};