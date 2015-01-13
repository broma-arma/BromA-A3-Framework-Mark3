_unit forceAddUniform "MNP_CombatUniform_USMC_SD";

// =============================================================================
switch (true) do {
// =============================================================================    
    
    case (_isOfficer): {        
        for "_i" from 1 to 3 do {_unit addItemToUniform "RH_12Rnd_45cal_usp";};
        for "_i" from 1 to 2 do {_unit addItemToUniform "hlc_20rnd_762x51_b_G3";};
        _unit addVest "rhsusf_iotv_ocp";
        for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
        for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellRed";};
        for "_i" from 1 to 4 do {_unit addItemToVest "hlc_20rnd_762x51_b_G3";};
        for "_i" from 1 to 2 do {_unit addItemToVest "hlc_20rnd_762x51_T_G3";};
        _unit addHeadgear "rhsusf_patrolcap_ocp";        
        _unit addWeapon "hlc_rifle_g3sg1";
        _unit addWeapon "RH_usp";
        _unit addWeapon "AGM_Vector";
        _unit addItem "tf_anprc152";
        _unit addBackpack "tf_rt1523g_rhs";
    };
    
    case (_isSquadLeader): {
        for "_i" from 1 to 3 do {_unit addItemToUniform "RH_12Rnd_45cal_usp";};
        for "_i" from 1 to 2 do {_unit addItemToUniform "hlc_20rnd_762x51_b_G3";};
        _unit addVest "rhsusf_iotv_ocp_Squadleader";
        for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
        for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellRed";};
        for "_i" from 1 to 4 do {_unit addItemToVest "hlc_20rnd_762x51_b_G3";};
        for "_i" from 1 to 2 do {_unit addItemToVest "hlc_20rnd_762x51_T_G3";};
        _unit addHeadgear "rhsusf_ach_bare_semi_headset_ess";        
        _unit addWeapon "hlc_rifle_g3sg1";
        _unit addPrimaryWeaponItem "HLC_Optic_ZFSG1";
        _unit addWeapon "RH_usp";        
        _unit addWeapon "AGM_Vector";
        _unit addItem "tf_anprc152";
        _unit addBackpack "tf_rt1523g_rhs";
    };
    
    case (_isTeamLeader): {
        for "_i" from 1 to 3 do {_unit addItemToUniform "RH_12Rnd_45cal_usp";};
        for "_i" from 1 to 2 do {_unit addItemToUniform "hlc_20rnd_762x51_b_G3";};
        _unit addVest "rhsusf_iotv_ocp_Teamleader";
        for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
        for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellRed";};
        for "_i" from 1 to 4 do {_unit addItemToVest "hlc_20rnd_762x51_b_G3";};
        for "_i" from 1 to 2 do {_unit addItemToVest "hlc_20rnd_762x51_T_G3";};
        _unit addHeadgear "rhsusf_ach_bare_semi_headset_ess";        
        _unit addWeapon "hlc_rifle_g3sg1";        
        _unit addWeapon "RH_usp";        
        _unit addWeapon "Binocular";
        _unit addItem "tf_anprc152";
    };
    
    case (_isRifleman): {
        _unit addVest "rhsusf_iotv_ocp_Rifleman";
        for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
        for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellRed";};
        for "_i" from 1 to 4 do {_unit addItemToVest "hlc_20rnd_762x51_b_G3";};
        for "_i" from 1 to 2 do {_unit addItemToVest "hlc_20rnd_762x51_T_G3";};
        _unit addHeadgear "rhsusf_ach_bare_semi_ess";        
        _unit addWeapon "hlc_rifle_g3sg1";       
    };
    
    case (_isRiflemanAT): {
        _unit addVest "rhsusf_iotv_ocp_Rifleman";
        for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
        for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellRed";};
        for "_i" from 1 to 4 do {_unit addItemToVest "hlc_20rnd_762x51_b_G3";};
        for "_i" from 1 to 2 do {_unit addItemToVest "hlc_20rnd_762x51_T_G3";};
        _unit addHeadgear "rhsusf_ach_bare_semi_ess";        
        _unit addWeapon "hlc_rifle_g3sg1"; 
        
        _unit addMagazine "rhs_m136_mag";
        _unit addWeapon "rhs_weap_M136";
    };
    
    case (_isMarksman): {
        _unit addVest "rhsusf_iotv_ocp_Rifleman";
        for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
        for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellRed";};
        for "_i" from 1 to 4 do {_unit addItemToVest "hlc_20rnd_762x51_b_G3";};
        for "_i" from 1 to 2 do {_unit addItemToVest "hlc_20rnd_762x51_T_G3";};
        _unit addHeadgear "rhsusf_ach_bare_semi_ess";        
        _unit addWeapon "hlc_rifle_g3sg1";    
        _unit addPrimaryWeaponItem "HLC_Optic_ZFSG1";
    };    
    
    case (_isAutorifleman): {
        _unit addVest "rhsusf_iotv_ocp_SAW";
        for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
        _unit addBackpack "B_AssaultPack_rgr";
        for "_i" from 1 to 4 do {_unit addItemToBackpack "rhsusf_100Rnd_556x45_soft_pouch";};
        
        _unit addHeadgear "rhsusf_ach_bare_semi_ess";        
        _unit addWeapon "rhs_weap_m249_pip";       
    };
    
    case (_isGrenadier): {
        _unit addVest "rhsusf_iotv_ocp_Grenadier";
        for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
        for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellRed";};
        for "_i" from 1 to 4 do {_unit addItemToVest "hlc_20rnd_762x51_b_G3";};
        for "_i" from 1 to 2 do {_unit addItemToVest "hlc_20rnd_762x51_T_G3";};
        _unit addHeadgear "rhsusf_ach_bare_semi_ess";        
        _unit addWeapon "HLC_Rifle_g3ka4_GL";
        
        _unit addBackpack "B_AssaultPack_rgr";
        for "_i" from 1 to 15 do {_unit addItemToBackpack "1Rnd_HE_Grenade_shell";};
        for "_i" from 1 to 2 do {_unit addItemToBackpack "1Rnd_Smoke_Grenade_shell";};
        for "_i" from 1 to 2 do {_unit addItemToBackpack "1Rnd_SmokeRed_Grenade_shell";};
        for "_i" from 1 to 2 do {_unit addItemToBackpack "1Rnd_SmokeGreen_Grenade_shell";};        
    };
    
    case (_isLifeSaver): {
        _unit addVest "rhsusf_iotv_ocp_Medic";
        for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
        for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellRed";};
        for "_i" from 1 to 4 do {_unit addItemToVest "hlc_20rnd_762x51_b_G3";};
        for "_i" from 1 to 2 do {_unit addItemToVest "hlc_20rnd_762x51_T_G3";};
        _unit addHeadgear "H_Bandanna_cbr";        
        _unit addWeapon "hlc_rifle_g3sg1";
        
        _unit addBackpack "B_AssaultPack_rgr";
        for "_i" from 1 to 15 do {_unit addItemToBackpack "AGM_Bandage";};
        for "_i" from 1 to 10 do {_unit addItemToBackpack "AGM_Morphine";};
        for "_i" from 1 to 10 do {_unit addItemToBackpack "AGM_Epipen";};
        for "_i" from 1 to 3 do {_unit addItemToBackpack "AGM_Bloodbag";};
    };
    
    default {
        _unit addVest "rhsusf_iotv_ocp_Rifleman";
        for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
        for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellRed";};
        for "_i" from 1 to 4 do {_unit addItemToVest "hlc_20rnd_762x51_b_G3";};
        for "_i" from 1 to 2 do {_unit addItemToVest "hlc_20rnd_762x51_T_G3";};
        _unit addHeadgear "rhsusf_ach_bare_semi_ess"; 
        
        _unit addWeapon "hlc_rifle_g3sg1";
    };
};

// ADDS ESSENTIALS =============================================================

for "_i" from 1 to 3 do {_unit addItemToVest "AGM_Bandage";};
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Morphine";};
for "_i" from 1 to 2 do {_unit addItemToVest "AGM_Epipen";};

_unit setFace "WhiteHead_03";
_unit setSpeaker "Male10ENG";

_unit addWeapon "ItemMap";
_unit addWeapon "ItemCompass";
_unit addWeapon "ItemWatch";

_unit linkItem "tf_rf7800str";

_unit addItem "AGM_EarBuds";