/*
================================================================================

NAME:
    BRM_fnc_initVariables
    
AUTHOR(s):
    Nife

DESCRIPTION:
    Initializes all environment variables related to the Framework, such as 
    units, groups, object arrays and settings.

PARAMETERS:
    None.
    
USAGE:
    [] call BRM_fnc_initVariables;
    
RETURNS:
    Nothing.

================================================================================
*/

if (isNil "tasks_a") then { tasks_a = [] };
if (isNil "tasks_b") then { tasks_b = [] };
if (isNil "tasks_c") then { tasks_c = [] };

if (isNil "tasks_primary_a") then { tasks_primary_a = [] };
if (isNil "tasks_primary_b") then { tasks_primary_b = [] };
if (isNil "tasks_primary_c") then { tasks_primary_c = [] };

if (isNil "tasks_secondary_a") then { tasks_secondary_a = [] };
if (isNil "tasks_secondary_b") then { tasks_secondary_b = [] };
if (isNil "tasks_secondary_c") then { tasks_secondary_c = [] };

if (isNil "tasks_callbacks") then { tasks_callbacks = [] };

if (isNil "tasks_done_a") then { tasks_done_a = [] };
if (isNil "tasks_done_b") then { tasks_done_b = [] };
if (isNil "tasks_done_c") then { tasks_done_c = [] };

if (isNil "mission_dead_west") then { mission_dead_west = 0 };
if (isNil "mission_dead_east") then { mission_dead_east = 0 };
if (isNil "mission_dead_independent") then { mission_dead_independent = 0 };
if (isNil "mission_dead_civilian") then { mission_dead_civilian = 0 };
           
if (isNil "mission_players_A") then { mission_players_A = [] };
if (isNil "mission_players_B") then { mission_players_B = [] };
if (isNil "mission_players_C") then { mission_players_C = [] };

if (isNil "mission_dead_side_A") then { mission_dead_side_A = 0 };
if (isNil "mission_dead_side_B") then { mission_dead_side_B = 0 };
if (isNil "mission_dead_side_C") then { mission_dead_side_C = 0 };

if (isNil "mission_unit_score") then { mission_unit_score = [] };

if (isNil "mission_running") then { mission_running = true };

if (isNil "mission_AI_controller") then { mission_AI_controller = false };
if (isNil "mission_HC_enabled") then { mission_HC_enabled = false };

// ============================================================================
//         Initializes all playable units whether they exist or not.           |
// ============================================================================

if(isNil"blu_0_0_1")then{blu_0_0_1=objNull}; if(isNil"blu_0_0_2")then{blu_0_0_2=objNull}; if(isNil"blu_0_0_3")then{blu_0_0_3=objNull};

if(isNil"blu_1_0_1")then{blu_1_0_1=objNull}; if(isNil"blu_1_0_2")then{blu_1_0_2=objNull}; if(isNil"blu_1_0_3")then{blu_1_0_3=objNull};
if(isNil"blu_1_1_1")then{blu_1_1_1=objNull}; if(isNil"blu_1_1_2")then{blu_1_1_2=objNull};
if(isNil"blu_1_1_3")then{blu_1_1_3=objNull}; if(isNil"blu_1_1_4")then{blu_1_1_4=objNull};
if(isNil"blu_1_2_1")then{blu_1_2_1=objNull}; if(isNil"blu_1_2_2")then{blu_1_2_2=objNull};
if(isNil"blu_1_2_3")then{blu_1_2_3=objNull}; if(isNil"blu_1_2_4")then{blu_1_2_4=objNull};

if(isNil"blu_2_0_1")then{blu_2_0_1=objNull}; if(isNil"blu_2_0_2")then{blu_2_0_2=objNull}; if(isNil"blu_2_0_3")then{blu_2_0_3=objNull};
if(isNil"blu_2_1_1")then{blu_2_1_1=objNull}; if(isNil"blu_2_1_2")then{blu_2_1_2=objNull};
if(isNil"blu_2_1_3")then{blu_2_1_3=objNull}; if(isNil"blu_2_1_4")then{blu_2_1_4=objNull};
if(isNil"blu_2_2_1")then{blu_2_2_1=objNull}; if(isNil"blu_2_2_2")then{blu_2_2_2=objNull};
if(isNil"blu_2_2_3")then{blu_2_2_3=objNull}; if(isNil"blu_2_2_4")then{blu_2_2_4=objNull};

