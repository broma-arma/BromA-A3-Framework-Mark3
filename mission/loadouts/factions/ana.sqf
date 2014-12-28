_uniforms = [
    "MNP_CombatUniform_ASA_GC2",
    "MNP_CombatUniform_ASA_GC3",
    "MNP_CombatUniform_ASA_GC"
];

_vests = [
    "V_TacVest_oli"
];

_myUniform = _uniforms call BIS_fnc_selectRandom;
_myVest = _vests call BIS_fnc_selectRandom;
_headgear = "rhsusf_ach_bare_ess";

if (!_isCrew) then {
    _unit forceAddUniform _myUniform;
    _unit addVest _myVest;
};

// =============================================================================
switch (true) do {
// =============================================================================    
    
    case (_isOfficer): {
        _unit addWeapon "AGM_Vector";
        for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_556x45_Stanag";};    
        _unit addBackpack "tf_anarc164";                
        
        _unit addWeapon "RH_M16A3";
        _unit addPrimaryWeaponItem "RH_ta31rco";
    };
    
    case (_isSquadLeader): {
        _unit addWeapon "AGM_Vector";
        for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
       _unit addBackpack "tf_anarc164";
       
        _unit addWeapon "RH_M16A3";
        _unit addPrimaryWeaponItem "RH_ta31rco";
    };
    
    case (_isTeamLeader): { 
        _unit addWeapon "Binocular";
        for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
        _unit addWeapon "RH_M16A3";
        _unit addPrimaryWeaponItem "RH_compm4s"
    };
    
    case (_isRifleman): {        
        for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
        _unit addItemToVest "rhs_m136_mag";
        _unit addWeapon "rhs_weap_M136";
        _unit addWeapon "RH_M16A3";
    };
    
    case (_isGrenadier): {        
        for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
        for "_i" from 1 to 10 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
        for "_i" from 1 to 4 do {_unit addItemToVest "1Rnd_SmokeRed_Grenade_shell";};
        _unit addWeapon "RH_M16A4gl";
    };    
    
    case (_isRiflemanAT): {        
        _unit addBackpack "MNP_B_WD_CA";
        for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_fgm148_magazine_AT";};
        for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
        
        _unit addWeapon "rhs_weap_fgm148";
        _unit addWeapon "RH_M16A3";
    };
    
    case (_isMarksman): {
        _unit addWeapon "RH_Mk12mod1";
        _unit addPrimaryWeaponItem "RH_ta31rco";
        for "_i" from 1 to 8 do {_unit addItemToVest "RH_30Rnd_556x45_Mk262";};
    };    
    
    case (_isAutorifleman): {
        _unit addBackpack "B_AssaultPack_cbr";
        for "_i" from 1 to 3 do {_unit addItemToBackpack "rhsusf_100Rnd_762x51";};
        _unit addWeapon "rhs_weap_m240B";
    };
    
    case (_isMGAssistant): {
        _unit addBackpack "B_AssaultPack_cbr";
        for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
        for "_i" from 1 to 8 do {_unit addItemToBackpack "rhsusf_100Rnd_762x51";};
        _unit addWeapon "RH_M16A3";
    };
    
    case (_isCrew): {
        _unit forceAddUniform "MNP_CombatUniform_3Co_Sh";
        for "_i" from 1 to 3 do {_unit addItemToUniform "30Rnd_9x21_Mag";};
        for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
        _headgear = "rhs_tsh4_ess_bala";

        _unit addWeapon "hgun_PDW2000_F";        
    };    
    
    case (_isLifeSaver): {
        _headgear = "MNP_Boonie_ASA";
        _unit addWeapon "RH_M16A3";
        for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_556x45_Stanag";};        
            
        _unit addBackpack "B_AssaultPack_blk";
        for "_i" from 1 to 20 do {_unit addItemToBackpack "AGM_Bandage";};
        for "_i" from 1 to 10 do {_unit addItemToBackpack "AGM_Morphine";};
        for "_i" from 1 to 10 do {_unit addItemToBackpack "AGM_Epipen";};
        for "_i" from 1 to 3 do {_unit addItemToBackpack "AGM_Bloodbag";};
        for "_i" from 1 to 4 do {_unit addItemToBackpack "SmokeShellGreen";};      
    };
    
    default {
        for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
        _unit addWeapon "RH_M16A3"; 
    };
};

for "_i" from 1 to 3 do {_unit addItemToVest "AGM_Bandage";};
for "_i" from 1 to 1 do {_unit addItemToVest "AGM_Morphine";};
for "_i" from 1 to 1 do {_unit addItemToVest "AGM_Epipen";};
_unit addHeadgear _headgear;

// ADDS ESSENTIALS =============================================================

_unit addWeapon "ItemMap";
_unit addWeapon "ItemCompass";
_unit addWeapon "ItemWatch";
_unit linkItem "tf_anprc152";
_unit addItem "AGM_EarBuds";
[_unit,"PATCH_AFG_LOCAL_POLICE"] call bis_fnc_setUnitInsignia;