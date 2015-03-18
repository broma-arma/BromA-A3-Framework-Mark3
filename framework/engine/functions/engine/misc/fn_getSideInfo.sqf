/*
================================================================================

NAME:
    BRM_fnc_getSideInfo
    
AUTHOR(s):
    Nife

DESCRIPTION:
    Returns the relevant information about any side.

PARAMETERS:
    0 - Side whose information should be returned. (SIDE)
    1 - The type of information. (STRING)
    
USAGE:
    [west, "callsigns"] call BRM_fnc_getSideInfo;
    [east, "name"] call BRM_fnc_getSideInfo;
    [resistance, "faction"] call BRM_fnc_getSideInfo;
    
RETURNS:
    The requested information. (ANY)

================================================================================
*/


private ["_ret","_side"];

_side = _this select 0;
_info = _this select 1;

if (_side == civilian) then {
    _ret = "CIVILIAN";
} else {
    switch (true) do {
        case (_side == side_a_side): { _side = "side_a" + "_" + _info };
        case (_side == side_b_side): { _side = "side_b" + "_" + _info };
        case (_side == side_c_side): { _side = "side_c" + "_" + _info };
    };    
        
    call compile format ["_ret = %1", _side];
};

_ret