// =============================================================================
//  Allow third person parameters
// =============================================================================

waitUntil {(mission_params_read)};

switch (param_allow_tp_veh) do {
    case 0: { mission_allow_tp_veh = "disabled" };
    case 1: { mission_allow_tp_veh = "everyone" };
    case 2: { mission_allow_tp_veh = "drivers" };
};
publicVariable "mission_allow_tp_veh";

// =============================================================================

if (difficultyEnabled "3rdPersonView") then {
    while {(mission_allow_tp_veh != "everyone")} do {
        _veh = (vehicle player);
        _inVeh = (_veh != player);
        _isTP = (cameraView == "EXTERNAL");
        _isDriving = (((player == commander _veh) || (player == driver _veh)) && (_inVeh));

        if (_isTP) then {
            if (mission_allow_tp_veh == "disabled") then {
                _veh switchCamera "INTERNAL";
            } else {
                if (!(_isDriving)) then {
                    _veh switchCamera "INTERNAL";
                };
            };
        };
        sleep 0.01;
    };
};