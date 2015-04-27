
// =============================================================================
//  AGM Revive Time
// =============================================================================

switch (param_agm_revive_time) do {
    case 0: { mission_agm_revive_time = 1 };
    case 1: { mission_agm_revive_time = 120 };
    case 2: { mission_agm_revive_time = 300 };
    case 3: { mission_agm_revive_time = 600 };
    case 4: { mission_agm_revive_time = -1 };
};

// =============================================================================
//  AGM Enable Single-bandage
// =============================================================================

switch (param_agm_single_bandage) do {
    case 0: { mission_agm_single_bandage = true };
    case 1: { mission_agm_single_bandage = false };
};

// =============================================================================

// =============================================================================
//  AGM Prevent Instant Death
// =============================================================================

switch (param_agm_insta_death) do {
    case 0: { mission_agm_insta_death = true };
    case 1: { mission_agm_insta_death = false };
};

// =============================================================================