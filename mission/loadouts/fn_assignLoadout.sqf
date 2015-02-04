private["_unit","_type","_cond","_done"];

_unit = _this select 0;
_faction = _this select 1;
_type = "";

if ((!isPlayer _unit)&&(!mission_AI_controller)) exitWith {};

// RESETS ITEMS ================================================================

removeAllItems _unit;
removeAllWeapons _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;

// DETERMINE UNIT TYPE =========================================================

if (!(isPlayer _unit)) then { _type = getText (configfile >> "CfgVehicles" >> typeOf _unit >> "displayName") } 
else { 
    if ( (count _this) > 2) then {
        _type = _this select 2;
    } else {
        _type = getText (configfile >> "CfgVehicles" >> typeOf _unit >> "displayName");
    };
};

// CLASSES =====================================================================

_isOfficer = (_type == "CO")||(_type == "Officer");
_isSquadLeader = (_type == "SL")||(_type == "Squad Leader");
_isTeamLeader = (_type == "FTL")||(_type == "Team Leader");
_isRifleman = (_type == "rifleman")||(_type == "Rifleman");
_isRiflemanAT = (_type == "at")||(_type == "Rifleman (AT)");
_isMarksman = (_type == "marksman")||(_type == "Marksman");
_isAutorifleman = (_type == "mg")||(_type == "Autorifleman");
_isMGAssistant = (_type == "mgassist")||(_type == "Ammo Bearer");
_isLifeSaver = (_type == "medic")||(_type == "Combat Life Saver");
_isGrenadier = (_type == "grenadier")||(_type == "Grenadier");
_isCrew = (_type == "crew")||(_type == "Crewman");
_isPilot = (_type == "pilot") || (_type == "Pilot");
_isJTAC = (_type == "JTAC") || (_type == "Recon JTAC");

// ASSIGN LOADOUTS BASED ON FACTION ============================================

switch (toUpper(_faction)) do {
    
    case "BLUFOR": {
        #include "factions\racs.sqf"
    };
    
    case "OPFOR": {
        #include "factions\sla.sqf"
    };
    
    case "INDFOR": {
        #include "factions\pmc.sqf"
    };

    case "default": {        
        #include "factions\default.sqf"
    };     
    
};