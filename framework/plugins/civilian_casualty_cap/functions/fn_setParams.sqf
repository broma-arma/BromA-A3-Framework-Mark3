// =============================================================================
//  Civilian casualty cap parameter
// =============================================================================

switch (param_dead_civies) do {
    case 0: { mission_dead_civilian_limit = -1 };
    case 1: { mission_dead_civilian_limit = 5 };
    case 2: { mission_dead_civilian_limit = 15 };
    case 3: { mission_dead_civilian_limit = 30 };
};

// =============================================================================