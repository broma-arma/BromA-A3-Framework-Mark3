
if !(isClass(configFile>>"CfgPatches">>"ACE_MEDICAL")) exitWith {};
if (!isServer) exitWith {};

#include "includes\settings.sqf"

_center = createCenter sideLogic;
_group = createGroup _center;


//ACE 3 Respawn
_module = _group createUnit ["ACE_ModuleRespawn", [0,0,0],[],0.5,"NONE"];
_module setVariable ["SavePreDeathGear", true];
_module setVariable ["RemoveDeadBodiesDisconnected", true];


//ACE 3 Revive Settings
_module = _group createUnit ["ACE_moduleReviveSettings", [0,0,0],[],0.5,"NONE"];
_module setVariable ["enableRevive", true];
_module setVariable ["maxReviveTime", mission_ace3_revive_time];
_module setVariable ["amountOfReviveLives", mission_ace3_revive_lives];


//ACE 3 Medical
_module = _group createUnit ["ACE_moduleMedicalSettings", [0,0,0],[],0.5,"NONE"];
_module setVariable ["level", mission_ace3_medical_level];
_module setVariable ["medicSetting", mission_ace3_medical_level];
_module setVariable ["allowLitterCreation", ACE_medicalTreatment_allowLitter];
_module setVariable ["litterCleanUpDelay", ACE_medicalTreatment_litterRemove];
_module setVariable ["enableScreams", ACE_Medical_enableFor];
_module setVariable ["playerDamageThreshold", ACE_Medical_playerDamage];
_module setVariable ["AIDamageThreshold", ACE_Medical_aiDamage];
_module setVariable ["enableUnsconsiousnessAI", ACE_Medical_unconAI];
_module setVariable ["preventInstaDeath", ACE_Medical_preventInstaDeath];
_module setVariable ["bleedingCoefficient", ACE_Medical_bleeding];
_module setVariable ["keepLocalSettingsSynced", true];


//ACE 3 Advanced Medical
_module = _group createUnit ["ACE_moduleAdvancedMedicalSettings", [0,0,0],[],0.5,"NONE"];
_module setVariable ["enableFor", ACE_Medical_enableFor];
_module setVariable ["enableAdvancedWounds", ACE_Medical_advWounds];
_module setVariable ["enableVehicleCrashes", ACE_Medical_unconAI];
_module setVariable ["medicSetting_PAK", ACE_medicalTreatment_usePAK];
_module setVariable ["consumeItem_PAK", ACE_medicalTreatment_consumePAK];
_module setVariable ["useLocation_PAK", ACE_medicalTreatment_usePAKLocation];
_module setVariable ["medicSetting_SurgicalKit", ACE_medicalTreatment_useSurgKit];
_module setVariable ["consumeItem_SurgicalKit", ACE_medicalTreatment_consumeSurgKit];
_module setVariable ["useLocation_SurgicalKit", ACE_medicalTreatment_useSurgKitLocation];
_module setVariable ["enableOverdosing", ACE_medicalTreatment_enableOverdose];
