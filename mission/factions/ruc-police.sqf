// =============================================================================
switch (true) do {
// =============================================================================    
    default {
        _unit forceAddUniform "U_Marshal";
        for "_i" from 1 to 4 do {_unit addItemToUniform "AGM_Bandage";};
        _unit addItemToUniform "AGM_EarBuds";
        _unit addVest "V_TacVest_blk_POLICE";
        for "_i" from 1 to 7 do {_unit addItemToVest "hlc_30rnd_556x45_b_HK33";};
        for "_i" from 1 to 3 do {_unit addItemToVest "RH_6Rnd_45ACP_Mag";};

        comment "Add weapons";
        _unit addWeapon "hlc_rifle_hk53";
        _unit addWeapon "RH_ttracker";

        _unit setFace "WhiteHead_21";
        _unit setSpeaker "Male01ENGB";
        [_unit,"PATCH_UK_RM_42COM_JCO"] call bis_fnc_setUnitInsignia; 
    };
};

// ADDS ESSENTIALS =============================================================

_unit addWeapon "ItemMap";
_unit addWeapon "ItemCompass";
_unit addWeapon "ItemWatch";
_unit addWeapon "ItemRadio";
_unit addItem "AGM_EarBuds";