if(isNil"blu_3_0_1")then{blu_3_0_1=objNull}; if(isNil"blu_3_0_2")then{blu_3_0_2=objNull}; if(isNil"blu_3_0_3")then{blu_3_0_3=objNull};
if(isNil"blu_3_1_1")then{blu_3_1_1=objNull}; if(isNil"blu_3_1_2")then{blu_3_1_2=objNull};
if(isNil"blu_3_1_3")then{blu_3_1_3=objNull}; if(isNil"blu_3_1_4")then{blu_3_1_4=objNull};
if(isNil"blu_3_2_1")then{blu_3_2_1=objNull}; if(isNil"blu_3_2_2")then{blu_3_2_2=objNull};
if(isNil"blu_3_2_3")then{blu_3_2_3=objNull}; if(isNil"blu_3_2_4")then{blu_3_2_4=objNull};

if(isNil"blu_4_0_1")then{blu_4_0_1=objNull}; if(isNil"blu_4_0_2")then{blu_4_0_2=objNull}; if(isNil"blu_4_0_3")then{blu_4_0_3=objNull};
if(isNil"blu_4_1_1")then{blu_4_1_1=objNull}; if(isNil"blu_4_1_2")then{blu_4_1_2=objNull};
if(isNil"blu_4_1_3")then{blu_4_1_3=objNull}; if(isNil"blu_4_1_4")then{blu_4_1_4=objNull};
if(isNil"blu_4_2_1")then{blu_4_2_1=objNull}; if(isNil"blu_4_2_2")then{blu_4_2_2=objNull};
if(isNil"blu_4_2_3")then{blu_4_2_3=objNull}; if(isNil"blu_4_2_4")then{blu_4_2_4=objNull};

if(isNil"blu_5_0_1")then{blu_5_0_1=objNull}; if(isNil"blu_5_0_2")then{blu_5_0_2=objNull}; 
if(isNil"blu_5_0_3")then{blu_5_0_3=objNull}; if(isNil"blu_5_0_4")then{blu_5_0_4=objNull};

if(isNil"blu_6_0_1")then{blu_6_0_1=objNull}; if(isNil"blu_6_0_2")then{blu_6_0_2=objNull}; 
if(isNil"blu_6_0_3")then{blu_6_0_3=objNull}; if(isNil"blu_6_0_4")then{blu_6_0_4=objNull};

if(isNil"blu_7_0_1")then{blu_7_0_1=objNull}; if(isNil"blu_7_0_2")then{blu_7_0_2=objNull}; 
if(isNil"blu_7_0_3")then{blu_7_0_3=objNull}; if(isNil"blu_7_0_4")then{blu_7_0_4=objNull};

if(isNil"blu_8_0_1")then{blu_8_0_1=objNull}; if(isNil"blu_8_0_2")then{blu_8_0_2=objNull}; 
if(isNil"blu_8_0_3")then{blu_8_0_3=objNull};

if(isNil"blu_9_0_1")then{blu_9_0_1=objNull}; if(isNil"blu_9_0_2")then{blu_9_0_2=objNull};

if(isNil"blu_10_1_1")then{blu_10_1_1=objNull}; if(isNil"blu_10_1_2")then{blu_10_1_2=objNull};

if(isNil"blu_11_1_1")then{blu_11_1_1=objNull}; if(isNil"blu_11_1_2")then{blu_11_1_2=objNull}; 
if(isNil"blu_11_1_3")then{blu_11_1_3=objNull};

if(isNil"blu_12_1_1")then{blu_12_1_1=objNull}; if(isNil"blu_12_1_2")then{blu_12_1_2=objNull}; 
if(isNil"blu_12_1_3")then{blu_12_1_3=objNull}; if(isNil"blu_12_1_4")then{blu_12_1_4=objNull};

if(isNil"blu_13_1_1")then{blu_13_1_1=objNull}; if(isNil"blu_13_1_2")then{blu_13_1_2=objNull}; 
if(isNil"blu_13_1_3")then{blu_13_1_3=objNull}; if(isNil"blu_13_1_4")then{blu_13_1_4=objNull};
if(isNil"blu_13_1_5")then{blu_13_1_5=objNull};

if(isNil"blu_14_2_1")then{blu_14_2_1=objNull}; if(isNil"blu_14_2_2")then{blu_14_2_2=objNull};
if(isNil"blu_14_2_1")then{blu_14_2_1=objNull}; if(isNil"blu_14_2_2")then{blu_14_2_2=objNull};

