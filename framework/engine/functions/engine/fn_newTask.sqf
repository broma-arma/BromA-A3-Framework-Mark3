_side = _this select 0;
_id = _this select 1;
_details = _this select 2;
_mandatory = _this select 3;

if (!_mandatory) then {
    _details set [1, format ["(OPTIONAL) %1", (_details select 1)]];
};

[[_side, _id, _details, nil, false, 0, true],"BIS_fnc_taskCreate",nil,true] call BIS_fnc_MP;

if (_mandatory) then {
    switch(true) do {
        case (_side == sideA_Side): {
            mandatoryObjectivesA set [count mandatoryObjectivesA, _id]; publicVariable "mandatoryObjectivesA";
        };
        case (_side == sideB_Side): {
            mandatoryObjectivesB set [count mandatoryObjectivesB, _id]; publicVariable "mandatoryObjectivesB";
        };
        case (_side == sideC_Side): {
            mandatoryObjectivesC set [count mandatoryObjectivesC, _id]; publicVariable "mandatoryObjectivesC";
        };
    };
};