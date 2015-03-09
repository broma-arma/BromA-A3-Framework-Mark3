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

if(isNil"blu_0_0_1")then{blu_0_0_1=objNull}; if(isNil"blu_0_0_2")then{blu_0_0_2=objNull}; if(isNil"blu_0_0_3")then{blu_0_0_3=objNull};

if(isNil"blu_1_0_1")then{blu_1_0_1=objNull}; if(isNil"blu_1_0_2")then{blu_1_0_2=objNull};
if(isNil"blu_1_1_1")then{blu_1_1_1=objNull}; if(isNil"blu_1_1_2")then{blu_1_1_2=objNull};
if(isNil"blu_1_1_3")then{blu_1_1_3=objNull}; if(isNil"blu_1_1_4")then{blu_1_1_4=objNull};
if(isNil"blu_1_2_1")then{blu_1_2_1=objNull}; if(isNil"blu_1_2_2")then{blu_1_2_2=objNull};
if(isNil"blu_1_2_3")then{blu_1_2_3=objNull}; if(isNil"blu_1_2_4")then{blu_1_2_4=objNull};

if(isNil"blu_2_0_1")then{blu_2_0_1=objNull}; if(isNil"blu_2_0_2")then{blu_2_0_2=objNull};
if(isNil"blu_2_1_1")then{blu_2_1_1=objNull}; if(isNil"blu_2_1_2")then{blu_2_1_2=objNull};
if(isNil"blu_2_1_3")then{blu_2_1_3=objNull}; if(isNil"blu_2_1_4")then{blu_2_1_4=objNull};
if(isNil"blu_2_2_1")then{blu_2_2_1=objNull}; if(isNil"blu_2_2_2")then{blu_2_2_2=objNull};
if(isNil"blu_2_2_3")then{blu_2_2_3=objNull}; if(isNil"blu_2_2_4")then{blu_2_2_4=objNull};

if(isNil"blu_3_0_1")then{blu_3_0_1=objNull}; if(isNil"blu_3_0_2")then{blu_3_0_2=objNull};
if(isNil"blu_3_1_1")then{blu_3_1_1=objNull}; if(isNil"blu_3_1_2")then{blu_3_1_2=objNull};
if(isNil"blu_3_1_3")then{blu_3_1_3=objNull}; if(isNil"blu_3_1_4")then{blu_3_1_4=objNull};
if(isNil"blu_3_2_1")then{blu_3_2_1=objNull}; if(isNil"blu_3_2_2")then{blu_3_2_2=objNull};
if(isNil"blu_3_2_3")then{blu_3_2_3=objNull}; if(isNil"blu_3_2_4")then{blu_3_2_4=objNull};

if(isNil"blu_4_0_1")then{blu_4_0_1=objNull}; if(isNil"blu_4_0_2")then{blu_4_0_2=objNull};
if(isNil"blu_4_1_1")then{blu_4_1_1=objNull}; if(isNil"blu_4_1_2")then{blu_4_1_2=objNull};
if(isNil"blu_4_1_3")then{blu_4_1_3=objNull}; if(isNil"blu_4_1_4")then{blu_4_1_4=objNull};
if(isNil"blu_4_2_1")then{blu_4_2_1=objNull}; if(isNil"blu_4_2_2")then{blu_4_2_2=objNull};
if(isNil"blu_4_2_3")then{blu_4_2_3=objNull}; if(isNil"blu_4_2_4")then{blu_4_2_4=objNull};

if(isNil"op_0_0_1")then{op_0_0_1=objNull}; if(isNil"op_0_0_2")then{op_0_0_2=objNull}; if(isNil"op_0_0_3")then{op_0_0_3=objNull};

if(isNil"op_1_0_1")then{op_1_0_1=objNull}; if(isNil"op_1_0_2")then{op_1_0_2=objNull};
if(isNil"op_1_1_1")then{op_1_1_1=objNull}; if(isNil"op_1_1_2")then{op_1_1_2=objNull};
if(isNil"op_1_1_3")then{op_1_1_3=objNull}; if(isNil"op_1_1_4")then{op_1_1_4=objNull};
if(isNil"op_1_2_1")then{op_1_2_1=objNull}; if(isNil"op_1_2_2")then{op_1_2_2=objNull};
if(isNil"op_1_2_3")then{op_1_2_3=objNull}; if(isNil"op_1_2_4")then{op_1_2_4=objNull};

