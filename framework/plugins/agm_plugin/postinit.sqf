_path = _this select 0;

// =============================================================================
//  AGM Revive Time
// =============================================================================

switch (param_revive_time) do {
    case 0: { mission_revive_time = 10 };
    case 1: { mission_revive_time = 120 };
    case 2: { mission_revive_time = 300 };
    case 3: { mission_revive_time = 600 };
};
publicVariable "mission_revive_time";

// =============================================================================

#include "settings.sqf"

BRM_fnc_AGM_Revive = compile preprocessFileLineNumbers (_path+"fn_AGM_Revive.sqf");

_center = createCenter sideLogic;
_group = createGroup _center;

_module = _group createUnit ["AGM_ModuleRespawn", [0,0,0],[],0.5,"NONE"];
_module setVariable ["RemoveDeadBodiesDisonncected", true];
_module setVariable ["SavePreDeathGear", true];

_module = _group createUnit ["AGM_ModuleMedical", [0,0,0],[],0.5,"NONE"];
_module setVariable ["AllowChatWhileUnconscious", false];
_module setVariable ["AllowNonmedics", agm_settings_AllowNonmedics];
_module setVariable ["AutomaticWakeup", agm_settings_AutomaticWakeup];
_module setVariable ["CoefBleeding", agm_settings_CoefBleeding];
_module setVariable ["CoefDamage", agm_settings_CoefDamage];
_module setVariable ["CoefNonMedic", agm_settings_CoefNonMedic];
_module setVariable ["CoefPain", agm_settings_CoefPain];
_module setVariable ["EnableOverdosing", false];
_module setVariable ["MaxUnconsciousnessTime", mission_revive_time];
_module setVariable ["PreventDeathWhileUnconscious", agm_settings_PreventDeathWhileUnconscious];
_module setVariable ["PreventInstaDeath", agm_settings_PreventInstaDeath];
_module setVariable ["RequireDiagnosis", agm_settings_RequireDiagnosis];
_module setVariable ["RequireMEDEVAC", false];
_module setVariable ["SingleBandage", agm_settings_SingleBandage];
_module setVariable ["DisableScreams", agm_settings_DisableScreams];