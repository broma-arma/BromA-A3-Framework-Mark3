// =============================================================================
//  Respawn protection duration parameters
// =============================================================================

switch (param_spawn_protection_time) do {
    case 0: { mission_spawn_protection_time = 1 };
    case 1: { mission_spawn_protection_time = 1*60 };
    case 2: { mission_spawn_protection_time = 15*60 };
    case 3: { mission_spawn_protection_time = 30*60 };
    case 4: { mission_spawn_protection_time = 999999999999 };
};

// =============================================================================