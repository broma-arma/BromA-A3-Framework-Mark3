_uniforms = [
    "MNP_CombatUniform_ASA_GC2",
    "MNP_CombatUniform_ASA_GC3",
    "MNP_CombatUniform_ASA_GC"
];

_vests = [
    "V_PlateCarrier1_blk"
];

_myUniform = _uniforms call BIS_fnc_selectRandom;
_myVest = _vests call BIS_fnc_selectRandom;
_headgear = "rhsusf_ach_bare_ess";

_unit forceAddUniform _myUniform;
_unit addVest _myVest;

// =============================================================================
switch (true) do {
// =============================================================================    
    
    case (_isOfficer): {
        _unit addWeapon "Binocular";
        for "_i" from 1 to 8 do {_unit addItemToVest "hlc_30Rnd_545x39_B_AK";};    
        _unit addBackpack "tf_anprc155_coyote";                
        
        _unit addWeapon "hlc_rifle_aks74";
        _unit addPrimaryWeaponItem "HLC_Optic_PSO1";        
    };
    
    case (_isSquadLeader): {
        _unit addWeapon "Binocular";
        for "_i" from 1 to 8 do {_unit addItemToVest "hlc_30Rnd_545x39_B_AK";};
       _unit addBackpack "tf_anprc155_coyote";
       
        _unit addWeapon "hlc_rifle_aks74";
        _unit addPrimaryWeaponItem "HLC_Optic_PSO1";         
    };
    
    case (_isTeamLeader): { 
        _unit addWeapon "Binocular";
        for "_i" from 1 to 8 do {_unit addItemToVest "hlc_30Rnd_545x39_B_AK";};
        _unit addWeapon "hlc_rifle_aks74";        
    };
    
    case (_isRifleman): {        
        for "_i" from 1 to 8 do {_unit addItemToVest "hlc_30Rnd_545x39_B_AK";};
        _unit addWeapon "hlc_rifle_ak74";
    };
    
    case (_isRiflemanAT): {        
        _unit addBackpack "rhs_rpg";
        for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_rpg7_PG7VL_mag";};
        for "_i" from 1 to 4 do {_unit addItemToVest "hlc_30Rnd_545x39_B_AK";};
        
        _unit addWeapon "rhs_weap_rpg7";
        _unit addWeapon "hlc_rifle_aks74";
    };
    
    case (_isMarksman): {
        _unit addWeapon "hlc_rifle_aks74";
        _unit addPrimaryWeaponItem "HLC_Optic_PSO1";  
        for "_i" from 1 to 8 do {_unit addItemToVest "hlc_30Rnd_545x39_B_AK";};
    };    
    
    case (_isAutorifleman): {

        _unit addBackpack "B_AssaultPack_cbr";
        for "_i" from 1 to 3 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR";};
        _unit addWeapon "rhs_weap_pkp";
    };
    
    case (_isLifeSaver): {
        _headgear = "MNP_Boonie_ASA";
        _unit addWeapon "hlc_rifle_aks74";
        for "_i" from 1 to 4 do {_unit addItemToVest "hlc_30Rnd_545x39_B_AK";};        
            
        _unit addBackpack "B_AssaultPack_blk";
        for "_i" from 1 to 20 do {_unit addItemToBackpack "AGM_Bandage";};
        for "_i" from 1 to 10 do {_unit addItemToBackpack "AGM_Morphine";};
        for "_i" from 1 to 10 do {_unit addItemToBackpack "AGM_Epipen";};
        for "_i" from 1 to 3 do {_unit addItemToBackpack "AGM_Bloodbag";};
        for "_i" from 1 to 4 do {_unit addItemToBackpack "SmokeShellGreen";};      
    };
    
    default {
        for "_i" from 1 to 8 do {_unit addItemToVest "hlc_30Rnd_545x39_B_AK";};
        _unit addWeapon "hlc_rifle_ak74"; 
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
_unit addWeapon "tf_fadak";
_unit addItem "AGM_EarBuds";
[_unit,"PATCH_AFG_LOCAL_POLICE"] call bis_fnc_setUnitInsignia;