// ============================================================================================
//
//	This script allows for loading of cargo into any type of vehicle that is placed in the editor.
//
//      nul = [this,"faction","ammo"] execVM "mission\loadout\init-cargo.sqf";
//
// ============================================================================================
private ["_object","_faction","_type","_factionSide","_defaultSide"];

_object = _this select 0; 
_faction = _this select 1;
_type = _this select 2;

if (typeName _type != "ARRAY") then { _type = [_type] };

waitUntil{(time > 1)};

if (isServer) then {
    
    waitUntil{!isNull _object};
    
    _initialized = _object getVariable ["unit_initialized", false];
    if (_initialized) exitWith {};        

    clearMagazineCargoGlobal _object;
    clearItemCargoGlobal _object;
    clearWeaponCargoGlobal _object;
    clearBackpackCargoGlobal _object;
    
    _unit = _object;
    private [
    "_defaultSide","_commonRIFLE","_commonRIFLEGL","_commonPISTOL","_commonMG",
    "_commonMARKSMAN","_commonSNIPER","_commonAT","_specAT","_commonSMG","_commonBACKPACK",
    "_commonRCO","_commonCCO","_commonMAGNIFIED","_NVG","_countRifleCARGO", "_countPistolCARGO",
    "_countMgCARGO", "_countSniperCARGO", "_countATCARGO", "_countGrenadesCARGO", "_count40mmCARGO",
    "_countBandageCARGO", "_countMorphineCARGO", "_countEpiCARGO", "_countBloodbagCARGO"];
    
    #include "content\loadout-functions.sqf"
    #include "content\content-list.sqf"    
    
    _aliasBLUFOR = ["blufor","west"];
    _aliasOPFOR = ["opfor","redfor","east"];
    _aliasRESISTANCE = ["independent","resistance","indfor","guerilla"];
    _aliasCIVILIAN = ["civilian","civilians","civies"];

    switch (true) do {
        case (_faction == "side_a"): { _faction = side_a_faction };
        case (_faction == "side_b"): { _faction = side_b_faction };
        case (_faction == "side_c"): { _faction = side_c_faction };
        case (_faction in _aliasBLUFOR): { _faction = [west, "FACTION"] call BRM_fnc_getSideInfo; _factionSide = west };
        case (_faction in _aliasOPFOR): { _faction = [east, "FACTION"] call BRM_fnc_getSideInfo; _factionSide = east };
        case (_faction in _aliasRESISTANCE): { _faction = [resistance, "FACTION"] call BRM_fnc_getSideInfo; _factionSide = resistance };
        default {
            switch (true) do {
                case (_faction == side_a_faction): { _factionSide = side_a_side };
                case (_faction == side_b_faction): { _factionSide = side_b_side };
                case (_faction == side_c_faction): { _factionSide = side_c_side };
                default { _factionSide = "" };
            };
        };        
    };
    
    #include "faction-list.sqf"
    
    if (typeName _factionSide == "STRING") then { _factionSide = _defaultSide };
        
    { 
        #include "cargo-list.sqf" 
    } forEach _type;
    
    _object setVariable ["unit_initialized", true, true];
};
// ============================================================================================