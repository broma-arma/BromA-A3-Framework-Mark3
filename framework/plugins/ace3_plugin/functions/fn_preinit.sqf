
if !(isClass(configFile>>"CfgPatches">>"ACE_MEDICAL")) exitWith {};
if (!isServer) exitWith {};

#include "includes\settings.sqf"

_center = createCenter sideLogic;
_group = createGroup _center;


//ACE 3 medical facilities
_module = _group createUnit ["ACE_moduleAssignMedicalFacility", [0,0,0],[],0.5,"NONE"];
_module setVariable ["enabled", true];
//{if (_x isKindOf "MASH") then { _module synchronizeObjectsAdd [_x] }} forEach allMissionObjects "All";};


//ACE 3 Respawn
_module = _group createUnit ["ACE_ModuleRespawn", [0,0,0],[],0.5,"NONE"];
_module setVariable ["SavePreDeathGear", true];
_module setVariable ["RemoveDeadBodiesDisconnected", true];


//ACE 3 Revive Settings
_module = _group createUnit ["ACE_moduleReviveSettings", [0,0,0],[],0.5,"NONE"];
_module setVariable ["enableRevive", 1];
_module setVariable ["maxReviveTime", 120];
_module setVariable ["amountOfReviveLives", 1];


//ACE 3 Medical
_module = _group createUnit ["ACE_moduleMedicalSettings", [0,0,0],[],0.5,"NONE"];

_module setVariable ["level", 1];
_module setVariable ["remoteControlledAI", true];
_module setVariable ["medicSetting", 1];
_module setVariable ["allowLitterCreation", true];
_module setVariable ["litterCleanUpDelay", 1800];
_module setVariable ["enableScreams", true];
_module setVariable ["playerDamageThreshold", 1];
_module setVariable ["AIDamageThreshold", 1];
_module setVariable ["enableUnconsciousnessAI", 0];
_module setVariable ["preventInstaDeath", true];
_module setVariable ["bleedingCoefficient", 1];
_module setVariable ["painCoefficient", 1];
_module setVariable ["keepLocalSettingsSynced", true];


//ACE 3 Advanced Medical
_module = _group createUnit ["ACE_moduleAdvancedMedicalSettings", [0,0,0],[],0.5,"NONE"];
_module setVariable ["enableFor", 0];
_module setVariable ["enableAdvancedWounds", false];
_module setVariable ["enableVehicleCrashes", true];
_module setVariable ["medicSetting_PAK", 1];
_module setVariable ["consumeItem_PAK", 1];
_module setVariable ["useLocation_PAK", 0];
_module setVariable ["medicSetting_SurgicalKit", 1];
_module setVariable ["consumeItem_SurgicalKit", 0];
_module setVariable ["useLocation_SurgicalKit", 0];
_module setVariable ["healHitPointAfterAdvBandage", false];
_module setVariable ["painIsOnlySuppressed", true];

_module = _group createUnit ["ace_captives_moduleSettings", [0,0,0],[],0.5,"NONE"];
_module setVariable ["allowHandcuffOwnSide", false];
_module setVariable ["allowSurrender", false];