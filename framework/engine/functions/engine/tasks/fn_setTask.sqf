_task = _this select 0;
_state = _this select 1;

if (!(([_task] call BIS_fnc_taskState) == _state)) then {
    [[_task, _state, true],"BIS_fnc_taskSetState",nil,true] spawn BIS_fnc_MP;
};