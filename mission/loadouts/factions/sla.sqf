_uniforms = [
    "MNP_CombatUniform_NPA_Alt_B"
];

_myUniform = _uniforms call BIS_fnc_selectRandom;

_unit forceAddUniform _myUniform;
_headgear = "MNP_Helmet_SOVC_RU";

// =============================================================================
switch (true) do {
// =============================================================================    
    
    case (_isOfficer): {
        _unit addVest "rhs_6b23_ML_6sh92_radio";
        for "_i" from 1 to 8 do {_unit addItemToVest "hlc_30Rnd_545x39_B_AK";};
        
        _unit addWeapon "rhs_weap_ak74m_desert";
        _unit addPrimaryWeaponItem "HLC_Optic_PSO1";
        _headgear = "rhs_fieldcap_digi";
    };
    
    case (_isSquadLeader): {
        _unit addVest "rhs_6b23_ML_6sh92_radio";
        for "_i" from 1 to 8 do {_unit addItemToVest "hlc_30Rnd_545x39_B_AK";};
       
        _unit addWeapon "rhs_weap_ak74m_desert";
        _unit addPrimaryWeaponItem "HLC_Optic_PSO1";         
        _headgear = "rhs_fieldcap_digi";
    };
    
    case (_isTeamLeader): {   
        _unit addVest "rhs_6b23_ML_6sh92_vog";
        for "_i" from 1 to 8 do {_unit addItemToVest "hlc_30Rnd_545x39_B_AK";};
        _unit addWeapon "rhs_weap_ak74m_desert";       
    };
    
    case (_isRifleman): {
        _unit addVest "rhs_6b23_ML_rifleman";
        for "_i" from 1 to 8 do {_unit addItemToVest "hlc_30Rnd_545x39_B_AK";};
        _unit addWeapon "rhs_weap_ak74m_desert";
    };   
    
    case (_isAutorifleman): {
        _unit addVest "rhs_6b23_ML_rifleman";
        _unit addBackpack "B_AssaultPack_cbr";
        for "_i" from 1 to 3 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR";};
        _unit addWeapon "rhs_weap_pkp";
    };
    
    case (_isLifeSaver): {
        _unit addVest "rhs_6b23_ML_medic";
        _unit addWeapon "rhs_weap_ak74m_desert";
        for "_i" from 1 to 4 do {_unit addItemToVest "hlc_30Rnd_545x39_B_AK";};        
            
        _unit addBackpack "B_AssaultPack_blk";
        for "_i" from 1 to 5 do {_unit addItemToBackpack "AGM_Bandage";};
        for "_i" from 1 to 2 do {_unit addItemToBackpack "AGM_Morphine";};
        for "_i" from 1 to 2 do {_unit addItemToBackpack "AGM_Epipen";};
        for "_i" from 1 to 1 do {_unit addItemToBackpack "AGM_Bloodbag";};
        for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShellGreen";};      
    };
    
    default {
        _unit addVest "rhs_6b23_ML_rifleman";
        for "_i" from 1 to 8 do {_unit addItemToVest "hlc_30Rnd_545x39_B_AK";};
        _unit addWeapon "rhs_weap_ak74m_desert"; 
    };
};

for "_i" from 1 to 3 do {_unit addItemToVest "AGM_Bandage";};
for "_i" from 1 to 1 do {_unit addItemToVest "AGM_Morphine";};
for "_i" from 1 to 1 do {_unit addItemToVest "AGM_Epipen";};

// ADDS ESSENTIALS =============================================================

_unit addHeadgear _headgear;
_unit addWeapon "ItemMap";
_unit addWeapon "ItemCompass";
_unit addWeapon "ItemWatch";