
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
publicVariable "mission_time_accel";

// =============================================================================

_center = createCenter sideLogic;
_group = createGroup _center;

_module = _group createUnit ["ModuleTimeMultiplier_F", [0,0,0],[],0.5,"NONE"];
_module setVariable ["TimeMultiplier", mission_time_accel];