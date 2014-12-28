_unit setFace "WhiteHead_09";
_unit setSpeaker "Male01ENGB";
[_unit,"PATCH_UK_RM_42COM_JCO"] call bis_fnc_setUnitInsignia;
// =============================================================================
switch (true) do {
// =============================================================================    
    
    case (_isOfficer): {
        _unit addWeapon "Binocular";
        _unit setFace "WhiteHead_06";    
        comment "Add containers";
        _unit forceAddUniform "MNP_CombatUniform_Ireland";
        for "_i" from 1 to 4 do {_unit addItemToUniform "AGM_Bandage";};
        _unit addItemToUniform "AGM_EarBuds";
        _unit addVest "MNP_Vest_Ireland_B";
        for "_i" from 1 to 7 do {_unit addItemToVest "hlc_20rnd_762x51_b_G3";};
        for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
        _unit addHeadgear "H_Beret_blk";   
        
        comment "Add weapons";
        _unit addWeapon "hlc_rifle_g3sg1";         
    };
    
    case (_isSquadLeader): {
        _unit addWeapon "Binocular";
        _unit setFace "WhiteHead_06";    
        comment "Add containers";
        _unit forceAddUniform "MNP_CombatUniform_Ireland";
        for "_i" from 1 to 4 do {_unit addItemToUniform "AGM_Bandage";};
        _unit addItemToUniform "AGM_EarBuds";
        _unit addVest "MNP_Vest_Ireland_B";
        for "_i" from 1 to 7 do {_unit addItemToVest "hlc_20rnd_762x51_b_G3";};
        for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
        _unit addHeadgear "H_Beret_blk"; 
        
        comment "Add weapons";
        _unit addWeapon "hlc_rifle_g3sg1";         
    };
    
    case (_isTeamLeader): {
        _unit addWeapon "Binocular";
        _unit setFace "WhiteHead_06";    
        comment "Add containers";
        _unit forceAddUniform "MNP_CombatUniform_Ireland";
        for "_i" from 1 to 4 do {_unit addItemToUniform "AGM_Bandage";};
        _unit addItemToUniform "AGM_EarBuds";
        _unit addVest "MNP_Vest_Ireland_B";
        for "_i" from 1 to 7 do {_unit addItemToVest "hlc_20rnd_762x51_b_G3";};
        for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
        _unit addHeadgear "H_Beret_blk";
        
        comment "Add weapons";
        _unit addWeapon "hlc_rifle_g3sg1";         
    };
    default {
        comment "Add containers";
        _unit forceAddUniform "MNP_CombatUniform_Ireland";
        for "_i" from 1 to 4 do {_unit addItemToUniform "AGM_Bandage";};
        _unit addVest "MNP_Vest_Ireland_B";
        for "_i" from 1 to 7 do {_unit addItemToVest "hlc_20rnd_762x51_b_G3";};
        for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
        _unit addHeadgear "R3F_casque_spectra_bleu";

        comment "Add weapons";
        _unit addWeapon "hlc_rifle_g3sg1"; 
    };
};

// ADDS ESSENTIALS =============================================================

_unit addWeapon "ItemMap";
_unit addWeapon "ItemCompass";
_unit addWeapon "ItemWatch";
_unit addWeapon "ItemRadio";
_unit addItem "AGM_EarBuds";