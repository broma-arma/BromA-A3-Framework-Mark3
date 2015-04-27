/*
================================================================================

NAME:
    BRM_fnc_newTask
    
AUTHOR(s):
    Nife

DESCRIPTION:
    Adds a new task.

PARAMETERS:
    0 - Assignees: who will the task be assigned to. (SIDE/GROUP/UNIT)
    1 - The ID of the task. (STRING)
    2 - The details of the task. (ARRAY)
        0 - Task title. (STRING)
        1 - Description. (STRING)
    3 - Conditions. (ARRAY)
        0 - Condition for assignment. (STRING, but must evaluate to BOOLEAN)
        1 - Condition for completion. (STRING, but must evaluate to BOOLEAN)
        2 - Condition for failure. (STRING, but must evaluate to BOOLEAN)
    4 - Task priority. (NUMBER)
        0: Task will be declared "OPTIONAL" and is irrelevant to the mission.
        1: Similar to "OPTIONAL", but they behave as the middle ground,
        without failing the mission and not being essential to win.
        2: Essential tasks, which cannot be failed and must be completed.
    5 - Task event callback. (ARRAY)
        0 - Code executed when the task is assigned to the players. (STRING, but must evaluate to CODE)
        1 - Code executed whenever the mission is completed. (STRING, but must evaluate to CODE)
        2 - Code executed whenever the mission fails.
    
USAGE:
    [
        side_a_side,
        "newTaskVIPKill", 
        ["Kill the VIP.", 
        "We need to make sure he doesn't spills the beans."],
        ["(true)","!(alive VIP)", "(VIPhasEscaped)"],
        1,
        ["","goodVariable = true","hint 'Oops, something bad is going to happen!"]
    ] spawn BRM_fnc_newTask;
    
RETURNS:
    Nothing.

================================================================================
*/

_side = _this select 0;
_id = _this select 1;
_details = _this select 2;
_cond = _this select 3;
_priority = _this select 4;
_callback = _this select 5;

_assign = _cond select 0;
_wincond = _cond select 1;
_losecond = "false";

tasks_callbacks pushBack [_id, _callback];

call compile format ["waitUntil{%1}", _assign];

call compile (_callback select 0);

if (count _cond > 2) then {
    _losecond = _cond select 2;
};

switch (_priority) do {
    case 0: { _details set [0, format ["(OPTIONAL) %1", (_details select 0)]]; };
    case 2: { _details set [0, format ["(!) %1", (_details select 0)]]; }
};

_ndetails = [];
_ndetails set [0, _details select 1];
_ndetails set [1, _details select 0];
_ndetails set [2, ""];

[_side, _id, _ndetails, nil, false, 0, true] call BIS_fnc_taskCreate;

if (typeName _side == "OBJECT") then { _side = side _side };

switch (true) do {
    case (_side == side_a_side): {
        tasks_a pushBack [_id, _wincond, _losecond]; publicVariable "tasks_a";
        switch (_priority) do {
            case 1: { tasks_secondary_a pushBack _id; publicVariable "tasks_secondary_a" };
            case 2: { tasks_primary_a pushBack _id; publicVariable "tasks_primary_a" };
        };
    };
    case (_side == side_b_side): {
        tasks_b pushBack [_id, _wincond, _losecond]; publicVariable "tasks_b";
        switch (_priority) do {
            case 1: { tasks_secondary_b pushBack _id; publicVariable "tasks_secondary_b" };
            case 2: { tasks_primary_b pushBack _id; publicVariable "tasks_primary_b" };
        };
    };
    case (_side == side_c_side): {
        tasks_c pushBack [_id, _wincond, _losecond]; publicVariable "tasks_c";
        switch (_priority) do {
            case 1: { tasks_secondary_c pushBack _id; publicVariable "tasks_secondary_c" };
            case 2: { tasks_primary_c pushBack _id; publicVariable "tasks_primary_c" };
        };
    };
}; 