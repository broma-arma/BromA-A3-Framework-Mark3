private["_unit","_type","_cond","_done"];

_faction = _this select 0;
_unit = _this select 1;
_type = "";

_done = _unit getVariable ["done",false];

if (_done) exitWith {};

if ((!isPlayer _unit)&&(!isServer)) exitWith {};

// RESETS ITEMS ================================================================


removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

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
_isLifeSaver = (_type == "medic")||(_type == "Combat Life Saver");
_isGrenadier = (_type == "grenadier")||(_type == "Grenadier");

// ASSIGN LOADOUTS BASED ON FACTION ============================================

switch (toUpper(_faction)) do {
    
    case "BLUFOR": {
        _weapon = (weapons player) select 0;
        _weapon = (_weapon call BIS_fnc_weaponComponents) select 0;
        removeAllWeapons _unit;
        player addWeapon _weapon;
    };
    
    case "REDFOR": {
        
    };
    
    case "INDFOR": {
        
    };

    case "default": {        
        
    };     
    
};

_unit setVariable ["done",true,true];