if(isNil"op_0_0_1")then{op_0_0_1=objNull}; if(isNil"op_0_0_2")then{op_0_0_2=objNull}; if(isNil"op_0_0_3")then{op_0_0_3=objNull};

if(isNil"op_1_0_1")then{op_1_0_1=objNull}; if(isNil"op_1_0_2")then{op_1_0_2=objNull}; if(isNil"op_1_0_3")then{op_1_0_3=objNull};
if(isNil"op_1_1_1")then{op_1_1_1=objNull}; if(isNil"op_1_1_2")then{op_1_1_2=objNull};
if(isNil"op_1_1_3")then{op_1_1_3=objNull}; if(isNil"op_1_1_4")then{op_1_1_4=objNull};
if(isNil"op_1_2_1")then{op_1_2_1=objNull}; if(isNil"op_1_2_2")then{op_1_2_2=objNull};
if(isNil"op_1_2_3")then{op_1_2_3=objNull}; if(isNil"op_1_2_4")then{op_1_2_4=objNull};

if(isNil"op_2_0_1")then{op_2_0_1=objNull}; if(isNil"op_2_0_2")then{op_2_0_2=objNull}; if(isNil"op_2_0_3")then{op_2_0_3=objNull};
if(isNil"op_2_1_1")then{op_2_1_1=objNull}; if(isNil"op_2_1_2")then{op_2_1_2=objNull};
if(isNil"op_2_1_3")then{op_2_1_3=objNull}; if(isNil"op_2_1_4")then{op_2_1_4=objNull};
if(isNil"op_2_2_1")then{op_2_2_1=objNull}; if(isNil"op_2_2_2")then{op_2_2_2=objNull};
if(isNil"op_2_2_3")then{op_2_2_3=objNull}; if(isNil"op_2_2_4")then{op_2_2_4=objNull};

if(isNil"op_3_0_1")then{op_3_0_1=objNull}; if(isNil"op_3_0_2")then{op_3_0_2=objNull}; if(isNil"op_3_0_3")then{op_3_0_3=objNull};
if(isNil"op_3_1_1")then{op_3_1_1=objNull}; if(isNil"op_3_1_2")then{op_3_1_2=objNull};
if(isNil"op_3_1_3")then{op_3_1_3=objNull}; if(isNil"op_3_1_4")then{op_3_1_4=objNull};
if(isNil"op_3_2_1")then{op_3_2_1=objNull}; if(isNil"op_3_2_2")then{op_3_2_2=objNull};
if(isNil"op_3_2_3")then{op_3_2_3=objNull}; if(isNil"op_3_2_4")then{op_3_2_4=objNull};

if(isNil"op_4_0_1")then{op_4_0_1=objNull}; if(isNil"op_4_0_2")then{op_4_0_2=objNull}; if(isNil"op_4_0_3")then{op_4_0_3=objNull};
if(isNil"op_4_1_1")then{op_4_1_1=objNull}; if(isNil"op_4_1_2")then{op_4_1_2=objNull};
if(isNil"op_4_1_3")then{op_4_1_3=objNull}; if(isNil"op_4_1_4")then{op_4_1_4=objNull};
if(isNil"op_4_2_1")then{op_4_2_1=objNull}; if(isNil"op_4_2_2")then{op_4_2_2=objNull};
if(isNil"op_4_2_3")then{op_4_2_3=objNull}; if(isNil"op_4_2_4")then{op_4_2_4=objNull};

if(isNil"op_5_0_1")then{op_5_0_1=objNull}; if(isNil"op_5_0_2")then{op_5_0_2=objNull}; 
if(isNil"op_5_0_3")then{op_5_0_3=objNull}; if(isNil"op_5_0_4")then{op_5_0_4=objNull};

if(isNil"op_6_0_1")then{op_6_0_1=objNull}; if(isNil"op_6_0_2")then{op_6_0_2=objNull}; 
if(isNil"op_6_0_3")then{op_6_0_3=objNull}; if(isNil"op_6_0_4")then{op_6_0_4=objNull};

if(isNil"op_7_0_1")then{op_7_0_1=objNull}; if(isNil"op_7_0_2")then{op_7_0_2=objNull}; 
if(isNil"op_7_0_3")then{op_7_0_3=objNull}; if(isNil"op_7_0_4")then{op_7_0_4=objNull};

