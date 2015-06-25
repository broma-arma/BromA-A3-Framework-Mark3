private["_unit","_type","_cond","_done","_defaultName","_doFirstName","_doLastName","_doFinalName"];

_unit = _this select 0;
_faction = _this select 1;
_type = "";

if ((!isPlayer _unit)&&(!mission_AI_controller)) exitWith {};

_unit setVariable ["BIS_enableRandomization", false];

_aliasBLUFOR = ["BLUFOR","west"];
_aliasOPFOR = ["opfor","redfor","east"];
_aliasRESISTANCE = ["independent","resistance","indfor","guerilla"];
_aliasCIVILIAN = ["civilian","civilians","civies"];

switch (true) do {
    case (_faction == "side_a"): { _faction = side_a_faction };
    case (_faction == "side_b"): { _faction = side_b_faction };
    case (_faction == "side_c"): { _faction = side_c_faction };
    case (_faction in _aliasBLUFOR): { _faction = [west, "FACTION"] call BRM_fnc_getSideInfo };
    case (_faction in _aliasOPFOR): { _faction = [east, "FACTION"] call BRM_fnc_getSideInfo };
    case (_faction in _aliasRESISTANCE): { _faction = [resistance, "FACTION"] call BRM_fnc_getSideInfo };
};

// RESETS ITEMS ================================================================

removeAllItems _unit;
removeAllWeapons _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
if !(isPlayer _unit) then { removeGoggles _unit };

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
_isMarksman = (_type == "marksman")||(_type == "Marksman")||(_type == "Sharpshooter");
_isAutorifleman = (_type == "mg")||(_type == "Autorifleman");
_isAutoriflemanAsst = (_type == "mmgasst")||(_type == "Asst. Autorifleman");
_isLifeSaver = (_type == "medic")||(_type == "Combat Life Saver");
_isGrenadier = (_type == "grenadier")||(_type == "Grenadier");
_isHelicopterPilot = (_type == "helipilot")||(_type == "Helicopter Pilot");
_isHelicopterCrew = (_type == "helicrew")||(_type == "Helicopter Crew");
_isEngineer = (_type == "engineer")||(_type == "Engineer")||(_type == "Repair Specialist");
_isCrewman = (_type == "crew")||(_type == "driver")||(_type == "gunner")||(_type == "commander")||(_type == "loader")||(_type == "Crewman");
_isPilot = (_type == "pilot")||(_type == "Pilot");
_isRTO = (_type == "RTO")||(_type == "JTAC")||(_type == "Recon JTAC");
_isReconLeader = (_type == "reconleader")||(_type == "Recon Team Leader");
_isRecon = (_type == "recon")||(_type == "Recon Scout");
_isReconDemo = (_type == "recondemo")||(_type == "Recon Demo Specialist");
_isReconMedic = (_type == "reconmedic")||(_type == "Recon Paramedic");
_isDemo = (_type == "demo")||(_type == "Explosive Specialist");
_isMMG = (_type == "mmg")||(_type == "Gunner (HMG)");
_isMMGTripod = (_type == "mmgtripod")||(_type == "Asst. Gunner (HMG/GMG)");
_isHeavyAT = (_type == "hat")||(_type == "Missile Specialist (AT)");
_isATAssistant = (_type == "hatast")||(_type == "Ammo Bearer");
_isSniper = (_type == "sniper")||(_type == "Sniper");
_isSpotter = (_type == "spotter")||(_type == "Spotter");

// ASSIGN LOADOUTS BASED ON FACTION ============================================

#include "content\loadout-functions.sqf"
#include "content\content-list.sqf"

_defaultSide = WEST;
_defaultFace = _faceWHITE;
_defaultVoice = _voiceAMERICAN;
_defaultInsignia = "none";

#include "faction-list.sqf"

_defaultVoice = _defaultVoice call BIS_fnc_selectRandom;
_defaultFace = _defaultFace call BIS_fnc_selectRandom;

_doVoice = _defaultVoice call BIS_fnc_selectRandom;
_doFace = _defaultFace call BIS_fnc_selectRandom;

if (!isNil "_defaultName") then {
    _defaultName = _defaultName call BIS_fnc_selectRandom;
    _doFirstName = (_defaultName select 0) call BIS_fnc_selectRandom;
    _doLastName = (_defaultName select 1) call BIS_fnc_selectRandom;
    _doFinalName = _doFirstName + " " + _doLastName;
} else {
    _doFinalName = "default";
};

[-1, {
    _unit = _this select 0;
    _voice = _this select 1;
    _face = _this select 2;
    _name = _this select 3;
    _insignia = _this select 4;
    
    waitUntil{(time > 3)};
    
    if !(isPlayer _unit) then {
        _unit setFace _face;
        _unit setSpeaker _voice;
        _unit setPitch ([0.85, 1.15] call BIS_fnc_randomNum);
        if (_name != "default") then {
            switch (true) do {
                case (mission_ACE3_enabled): { _unit setVariable ["ACE_Name", _name, true] };
                case (mission_AGM_enabled): { _unit setVariable ["AGM_Name", _name, true] };
            };
            _unit setName _name;
        };
    };
    if (_insignia != "none") then {
        [_unit, _insignia] call BIS_fnc_setUnitInsignia;
    };
}, [_unit, _doVoice, _doFace, _doFinalName, _defaultInsignia]] call CBA_fnc_globalExecute;