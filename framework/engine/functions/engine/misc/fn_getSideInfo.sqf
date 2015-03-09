
private ["_ret","_side"];

_side = _this select 0;
_info = _this select 1;

switch (true) do {
    case (_side == side_a_side): { _side = "side_a" + "_" + _info };
    case (_side == side_b_side): { _side = "side_b" + "_" + _info };
    case (_side == side_c_side): { _side = "side_c" + "_" + _info };
    default { _side = "civ" };
};

call compile format ["_ret = %1", _side];

_ret