if(isNil"op_8_0_1")then{op_8_0_1=objNull}; if(isNil"op_8_0_2")then{op_8_0_2=objNull}; 
if(isNil"op_8_0_3")then{op_8_0_3=objNull};

if(isNil"op_9_0_1")then{op_9_0_1=objNull}; if(isNil"op_9_0_2")then{op_9_0_2=objNull};

if(isNil"op_10_1_1")then{op_10_1_1=objNull}; if(isNil"op_10_1_2")then{op_10_1_2=objNull};

if(isNil"op_11_1_1")then{op_11_1_1=objNull}; if(isNil"op_11_1_2")then{op_11_1_2=objNull}; 
if(isNil"op_11_1_3")then{op_11_1_3=objNull};

if(isNil"op_12_1_1")then{op_12_1_1=objNull}; if(isNil"op_12_1_2")then{op_12_1_2=objNull}; 
if(isNil"op_12_1_3")then{op_12_1_3=objNull}; if(isNil"op_12_1_4")then{op_12_1_4=objNull};

if(isNil"op_13_1_1")then{op_13_1_1=objNull}; if(isNil"op_13_1_2")then{op_13_1_2=objNull}; 
if(isNil"op_13_1_3")then{op_13_1_3=objNull}; if(isNil"op_13_1_4")then{op_13_1_4=objNull};
if(isNil"op_13_1_5")then{op_13_1_5=objNull};

if(isNil"op_14_2_1")then{op_14_2_1=objNull}; if(isNil"op_14_2_2")then{op_14_2_2=objNull};
if(isNil"op_14_2_1")then{op_14_2_1=objNull}; if(isNil"op_14_2_2")then{op_14_2_2=objNull};

if(isNil"ind_0_0_1")then{ind_0_0_1=objNull}; if(isNil"ind_0_0_2")then{ind_0_0_2=objNull}; if(isNil"ind_0_0_3")then{ind_0_0_3=objNull};

if(isNil"ind_1_0_1")then{ind_1_0_1=objNull}; if(isNil"ind_1_0_2")then{ind_1_0_2=objNull}; if(isNil"ind_1_0_3")then{ind_1_0_3=objNull};
if(isNil"ind_1_1_1")then{ind_1_1_1=objNull}; if(isNil"ind_1_1_2")then{ind_1_1_2=objNull};
if(isNil"ind_1_1_3")then{ind_1_1_3=objNull}; if(isNil"ind_1_1_4")then{ind_1_1_4=objNull};
if(isNil"ind_1_2_1")then{ind_1_2_1=objNull}; if(isNil"ind_1_2_2")then{ind_1_2_2=objNull};
if(isNil"ind_1_2_3")then{ind_1_2_3=objNull}; if(isNil"ind_1_2_4")then{ind_1_2_4=objNull};

if(isNil"ind_2_0_1")then{ind_2_0_1=objNull}; if(isNil"ind_2_0_2")then{ind_2_0_2=objNull}; if(isNil"ind_2_0_3")then{ind_2_0_3=objNull};
if(isNil"ind_2_1_1")then{ind_2_1_1=objNull}; if(isNil"ind_2_1_2")then{ind_2_1_2=objNull};
if(isNil"ind_2_1_3")then{ind_2_1_3=objNull}; if(isNil"ind_2_1_4")then{ind_2_1_4=objNull};
if(isNil"ind_2_2_1")then{ind_2_2_1=objNull}; if(isNil"ind_2_2_2")then{ind_2_2_2=objNull};
if(isNil"ind_2_2_3")then{ind_2_2_3=objNull}; if(isNil"ind_2_2_4")then{ind_2_2_4=objNull};

if(isNil"ind_3_0_1")then{ind_3_0_1=objNull}; if(isNil"ind_3_0_2")then{ind_3_0_2=objNull}; if(isNil"ind_3_0_3")then{ind_3_0_3=objNull};
if(isNil"ind_3_1_1")then{ind_3_1_1=objNull}; if(isNil"ind_3_1_2")then{ind_3_1_2=objNull};
if(isNil"ind_3_1_3")then{ind_3_1_3=objNull}; if(isNil"ind_3_1_4")then{ind_3_1_4=objNull};
if(isNil"ind_3_2_1")then{ind_3_2_1=objNull}; if(isNil"ind_3_2_2")then{ind_3_2_2=objNull};
if(isNil"ind_3_2_3")then{ind_3_2_3=objNull}; if(isNil"ind_3_2_4")then{ind_3_2_4=objNull};

