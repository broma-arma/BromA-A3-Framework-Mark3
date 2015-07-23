if !(isClass(configFile>>"CfgPatches">>"ACE_MEDICAL")) exitWith {};

#include "includes\settings.sqf"

//experiment
//ace_medical_allowUnconsciousAnimationOnTreatment = true;



//ACE 3 Revive Settings

ace_medical_enableRevive = mission_ace3_revive_enable;
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
ace_medical_useLocation_SurgicalKit = ACE_medicalTreatment_useSurgKitLocation;
ace_medical_healHitPointAfterAdvBandage = false;
ace_medical_painIsOnlySuppressed = false;


//ACE 3 Captives

ace_captives_allowHandcuffOwnSide = false;
ace_captives_allowSurrender = false;


//ACE 3 Varius other settigns

ace_map_mapShake = true;
ace_map_mapShowCursorCoordinates = false;
ace_map_mapIllumination = true;
ace_map_mapLimitZoom = false;
ace_winddeflection_enabled = true;//disables wind deflection


//ACE 3 Respawn Settings

ace_respawn_SavePreDeathGear = true;
ace_respawn_RemoveDeadBodiesDisconnected = true;


if (hasInterface) then {
    [] call BRM_ACE3_fnc_addACEHelp;
	if (mission_ace3_everyone_medic) then {
	player setvariable ["ACE_medical_medicClass", mission_ace3_everyone_medic, true];};
	// FIX FOR ACE 3.1.1 advanced medical
	if !(mission_ace3_medical_hotfix) exitWith {};
    [] spawn {
	    med_fix = true;
	    while {med_fix} do {waitUntil {sleep 5; (damage player) > 0.1 && (damage player) < 0.9};
            player setDamage 0;
            sleep 1;
	    };
    };
};
