
// =============================================================================
//  Time Acceleration parameters
// =============================================================================

switch (param_time_accel) do {
    case 0: { mission_time_accel = 0 };
    case 1: { mission_time_accel = 1 };
    case 2: { mission_time_accel = 2 };
    case 3: { mission_time_accel = 5 };
    case 4: { mission_time_accel = 10 };
    case 5: { mission_time_accel = 100 };
};

// =============================================================================