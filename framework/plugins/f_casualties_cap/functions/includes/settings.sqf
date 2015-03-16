// ============================================================================
//                            == CASUALTY CAP ==                               |

//          Whenever a percentage of the selected group(s) is dead,            |
//                       a certain ending is called.                           |
//        http://ferstaberinde.com/f2/en/index.php?title=Casualties_Cap        |
// ============================================================================

    if (isNil "casualty_group_a") then { casualty_group_a = "[blu_1_0, blu_1_1, blu_1_2, blu_2_0, blu_2_1, blu_2_2, blu_3_0, blu_3_1, blu_3_2, blu_4_0, blu_4_1, blu_4_2]" };
    // Casualty groups for the first side.
    
    if (isNil "casualty_group_b") then { casualty_group_b = "[op_1_0, op_1_1, op_1_2, op_2_0, op_2_1, op_2_2, op_3_0, op_3_1, op_3_2, op_4_0, op_4_1, op_4_2]" };
    // Casualty group for the second side.

    if (isNil "casualty_group_c") then { casualty_group_c = "[ind_1_0, ind_1_1, ind_1_2, ind_2_0, ind_2_1, ind_2_2, ind_3_0, ind_3_1, ind_3_2, ind_4_0, ind_4_1, ind_4_2]" };
    // Casualty group for the third side.
    
// =============================================================================