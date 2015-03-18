/*
================================================================================

NAME:
    BRM_fnc_setTask
    
AUTHOR(s):
    Nife

DESCRIPTION:
    Sets a Task's state over the network.

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
    [[_task, _state, true],"BIS_fnc_taskSetState",nil,true] spawn BIS_fnc_MP;
};