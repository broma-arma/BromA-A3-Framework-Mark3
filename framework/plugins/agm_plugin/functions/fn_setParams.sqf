
// =============================================================================
//  AGM Revive Time
// =============================================================================

switch (param_revive_time) do {
    case 0: { mission_revive_time = 1 };
    case 1: { mission_revive_time = 120 };
    case 2: { mission_revive_time = 300 };
    case 3: { mission_revive_time = 600 };
    case 4: { mission_revive_time = -1 };
};

// =============================================================================