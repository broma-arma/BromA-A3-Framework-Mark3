if (isNil "mandatoryObjectivesA") then { mandatoryObjectivesA = [] };
if (isNil "mandatoryObjectivesB") then { mandatoryObjectivesB = [] };
if (isNil "mandatoryObjectivesC") then { mandatoryObjectivesC = [] };

if (isNil "mandatoryObjectivesC") then { mandatoryObjectivesC = [] };

if (isNil "mission_dead_west") then { mission_dead_west = 0 };
if (isNil "mission_dead_east") then { mission_dead_east = 0 };
if (isNil "mission_dead_independent") then { mission_dead_independent = 0 };
if (isNil "mission_dead_civilian") then { mission_dead_civilian = 0 };

if (isNil "mission_dead_side_A") then { mission_dead_side_A = 0 };
if (isNil "mission_dead_side_B") then { mission_dead_side_B = 0 };
if (isNil "mission_dead_side_C") then { mission_dead_side_C = 0 };

if (isNil "mission_running") then { mission_running = true };

if (isNil "mission_AI_controller") then { mission_AI_controller = false };
if (isNil "mission_HC_enabled") then { mission_HC_enabled = false };

// =============================================================================
//         Initializes all playable units whether they exist or not.
// =============================================================================

if (isNil"Zero69Actual") then { Zero69Actual = objNull };

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