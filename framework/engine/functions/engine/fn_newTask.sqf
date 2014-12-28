_side = _this select 0;
_id = _this select 1;
_details = _this select 2;
_cond = _this select 3;
_mandatory = _this select 4;

_wincond = _cond select 0;
_losecond = "false";

if (count _cond > 1) then { 
    _losecond = _cond select 1;
};

_ndetails = [];
_ndetails set [0, _details select 1];
_ndetails set [1, _details select 0];
_ndetails set [2, ""];

[[_side, _id, _ndetails, nil, false, 0, true],"BIS_fnc_taskCreate",nil,true] call BIS_fnc_MP;

if (not _mandatory) then {
    _details set [1, format ["(OPTIONAL) %1", (_details select 1)]];
} else {
    switch(true) do {
        case (_side == sideA_Side): {
            mandatoryObjectivesA set [count mandatoryObjectivesA, [_id, _wincond, _losecond]]; publicVariable "mandatoryObjectivesA";
        };
        case (_side == sideB_Side): {
            mandatoryObjectivesB set [count mandatoryObjectivesB, [_id, _wincond, _losecond]]; publicVariable "mandatoryObjectivesB";
        };
        case (_side == sideC_Side): {
            mandatoryObjectivesC set [count mandatoryObjectivesC, [_id, _wincond, _losecond]]; publicVariable "mandatoryObjectivesC";
        };
    };
};