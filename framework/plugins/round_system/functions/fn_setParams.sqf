if (!(isNil "BRM_FMK_Round_System_fnc_setParams")) then {
    [
        ["p_round_params", 3] call BIS_fnc_getParamValue,
        ["p_round_time_limit", 15] call BIS_fnc_getParamValue
    ]
    call BRM_FMK_Round_System_fnc_setParams;
};