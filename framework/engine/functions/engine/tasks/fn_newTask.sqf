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
    4 - Mandatory for victory: failure means failure to the rest of the mission.
    (BOOLEAN)
    
USAGE:
    [
        side_a_side,
        "newTaskVIPKill", 
        ["Kill the VIP.", 
        "We need to make sure he doesn't spills the beans."],
        ["(true)","!(alive VIP)", "(VIPhasEscaped)"],
        true
    ] spawn BRM_fnc_newTask;
    
RETURNS:
    Nothing.

================================================================================
*/

_side = _this select 0;
_id = _this select 1;
_details = _this select 2;
_cond = _this select 3;

_mandatory = _this select 4;

_assign = _cond select 0;
_wincond = _cond select 1;
_losecond = "false";

call compile format ["waitUntil{%1}", _assign];

if (count _cond > 2) then {
    _losecond = _cond select 2;
};

if (not _mandatory) then {
    _details set [0, format ["(OPTIONAL) %1", (_details select 0)]];
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
        if (_mandatory) then {
        tasks_mandatory_a pushBack _id; publicVariable "tasks_mandatory_a";
        };
    };
    case (_side == side_b_side): {
        tasks_b pushBack [_id, _wincond, _losecond]; publicVariable "tasks_b";
        if (_mandatory) then {
        tasks_mandatory_b pushBack _id; publicVariable "tasks_mandatory_b";
        };
    };
    case (_side == side_c_side): {
        tasks_c pushBack [_id, _wincond, _losecond]; publicVariable "tasks_c";
        if (_mandatory) then {
        tasks_mandatory_c pushBack _id; publicVariable "tasks_mandatory_c";
        };
    };
}; 