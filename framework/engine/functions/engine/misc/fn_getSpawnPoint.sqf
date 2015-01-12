private["_ret"];
_unit = _this select 0;

switch (side _unit) do {
    case WEST: { _ret = "respawn_west" };
    case EAST: { _ret = "respawn_east" };
    case RESISTANCE: { _ret = "respawn_resistance" };
    case CIVILIAN: { _ret = "respawn_civilian" };
};

_ret