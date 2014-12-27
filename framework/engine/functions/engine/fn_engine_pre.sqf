#define LOADED_PLUGINS (missionConfigFile >> "CfgPlugins")

ENGINE_plugins = [];
ENGINE_preinits = [];
ENGINE_postinits = [];

mandatoryObjectivesA = [];
mandatoryObjectivesB = [];
mandatoryObjectivesC = [];

// =============================================================================
//          Initializes all possible groups whether they exist or not.
// =============================================================================
if (isNil"alpha_grp_blu1") then {alpha_grp_blu1 = grpNull}; if (isNil"alpha_grp_blu2") then {alpha_grp_blu2 = grpNull};
if (isNil"bravo_grp_blu1") then {bravo_grp_blu1 = grpNull}; if (isNil"bravo_grp_blu2") then {bravo_grp_blu2 = grpNull};
if (isNil"charlie_grp_blu1") then {charlie_grp_blu1 = grpNull}; if (isNil"charlie_grp_blu2") then {charlie_grp_blu2 = grpNull};
if (isNil"delta_grp_blu1") then {delta_grp_blu1 = grpNull}; if (isNil"delta_grp_blu2") then {delta_grp_blu2 = grpNull};

if (isNil"alpha_grp_op1") then {alpha_grp_op1 = grpNull}; if (isNil"alpha_grp_op2") then {alpha_grp_op2 = grpNull};
if (isNil"bravo_grp_op1") then {bravo_grp_op1 = grpNull}; if (isNil"bravo_grp_op2") then {bravo_grp_op2 = grpNull};
if (isNil"charlie_grp_op1") then {charlie_grp_op1 = grpNull}; if (isNil"charlie_grp_op2") then {charlie_grp_op2 = grpNull};
if (isNil"delta_grp_op1") then {delta_grp_op1 = grpNull}; if (isNil"delta_grp_op2") then {delta_grp_op2 = grpNull};

if (isNil"alpha_grp_ind1") then {alpha_grp_ind1 = grpNull}; if (isNil"alpha_grp_ind2") then {alpha_grp_ind2 = grpNull};
if (isNil"bravo_grp_ind1") then {bravo_grp_ind1 = grpNull}; if (isNil"bravo_grp_ind2") then {bravo_grp_ind2 = grpNull};
if (isNil"charlie_grp_ind1") then {charlie_grp_ind1 = grpNull}; if (isNil"charlie_grp_ind2") then {charlie_grp_ind2 = grpNull};
if (isNil"delta_grp_ind1") then {delta_grp_ind1 = grpNull}; if (isNil"delta_grp_ind2") then {delta_grp_ind2 = grpNull};
// =============================================================================

for "_i" from 0 to ((count LOADED_PLUGINS) - 1) do {
    private ["_plugin","_preinit","_postinit"];
    _plugin = configName(LOADED_PLUGINS select _i);
    _preinit = getText((missionConfigFile >> "CfgPlugins") >> _plugin >> "preinit");
    _postinit = getText((missionConfigFile >> "CfgPlugins") >> _plugin >> "postinit");
    
    if (_preinit != "") then { ENGINE_preinits set [count ENGINE_preinits, LOADED_PLUGINS select _i] };
    if (_postinit != "") then { ENGINE_postinits set [count ENGINE_postinits, LOADED_PLUGINS select _i] };
    
    ENGINE_plugins set [count ENGINE_plugins, LOADED_PLUGINS select _i];
};

[ENGINE_preinits] call BRM_fnc_loadPlugins;