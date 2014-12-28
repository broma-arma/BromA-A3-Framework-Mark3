// =============================================================================
switch (true) do {
// =============================================================================    
    
    case (_isOfficer): {
        _unit forceAddUniform "MNP_CombatUniform_Wood_B";
        for "_i" from 1 to 3 do {_unit addItemToUniform "RH_7Rnd_45cal_m1911";};
        for "_i" from 1 to 3 do {_unit addItemToUniform "30Rnd_556x45_Stanag";};
        _unit addVest "MNP_Vest_OD_B";
        for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
        for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
        _unit addBackpack "tf_anarc164";
        _unit addHeadgear "MNP_MilCap_RO_A";

        _unit addWeapon "RH_M16a1";
        _unit addWeapon "RH_m1911";
    };
    
    case (_isSquadLeader): {
        _unit forceAddUniform "MNP_CombatUniform_Wood_B";
        for "_i" from 1 to 3 do {_unit addItemToUniform "RH_7Rnd_45cal_m1911";};
        for "_i" from 1 to 3 do {_unit addItemToUniform "30Rnd_556x45_Stanag";};
        _unit addVest "MNP_Vest_OD_B";
        for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
        for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
        _unit addBackpack "tf_anarc164";
        _unit addHeadgear "MNP_MilCap_RO_A";

        _unit addWeapon "RH_M16a1";
        _unit addWeapon "RH_m1911";     
    };
    
    case (_isTeamLeader): {
        _unit forceAddUniform "MNP_CombatUniform_Wood_B";
        for "_i" from 1 to 3 do {_unit addItemToUniform "RH_7Rnd_45cal_m1911";};
        for "_i" from 1 to 3 do {_unit addItemToUniform "30Rnd_556x45_Stanag";};
        _unit addVest "MNP_Vest_OD_B";
        for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
        for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
        _unit addBackpack "tf_anarc164";
        _unit addHeadgear "MNP_MilCap_RO_A";

        _unit addWeapon "RH_M16a1";
        _unit addWeapon "RH_m1911";
    };
    
    case (_isRifleman): {
        _unit forceAddUniform "MNP_CombatUniform_Wood_B";
        for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
        for "_i" from 1 to 3 do {_unit addItemToUniform "RH_7Rnd_45cal_m1911";};
        _unit addItemToUniform "30Rnd_556x45_Stanag";
        _unit addVest "V_BandollierB_oli";
        for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
        _unit addGoggles "G_Aviator";

        _unit addWeapon "RH_M16a1";
        _unit addWeapon "RH_m1911";
    };
    
    case (_isMarksman): {
        _unit forceAddUniform "MNP_CombatUniform_Wood_B";
        for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
        for "_i" from 1 to 3 do {_unit addItemToUniform "RH_7Rnd_45cal_m1911";};
        _unit addVest "V_BandollierB_oli";
        for "_i" from 1 to 5 do {_unit addItemToVest "hlc_20Rnd_762x51_B_M14";};
        _unit addHeadgear "MNP_Boonie_USMC";
        _unit addGoggles "G_Aviator";

        _unit addWeapon "hlc_rifle_M14";
        _unit addWeapon "RH_m1911";    
    };  
    
    case (_isGrenadier): {
        _unit forceAddUniform "MNP_CombatUniform_Wood_B";
        for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
        for "_i" from 1 to 3 do {_unit addItemToUniform "RH_7Rnd_45cal_m1911";};
        _unit addItemToUniform "30Rnd_556x45_Stanag";
        _unit addVest "V_BandollierB_oli";
        for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
        for "_i" from 1 to 5 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
        _unit addItemToVest "UGL_FlareWhite_F";
        _unit addItemToVest "UGL_FlareGreen_F";
        _unit addItemToVest "1Rnd_SmokeGreen_Grenade_shell";
        _unit addItemToVest "1Rnd_SmokeYellow_Grenade_shell";
        _unit addItemToVest "1Rnd_SmokeRed_Grenade_shell";
        _unit addGoggles "G_Aviator";

        _unit addWeapon "RH_M16A1gl";
        _unit addWeapon "RH_m1911";
    };    
    
    case (_isAutorifleman): {
        _unit forceAddUniform "MNP_CombatUniform_Wood_B";
        for "_i" from 1 to 3 do {_unit addItemToUniform "RH_7Rnd_45cal_m1911";};
        _unit addVest "V_BandollierB_oli";
        for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
        _unit addBackpack "B_AssaultPack_blk";
        for "_i" from 1 to 4 do {_unit addItemToBackpack "hlc_100Rnd_762x51_B_M60E4";};
        _unit addHeadgear "MNP_Boonie_TIG";

        _unit addWeapon "hlc_lmg_m60";
        _unit addWeapon "RH_m1911";
    };
    
    case (_isLifeSaver): {
        _unit forceAddUniform "MNP_CombatUniform_Wood_B";
        for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
        for "_i" from 1 to 3 do {_unit addItemToUniform "RH_7Rnd_45cal_m1911";};
        _unit addItemToUniform "30Rnd_556x45_Stanag";
        _unit addVest "V_BandollierB_oli";
        for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
        _unit addBackpack "B_AssaultPack_blk";
        for "_i" from 1 to 20 do {_unit addItemToBackpack "AGM_Bandage";};
        for "_i" from 1 to 10 do {_unit addItemToBackpack "AGM_Morphine";};
        for "_i" from 1 to 10 do {_unit addItemToBackpack "AGM_Epipen";};
        for "_i" from 1 to 3 do {_unit addItemToBackpack "AGM_Bloodbag";};
        for "_i" from 1 to 4 do {_unit addItemToBackpack "SmokeShellGreen";};
        _unit addHeadgear "H_Bandanna_khk";

        _unit addWeapon "RH_M16a1";
        _unit addWeapon "RH_m1911";      
    };
    
    default {
        _unit forceAddUniform "MNP_CombatUniform_Wood_B";
        for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
        for "_i" from 1 to 3 do {_unit addItemToUniform "RH_7Rnd_45cal_m1911";};
        _unit addItemToUniform "30Rnd_556x45_Stanag";
        _unit addVest "V_BandollierB_oli";
        for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
        _unit addGoggles "G_Aviator";

        _unit addWeapon "RH_M16a1";
        _unit addWeapon "RH_m1911"; 
    };
};

// ADDS ESSENTIALS =============================================================

_unit addWeapon "ItemMap";
_unit addWeapon "ItemCompass";
_unit addWeapon "ItemWatch";
_unit addItem "AGM_EarBuds";

_unit setSpeaker "Male01ENG";
[_unit,"PATCH_USA_ARMY"] call bis_fnc_setUnitInsignia;