if(isNil"op_2_0_1")then{op_2_0_1=objNull}; if(isNil"op_2_0_2")then{op_2_0_2=objNull};
if(isNil"op_2_1_1")then{op_2_1_1=objNull}; if(isNil"op_2_1_2")then{op_2_1_2=objNull};
if(isNil"op_2_1_3")then{op_2_1_3=objNull}; if(isNil"op_2_1_4")then{op_2_1_4=objNull};
if(isNil"op_2_2_1")then{op_2_2_1=objNull}; if(isNil"op_2_2_2")then{op_2_2_2=objNull};
if(isNil"op_2_2_3")then{op_2_2_3=objNull}; if(isNil"op_2_2_4")then{op_2_2_4=objNull};

if(isNil"op_3_0_1")then{op_3_0_1=objNull}; if(isNil"op_3_0_2")then{op_3_0_2=objNull};
if(isNil"op_3_1_1")then{op_3_1_1=objNull}; if(isNil"op_3_1_2")then{op_3_1_2=objNull};
if(isNil"op_3_1_3")then{op_3_1_3=objNull}; if(isNil"op_3_1_4")then{op_3_1_4=objNull};
if(isNil"op_3_2_1")then{op_3_2_1=objNull}; if(isNil"op_3_2_2")then{op_3_2_2=objNull};
if(isNil"op_3_2_3")then{op_3_2_3=objNull}; if(isNil"op_3_2_4")then{op_3_2_4=objNull};

if(isNil"op_4_0_1")then{op_4_0_1=objNull}; if(isNil"op_4_0_2")then{op_4_0_2=objNull};
if(isNil"op_4_1_1")then{op_4_1_1=objNull}; if(isNil"op_4_1_2")then{op_4_1_2=objNull};
if(isNil"op_4_1_3")then{op_4_1_3=objNull}; if(isNil"op_4_1_4")then{op_4_1_4=objNull};
if(isNil"op_4_2_1")then{op_4_2_1=objNull}; if(isNil"op_4_2_2")then{op_4_2_2=objNull};
if(isNil"op_4_2_3")then{op_4_2_3=objNull}; if(isNil"op_4_2_4")then{op_4_2_4=objNull};

if(isNil"ind_0_0_1")then{ind_0_0_1=objNull}; if(isNil"ind_0_0_2")then{ind_0_0_2=objNull}; if(isNil"ind_0_0_3")then{ind_0_0_3=objNull};

if(isNil"ind_1_0_1")then{ind_1_0_1=objNull}; if(isNil"ind_1_0_2")then{ind_1_0_2=objNull};
if(isNil"ind_1_1_1")then{ind_1_1_1=objNull}; if(isNil"ind_1_1_2")then{ind_1_1_2=objNull};
if(isNil"ind_1_1_3")then{ind_1_1_3=objNull}; if(isNil"ind_1_1_4")then{ind_1_1_4=objNull};
if(isNil"ind_1_2_1")then{ind_1_2_1=objNull}; if(isNil"ind_1_2_2")then{ind_1_2_2=objNull};
if(isNil"ind_1_2_3")then{ind_1_2_3=objNull}; if(isNil"ind_1_2_4")then{ind_1_2_4=objNull};

if(isNil"ind_2_0_1")then{ind_2_0_1=objNull}; if(isNil"ind_2_0_2")then{ind_2_0_2=objNull};
if(isNil"ind_2_1_1")then{ind_2_1_1=objNull}; if(isNil"ind_2_1_2")then{ind_2_1_2=objNull};
if(isNil"ind_2_1_3")then{ind_2_1_3=objNull}; if(isNil"ind_2_1_4")then{ind_2_1_4=objNull};
if(isNil"ind_2_2_1")then{ind_2_2_1=objNull}; if(isNil"ind_2_2_2")then{ind_2_2_2=objNull};
if(isNil"ind_2_2_3")then{ind_2_2_3=objNull}; if(isNil"ind_2_2_4")then{ind_2_2_4=objNull};

