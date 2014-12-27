_unit setFace "WhiteHead_06";
_unit setSpeaker "Male01ENGB";
[_unit,"PATCH_UK_BRITISH_ARMY"] call bis_fnc_setUnitInsignia;

// =============================================================================
switch (true) do {
// =============================================================================    

    case (_isOfficer): {        
        _unit forceAddUniform "U_B_CTRG_1";
        for "_i" from 1 to 4 do {_unit addItemToUniform "AGM_Bandage" };
        _unit addItemToUniform "AGM_EarBuds";
        _unit addVest "V_PlateCarrierL_CTRG";
        for "_i" from 1 to 12 do {_unit addItemToVest "hlc_20rnd_762x51_b_fal" };
        _unit addHeadgear "H_Beret_Colonel";

        _unit addWeapon "hlc_rifle_L1A1SLR";

        _unit setFace "WhiteHead_05";
        _unit setSpeaker "Male01ENGB";
    };
    
    case (_isSquadLeader): {
        _unit forceAddUniform "U_B_CTRG_1";
        for "_i" from 1 to 4 do {_unit addItemToUniform "AGM_Bandage";};
        _unit addItemToUniform "AGM_EarBuds";
        _unit addVest "V_PlateCarrierL_CTRG";
        for "_i" from 1 to 12 do {_unit addItemToVest "hlc_20rnd_762x51_b_fal";};
        _unit addHeadgear "H_Beret_Colonel";

        _unit addWeapon "hlc_rifle_L1A1SLR";

        _unit setFace "WhiteHead_05";
        _unit setSpeaker "Male01ENGB";
    };
    
    case (_isLifeSaver): {
        comment "Add containers";
        _unit forceAddUniform "U_B_CTRG_1";
        for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
        _unit addVest "V_PlateCarrierL_CTRG";
        for "_i" from 1 to 5 do {_unit addItemToVest "hlc_20rnd_762x51_b_fal";};
        _unit addBackpack "B_AssaultPack_blk";
        for "_i" from 1 to 20 do {_unit addItemToBackpack "AGM_Bandage";};
        for "_i" from 1 to 10 do {_unit addItemToBackpack "AGM_Morphine";};
        for "_i" from 1 to 10 do {_unit addItemToBackpack "AGM_Epipen";};
        for "_i" from 1 to 4 do {_unit addItemToBackpack "AGM_Bloodbag";};
        for "_i" from 1 to 5 do {_unit addItemToBackpack "SmokeShellGreen";};
        _unit addHeadgear "H_Bandanna_cbr";

        comment "Add weapons";
        _unit addWeapon "hlc_rifle_L1A1SLR";
        _unit setFace "WhiteHead_09";
        _unit setSpeaker "Male01ENGB";        

    };

    default {
        _unit forceAddUniform "U_B_CTRG_1";
        for "_i" from 1 to 4 do {_unit addItemToUniform "AGM_Bandage";};
        _unit addItemToUniform "AGM_EarBuds";
        for "_i" from 1 to 3 do {_unit addItemToUniform "hlc_20rnd_762x51_b_fal";};
        _unit addVest "V_PlateCarrierL_CTRG";
        for "_i" from 1 to 9 do {_unit addItemToVest "hlc_20rnd_762x51_b_fal";};
        _unit addHeadgear "MNP_Helmet_ACU";

        _unit addWeapon "hlc_rifle_L1A1SLR"; 
    };
};

// ADDS ESSENTIALS =============================================================

_unit addWeapon "ItemMap";
_unit addWeapon "ItemCompass";
_unit addWeapon "ItemWatch";
_unit addWeapon "ItemRadio";