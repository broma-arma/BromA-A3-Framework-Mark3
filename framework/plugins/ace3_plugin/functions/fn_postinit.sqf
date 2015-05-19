if !(isClass(configFile>>"CfgPatches">>"ACE_MEDICAL")) exitWith {};

#include "includes\settings.sqf"

//experiment
//ace_medical_allowUnconsciousAnimationOnTreatment = true;

//ACE 3 Revive Settings

ace_medical_enableRevive = 1;
ace_medical_maxReviveTime = mission_ace3_revive_time;
ace_medical_amountOfReviveLives = mission_ace3_revive_lives;


//ACE 3 Medical

ace_medical_level = mission_ace3_medical_level;
ace_medical_medicSetting = mission_ace3_medical_level;
ace_medical_allowLitterCreation = ACE_medicalTreatment_allowLitter;
ace_medical_litterCleanUpDelay = ACE_medicalTreatment_litterRemove;
ace_medical_enableScreams = ACE_Medical_screams;
ace_medical_playerDamageThreshold = ACE_Medical_playerDamage;
ace_medical_AIDamageThreshold = ACE_Medical_aiDamage;
ace_medical_enableUnsconsiousnessAI = ACE_Medical_unconAI;
ace_medical_preventInstaDeath = ACE_Medical_preventInstaDeath;
ace_medical_bleedingcoefficient = ACE_Medical_bleeding;
ace_medical_painCoefficient = ACE_Medical_pain;
ace_medical_keepLocalSettingsSynced = true;


//ACE 3 Advanced Medical

ace_medical_enableFor = ACE_Medical_enableFor;
ace_medical_enableadvancedwounds = ACE_Medical_advWounds;
ace_medical_enableVehicleCrashes = ACE_Medical_Veh;
ace_medical_medicSetting_PAK = ACE_medicalTreatment_usePAK;
ace_medical_consumeItem_PAK = ACE_medicalTreatment_consumePAK;
ace_medical_useLocation_PAK = ACE_medicalTreatment_usePAKLocation;
ace_medical_medicSetting_SurgicalKit = ACE_medicalTreatment_useSurgKit;
ace_medical_consumeItem_SurgicalKit = ACE_medicalTreatment_consumeSurgKit;
ace_medical_useLocation_SurgicalKit = ACE_medicalTreatment_useSurgKitLocation;


// le server stuff times
if (!isServer) exitWith {};

_center = createCenter sideLogic;
_group = createGroup _center;


//ACE 3 Respawn
_module = _group createUnit ["ACE_ModuleRespawn", [0,0,0],[],0.5,"NONE"];
_module setVariable ["SavePreDeathGear", true];
_module setVariable ["RemoveDeadBodiesDisconnected", true];
