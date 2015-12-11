
// =============================================================================
//  Amount of rounds needed to win
// =============================================================================

switch (param_round_sys_rounds) do {
    case 0: { BRM_round_system_rounds_needed = 1 };
    case 1: { BRM_round_system_rounds_needed = 2 };
    case 2: { BRM_round_system_rounds_needed = 3 };
    case 3: { BRM_round_system_rounds_needed = 4 };
    case 4: { BRM_round_system_rounds_needed = 5 };
};

// =============================================================================
//  Time Limit per round
// =============================================================================

switch (param_round_sys_time_limit) do {
    case 0: { BRM_round_system_time_limit = 60*1 };
    case 1: { BRM_round_system_time_limit = 60*5 };
    case 2: { BRM_round_system_time_limit = 60*15 };
    case 3: { BRM_round_system_time_limit = 60*30 };
    case 4: { BRM_round_system_time_limit = 60*60 };
    case 5: { BRM_round_system_time_limit = 999999999*60 };
};

// =============================================================================