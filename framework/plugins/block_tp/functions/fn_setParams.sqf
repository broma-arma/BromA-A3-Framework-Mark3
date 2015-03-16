
// =============================================================================
//  Allow third person parameters
// =============================================================================

switch (param_allow_tp_veh) do {
    case 0: { mission_allow_tp_veh = "disabled" };
    case 1: { mission_allow_tp_veh = "everyone" };
    case 2: { mission_allow_tp_veh = "drivers" };
};
publicVariable "mission_allow_tp_veh";

// =============================================================================