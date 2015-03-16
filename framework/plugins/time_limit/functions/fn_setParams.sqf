// =============================================================================
//  Time limit parameter
// =============================================================================

switch (param_time_limit) do {
    case 0: { mission_time_limit = -1 };
    case 1: { mission_time_limit = 10800 };
    case 2: { mission_time_limit = 7200 };
    case 3: { mission_time_limit = 3600 };
    case 4: { mission_time_limit = 2700 };
    case 5: { mission_time_limit = 1800 };
    case 6: { mission_time_limit = 900 };
    case 7: { mission_time_limit = 600 };
    case 8: { mission_time_limit = 65 };
};

// =============================================================================