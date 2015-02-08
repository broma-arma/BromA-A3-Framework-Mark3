_unit = _this select 0;

_side = _unit getVariable ["unit_side", CIVILIAN];

switch (_side) do {
    case WEST: { mission_dead_west = mission_dead_west + 1; publicVariable "mission_dead_west" };
    case EAST: { mission_dead_east = mission_dead_east + 1; publicVariable "mission_dead_east" };
    case RESISTANCE: { mission_dead_independent = mission_dead_independent + 1; publicVariable "mission_dead_independent" };
    case CIVILIAN: { mission_dead_civilian = mission_dead_civilian + 1; publicVariable "mission_dead_civilian" };
};

switch (true) do {
    case (_side == side_a_side): { mission_dead_side_A = mission_dead_side_A + 1 };
    case (_side == side_b_side): { mission_dead_side_B = mission_dead_side_B + 1 };
    case (_side == side_c_side): { mission_dead_side_C = mission_dead_side_C + 1 };
};