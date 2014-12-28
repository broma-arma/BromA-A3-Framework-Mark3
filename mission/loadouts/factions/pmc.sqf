// =============================================================================
switch (true) do {
// =============================================================================    
    
    case (_isOfficer): {
        _unit forceAddUniform "MNP_CombatUniform_Militia_C";
        for "_i" from 1 to 2 do {_unit addItemToUniform "RH_17Rnd_9x19_g17";};
        _unit addVest "V_HarnessO_brn";
        for "_i" from 1 to 4 do {_unit addItemToVest "HandGrenade";};
        for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
        for "_i" from 1 to 5 do {_unit addItemToVest "hlc_20rnd_762x51_b_G3";};
        _unit addBackpack "tf_anprc155_coyote";
        _unit addHeadgear "H_Beret_blk";

        _unit addWeapon "hlc_rifle_g3ka4";
        _unit addPrimaryWeaponItem "optic_Arco";
        _unit addWeapon "RH_g17";
        _unit linkItem "tf_anprc148jem";
    };
    
    case (_isSquadLeader): {
        _unit forceAddUniform "MNP_CombatUniform_Militia_C";
        for "_i" from 1 to 2 do {_unit addItemToUniform "RH_17Rnd_9x19_g17";};
        _unit addVest "V_HarnessO_brn";
        for "_i" from 1 to 4 do {_unit addItemToVest "HandGrenade";};
        for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
        for "_i" from 1 to 5 do {_unit addItemToVest "hlc_20rnd_762x51_b_G3";};
        _unit addBackpack "tf_anprc155_coyote";
        _unit addHeadgear "H_Beret_blk";

        _unit addWeapon "hlc_rifle_g3ka4";
        _unit addPrimaryWeaponItem "optic_Arco";
        _unit addWeapon "RH_g17";
        _unit linkItem "tf_anprc148jem";
    };
    
    case (_isTeamLeader): {
        _unit forceAddUniform "MNP_CombatUniform_Militia_C";
        for "_i" from 1 to 2 do {_unit addItemToUniform "RH_17Rnd_9x19_g17";};
        _unit addVest "V_HarnessO_brn";
        for "_i" from 1 to 4 do {_unit addItemToVest "HandGrenade";};
        for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
        for "_i" from 1 to 10 do {_unit addItemToVest "hlc_20rnd_762x51_b_G3";};
        _unit addHeadgear "H_Cap_blk";

        _unit addWeapon "hlc_rifle_g3ka4";
        _unit addPrimaryWeaponItem "optic_Arco";
        _unit addWeapon "RH_g17";
        _unit linkItem "tf_anprc148jem";
    };
    
    case (_isRifleman): {
        _unit forceAddUniform "MNP_CombatUniform_Militia_DB";
        for "_i" from 1 to 4 do {_unit addItemToUniform "RH_17Rnd_9x19_g17";};
        _unit addVest "V_HarnessO_brn";
        for "_i" from 1 to 4 do {_unit addItemToVest "HandGrenade";};
        for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
        for "_i" from 1 to 13 do {_unit addItemToVest "hlc_20rnd_762x51_b_G3";};
        _unit addHeadgear "R3F_Bonnet";

        _unit addItemToVest "AT4_HEAT";
        _unit addWeapon "launch_AT4_F";        
        _unit addWeapon "hlc_rifle_g3ka4";
        _unit addPrimaryWeaponItem "FHQ_optic_MicroCCO_low";
        _unit addWeapon "RH_g17";
    };
    
    case (_isRiflemanAT): {
        _unit forceAddUniform "MNP_CombatUniform_Militia_DB";
        for "_i" from 1 to 4 do {_unit addItemToUniform "RH_17Rnd_9x19_g17";};
        _unit addVest "V_HarnessO_brn";
        for "_i" from 1 to 4 do {_unit addItemToVest "HandGrenade";};
        for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
        for "_i" from 1 to 5 do {_unit addItemToVest "hlc_20rnd_762x51_b_G3";};
        _unit addBackpack "B_AssaultPack_cbr";
        for "_i" from 1 to 4 do {_unit addItemToBackpack "RPG32_HE_F";};
        _unit addHeadgear "R3F_Bonnet";

        comment "Add weapons";
        _unit addWeapon "hlc_rifle_g3ka4";
        _unit addPrimaryWeaponItem "FHQ_optic_MicroCCO_low";
        _unit addWeapon "launch_RPG32_F";
        _unit addWeapon "RH_g17";    
    };    
    
    case (_isMarksman): {
        _unit forceAddUniform "MNP_CombatUniform_Militia_DA";
        for "_i" from 1 to 2 do {_unit addItemToUniform "RH_17Rnd_9x19_g17";};
        _unit addVest "V_HarnessO_brn";
        for "_i" from 1 to 4 do {_unit addItemToVest "HandGrenade";};
        for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
        for "_i" from 1 to 13 do {_unit addItemToVest "hlc_20rnd_762x51_b_G3";};
        _unit addHeadgear "H_Booniehat_tan";

        _unit addWeapon "hlc_rifle_g3ka4";
        _unit addPrimaryWeaponItem "FHQ_optic_ACOG";
        _unit addWeapon "RH_g17";   
    };  
    
    case (_isGrenadier): {
        _unit forceAddUniform "MNP_CombatUniform_Militia_F";
        for "_i" from 1 to 2 do {_unit addItemToUniform "RH_17Rnd_9x19_g17";};
        _unit addVest "V_HarnessO_brn";
        for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
        for "_i" from 1 to 6 do {_unit addItemToVest "hlc_20rnd_762x51_b_G3";};
        for "_i" from 1 to 15 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
        for "_i" from 1 to 2 do {_unit addItemToVest "1Rnd_Smoke_Grenade_shell";};
        for "_i" from 1 to 2 do {_unit addItemToVest "1Rnd_SmokeRed_Grenade_shell";};
        for "_i" from 1 to 2 do {_unit addItemToVest "1Rnd_SmokeGreen_Grenade_shell";};
        _unit addHeadgear "R3F_Bonnet";

        _unit addWeapon "HLC_Rifle_g3ka4_GL";
        _unit addPrimaryWeaponItem "FHQ_optic_MicroCCO_low";
        _unit addWeapon "RH_g17";
    };    
    
    case (_isAutorifleman): {
        _unit forceAddUniform "MNP_CombatUniform_Militia_DE";
        _unit addVest "V_HarnessO_brn";
        for "_i" from 1 to 4 do {_unit addItemToVest "200Rnd_65x39_cased_Box";};
        _unit addHeadgear "H_Booniehat_tan";

        comment "Add weapons";
        _unit addWeapon "LMG_Mk200_F";
        _unit addPrimaryWeaponItem "optic_Holosight";
    };
    
    case (_isLifeSaver): {
        _unit forceAddUniform "MNP_CombatUniform_Militia_DB";
        for "_i" from 1 to 5 do {_unit addItemToUniform "hlc_20rnd_762x51_b_G3";};
        _unit addVest "V_HarnessO_brn";
        _unit addBackpack "B_AssaultPack_blk";
        for "_i" from 1 to 20 do {_unit addItemToBackpack "AGM_Bandage";};
        for "_i" from 1 to 10 do {_unit addItemToBackpack "AGM_Morphine";};
        for "_i" from 1 to 10 do {_unit addItemToBackpack "AGM_Epipen";};
        for "_i" from 1 to 3 do {_unit addItemToBackpack "AGM_Bloodbag";};
        for "_i" from 1 to 4 do {_unit addItemToBackpack "SmokeShellGreen";};
        _unit addHeadgear "H_Bandanna_sand";

        _unit addWeapon "hlc_rifle_g3ka4";    
    };
    
    default {
        _unit forceAddUniform "MNP_CombatUniform_Militia_DB";
        for "_i" from 1 to 4 do {_unit addItemToUniform "RH_17Rnd_9x19_g17";};
        _unit addVest "V_HarnessO_brn";
        for "_i" from 1 to 4 do {_unit addItemToVest "HandGrenade";};
        for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
        for "_i" from 1 to 13 do {_unit addItemToVest "hlc_20rnd_762x51_b_G3";};
        _unit addHeadgear "R3F_Bonnet";

        _unit addWeapon "hlc_rifle_g3ka4";
        _unit addPrimaryWeaponItem "FHQ_optic_MicroCCO_low";
        _unit addWeapon "RH_g17"; 
    };
};

// ADDS ESSENTIALS =============================================================

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "tf_anprc152";
_unit addItem "AGM_EarBuds";

_unit setSpeaker "Male01ENG";
[_unit,"PATCH_MORALE_WORLD_COMPROMISE"] call bis_fnc_setUnitInsignia;