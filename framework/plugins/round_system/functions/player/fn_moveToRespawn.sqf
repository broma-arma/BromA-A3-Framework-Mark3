
if (!hasInterface) exitWith {};

private ["_spawn"];

switch (side player) do {
    case side_a_side: { _spawn = respawn_markers_A };
    case side_b_side: { _spawn = respawn_markers_B };
    case side_c_side: { _spawn = respawn_markers_C };
};

_spawn = _spawn call BIS_fnc_selectRandom;
_pos = getMarkerPos _spawn;
_deviation = round_setup_size;

_randomN1 = [(_deviation)*-1,_deviation] call BIS_fnc_randomNum;
_randomN2 = [(_deviation)*-1,_deviation] call BIS_fnc_randomNum;

player setPos [(_pos select 0) + _randomN1, (_pos select 1) + _randomN2, 0];

_spawn