if(isNil"ind_4_0_1")then{ind_4_0_1=objNull}; if(isNil"ind_4_0_2")then{ind_4_0_2=objNull}; if(isNil"ind_4_0_3")then{ind_4_0_3=objNull};
if(isNil"ind_4_1_1")then{ind_4_1_1=objNull}; if(isNil"ind_4_1_2")then{ind_4_1_2=objNull};
if(isNil"ind_4_1_3")then{ind_4_1_3=objNull}; if(isNil"ind_4_1_4")then{ind_4_1_4=objNull};
if(isNil"ind_4_2_1")then{ind_4_2_1=objNull}; if(isNil"ind_4_2_2")then{ind_4_2_2=objNull};
if(isNil"ind_4_2_3")then{ind_4_2_3=objNull}; if(isNil"ind_4_2_4")then{ind_4_2_4=objNull};

if(isNil"ind_5_0_1")then{ind_5_0_1=objNull}; if(isNil"ind_5_0_2")then{ind_5_0_2=objNull}; 
if(isNil"ind_5_0_3")then{ind_5_0_3=objNull}; if(isNil"ind_5_0_4")then{ind_5_0_4=objNull};

if(isNil"ind_6_0_1")then{ind_6_0_1=objNull}; if(isNil"ind_6_0_2")then{ind_6_0_2=objNull}; 
if(isNil"ind_6_0_3")then{ind_6_0_3=objNull}; if(isNil"ind_6_0_4")then{ind_6_0_4=objNull};

if(isNil"ind_7_0_1")then{ind_7_0_1=objNull}; if(isNil"ind_7_0_2")then{ind_7_0_2=objNull}; 
if(isNil"ind_7_0_3")then{ind_7_0_3=objNull}; if(isNil"ind_7_0_4")then{ind_7_0_4=objNull};

if(isNil"ind_8_0_1")then{ind_8_0_1=objNull}; if(isNil"ind_8_0_2")then{ind_8_0_2=objNull}; 
if(isNil"ind_8_0_3")then{ind_8_0_3=objNull};

if(isNil"ind_9_0_1")then{ind_9_0_1=objNull}; if(isNil"ind_9_0_2")then{ind_9_0_2=objNull};

if(isNil"ind_10_1_1")then{ind_10_1_1=objNull}; if(isNil"ind_10_1_2")then{ind_10_1_2=objNull};

if(isNil"ind_11_1_1")then{ind_11_1_1=objNull}; if(isNil"ind_11_1_2")then{ind_11_1_2=objNull}; 
if(isNil"ind_11_1_3")then{ind_11_1_3=objNull};

if(isNil"ind_12_1_1")then{ind_12_1_1=objNull}; if(isNil"ind_12_1_2")then{ind_12_1_2=objNull}; 
if(isNil"ind_12_1_3")then{ind_12_1_3=objNull}; if(isNil"ind_12_1_4")then{ind_12_1_4=objNull};

if(isNil"ind_13_1_1")then{ind_13_1_1=objNull}; if(isNil"ind_13_1_2")then{ind_13_1_2=objNull}; 
if(isNil"ind_13_1_3")then{ind_13_1_3=objNull}; if(isNil"ind_13_1_4")then{ind_13_1_4=objNull};
if(isNil"ind_13_1_5")then{ind_13_1_5=objNull};

if(isNil"ind_14_2_1")then{ind_14_2_1=objNull}; if(isNil"ind_14_2_2")then{ind_14_2_2=objNull};
if(isNil"ind_14_2_1")then{ind_14_2_1=objNull}; if(isNil"ind_14_2_2")then{ind_14_2_2=objNull};

// ============================================================================
//          Initializes all possible groups whether they exist or not.         |
// ============================================================================

if(isNil"blu_0_0")then{blu_0_0=grpNull}; 
if(isNil"blu_1_0")then{blu_1_0=grpNull}; if(isNil"blu_1_1")then{blu_1_1=grpNull}; if(isNil"blu_1_2")then{blu_1_2=grpNull};
if(isNil"blu_2_0")then{blu_2_0=grpNull}; if(isNil"blu_2_1")then{blu_2_1=grpNull}; if(isNil"blu_2_2")then{blu_2_2=grpNull};
if(isNil"blu_3_0")then{blu_3_0=grpNull}; if(isNil"blu_3_1")then{blu_3_1=grpNull}; if(isNil"blu_3_2")then{blu_3_2=grpNull};
if(isNil"blu_4_0")then{blu_4_0=grpNull}; if(isNil"blu_4_1")then{blu_4_1=grpNull}; if(isNil"blu_4_2")then{blu_4_2=grpNull};

