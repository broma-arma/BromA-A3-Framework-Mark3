// =============================================================================
//  Mission setup time parameter
// =============================================================================

switch (param_setup_time) do {
    case 0: { mission_setup_time = 15 };
    case 1: { mission_setup_time = 60*1 };
    case 2: { mission_setup_time = 60*3 };
    case 3: { mission_setup_time = 60*5 };
    case 4: { mission_setup_time = 60*10 };
};

// =============================================================================