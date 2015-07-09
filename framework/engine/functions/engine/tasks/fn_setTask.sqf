/*
================================================================================

NAME:
    BRM_fnc_setTask
    
AUTHOR(s):
    Nife

DESCRIPTION:
    Sets a task's state over the network.

PARAMETERS:
    0 - Task ID (STRING)
    1 - Desired state (STRING)
    
USAGE:
    ["myTaskID", "FAILED"] call BRM_fnc_setTask
    
RETURNS:
    Nothing.

================================================================================
*/

_task = _this select 0;
_state = _this select 1;

if (!(([_task] call BIS_fnc_taskState) == _state)) then {
    [_task, _state, true] call BIS_fnc_taskSetState;
    
    _index = -1;
    
    { if (_task == (_x select 0)) exitWith { _index = _forEachIndex } } forEach tasks_callbacks;
    
    if (_index > -1) then {
        switch (toUpper(_state)) do {
            case "SUCCEEDED": { call compile (((tasks_callbacks select _index) select 1) select 1) };
            case "FAILED": { call compile (((tasks_callbacks select _index) select 1) select 2) };
            case "CANCELED": { call compile (((tasks_callbacks select _index) select 1) select 2) };
        };
    };
};
