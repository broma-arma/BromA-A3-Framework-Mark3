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

[[_side, _id, _ndetails, nil, false, 0, true],"BIS_fnc_taskCreate",nil,true] call BIS_fnc_MP;

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