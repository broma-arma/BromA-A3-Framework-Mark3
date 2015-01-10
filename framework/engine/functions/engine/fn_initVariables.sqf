if (isNil "mandatoryObjectivesA") then { mandatoryObjectivesA = [] };
if (isNil "mandatoryObjectivesB") then { mandatoryObjectivesB = [] };
if (isNil "mandatoryObjectivesC") then { mandatoryObjectivesC = [] };
if (isNil "deadPlayersArray") then { deadPlayersArray = [] };
if (isNil "playerLives") then { playerLives = [] };

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