if(isNil"blu_5_0")then{blu_0_0=grpNull}; if(isNil"blu_6_0")then{blu_6_0=grpNull}; if(isNil"blu_7_0")then{blu_7_0=grpNull};
if(isNil"blu_8_0")then{blu_8_0=grpNull}; if(isNil"blu_9_0")then{blu_9_0=grpNull}; if(isNil"blu_10_1")then{blu_10_1=grpNull};
if(isNil"blu_11_1")then{blu_11_1=grpNull}; if(isNil"blu_12_1")then{blu_12_1=grpNull}; if(isNil"blu_13_1")then{blu_13_1=grpNull};
if(isNil"blu_14_1")then{blu_14_1=grpNull}; if(isNil"blu_14_2")then{blu_14_2=grpNull};

if(isNil"op_0_0")then{op_0_0=grpNull}; 
if(isNil"op_1_0")then{op_1_0=grpNull}; if(isNil"op_1_1")then{op_1_1=grpNull}; if(isNil"op_1_2")then{op_1_2=grpNull};
if(isNil"op_2_0")then{op_2_0=grpNull}; if(isNil"op_2_1")then{op_2_1=grpNull}; if(isNil"op_2_2")then{op_2_2=grpNull};
if(isNil"op_3_0")then{op_3_0=grpNull}; if(isNil"op_3_1")then{op_3_1=grpNull}; if(isNil"op_3_2")then{op_3_2=grpNull};
if(isNil"op_4_0")then{op_4_0=grpNull}; if(isNil"op_4_1")then{op_4_1=grpNull}; if(isNil"op_4_2")then{op_4_2=grpNull};

if(isNil"op_5_0")then{op_0_0=grpNull}; if(isNil"op_6_0")then{op_6_0=grpNull}; if(isNil"op_7_0")then{op_7_0=grpNull};
if(isNil"op_8_0")then{op_8_0=grpNull}; if(isNil"op_9_0")then{op_9_0=grpNull}; if(isNil"op_10_1")then{op_10_1=grpNull};
if(isNil"op_11_1")then{op_11_1=grpNull}; if(isNil"op_12_1")then{op_12_1=grpNull}; if(isNil"op_13_1")then{op_13_1=grpNull};
if(isNil"op_14_1")then{op_14_1=grpNull}; if(isNil"op_14_2")then{op_14_2=grpNull};

if(isNil"ind_0_0")then{ind_0_0=grpNull}; 
if(isNil"ind_1_0")then{ind_1_0=grpNull}; if(isNil"ind_1_1")then{ind_1_1=grpNull}; if(isNil"ind_1_2")then{ind_1_2=grpNull};
if(isNil"ind_2_0")then{ind_2_0=grpNull}; if(isNil"ind_2_1")then{ind_2_1=grpNull}; if(isNil"ind_2_2")then{ind_2_2=grpNull};
if(isNil"ind_3_0")then{ind_3_0=grpNull}; if(isNil"ind_3_1")then{ind_3_1=grpNull}; if(isNil"ind_3_2")then{ind_3_2=grpNull};
if(isNil"ind_4_0")then{ind_4_0=grpNull}; if(isNil"ind_4_1")then{ind_4_1=grpNull}; if(isNil"ind_4_2")then{ind_4_2=grpNull};

if(isNil"ind_5_0")then{ind_0_0=grpNull}; if(isNil"ind_6_0")then{ind_6_0=grpNull}; if(isNil"ind_7_0")then{ind_7_0=grpNull};
if(isNil"ind_8_0")then{ind_8_0=grpNull}; if(isNil"ind_9_0")then{ind_9_0=grpNull}; if(isNil"ind_10_1")then{ind_10_1=grpNull};
if(isNil"ind_11_1")then{ind_11_1=grpNull}; if(isNil"ind_12_1")then{ind_12_1=grpNull}; if(isNil"ind_13_1")then{ind_13_1=grpNull};
if(isNil"ind_14_1")then{ind_14_1=grpNull}; if(isNil"ind_14_2")then{ind_14_2=grpNull};

// =============================================================================