if(isNil"ind_3_0_1")then{ind_3_0_1=objNull}; if(isNil"ind_3_0_2")then{ind_3_0_2=objNull};
if(isNil"ind_3_1_1")then{ind_3_1_1=objNull}; if(isNil"ind_3_1_2")then{ind_3_1_2=objNull};
if(isNil"ind_3_1_3")then{ind_3_1_3=objNull}; if(isNil"ind_3_1_4")then{ind_3_1_4=objNull};
if(isNil"ind_3_2_1")then{ind_3_2_1=objNull}; if(isNil"ind_3_2_2")then{ind_3_2_2=objNull};
if(isNil"ind_3_2_3")then{ind_3_2_3=objNull}; if(isNil"ind_3_2_4")then{ind_3_2_4=objNull};

if(isNil"ind_4_0_1")then{ind_4_0_1=objNull}; if(isNil"ind_4_0_2")then{ind_4_0_2=objNull};
if(isNil"ind_4_1_1")then{ind_4_1_1=objNull}; if(isNil"ind_4_1_2")then{ind_4_1_2=objNull};
if(isNil"ind_4_1_3")then{ind_4_1_3=objNull}; if(isNil"ind_4_1_4")then{ind_4_1_4=objNull};
if(isNil"ind_4_2_1")then{ind_4_2_1=objNull}; if(isNil"ind_4_2_2")then{ind_4_2_2=objNull};
if(isNil"ind_4_2_3")then{ind_4_2_3=objNull}; if(isNil"ind_4_2_4")then{ind_4_2_4=objNull};

// =============================================================================
//          Initializes all possible groups whether they exist or not.
// =============================================================================

if(isNil"blu_0_0")then{blu_0_0=grpNull}; 
if(isNil"blu_1_0")then{blu_1_0=grpNull}; if(isNil"blu_1_1")then{blu_1_1=grpNull}; if(isNil"blu_1_2")then{blu_1_2=grpNull};
if(isNil"blu_2_0")then{blu_2_0=grpNull}; if(isNil"blu_2_1")then{blu_2_1=grpNull}; if(isNil"blu_2_2")then{blu_2_2=grpNull};
if(isNil"blu_3_0")then{blu_3_0=grpNull}; if(isNil"blu_3_1")then{blu_3_1=grpNull}; if(isNil"blu_3_2")then{blu_3_2=grpNull};
if(isNil"blu_4_0")then{blu_4_0=grpNull}; if(isNil"blu_4_1")then{blu_4_1=grpNull}; if(isNil"blu_4_2")then{blu_4_2=grpNull};

if(isNil"op_0_0")then{op_0_0=grpNull}; 
if(isNil"op_1_0")then{op_1_0=grpNull}; if(isNil"op_1_1")then{op_1_1=grpNull}; if(isNil"op_1_2")then{op_1_2=grpNull};
if(isNil"op_2_0")then{op_2_0=grpNull}; if(isNil"op_2_1")then{op_2_1=grpNull}; if(isNil"op_2_2")then{op_2_2=grpNull};
if(isNil"op_3_0")then{op_3_0=grpNull}; if(isNil"op_3_1")then{op_3_1=grpNull}; if(isNil"op_3_2")then{op_3_2=grpNull};
if(isNil"op_4_0")then{op_4_0=grpNull}; if(isNil"op_4_1")then{op_4_1=grpNull}; if(isNil"op_4_2")then{op_4_2=grpNull};

if(isNil"ind_0_0")then{ind_0_0=grpNull}; 
if(isNil"ind_1_0")then{ind_1_0=grpNull}; if(isNil"ind_1_1")then{ind_1_1=grpNull}; if(isNil"ind_1_2")then{ind_1_2=grpNull};
if(isNil"ind_2_0")then{ind_2_0=grpNull}; if(isNil"ind_2_1")then{ind_2_1=grpNull}; if(isNil"ind_2_2")then{ind_2_2=grpNull};
if(isNil"ind_3_0")then{ind_3_0=grpNull}; if(isNil"ind_3_1")then{ind_3_1=grpNull}; if(isNil"ind_3_2")then{ind_3_2=grpNull};
if(isNil"ind_4_0")then{ind_4_0=grpNull}; if(isNil"ind_4_1")then{ind_4_1=grpNull}; if(isNil"ind_4_2")then{ind_4_2=grpNull};

// =============================================================================