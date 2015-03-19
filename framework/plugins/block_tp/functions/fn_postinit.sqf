
if (difficultyEnabled "3rdPersonView") then {
    0 spawn {
        #include "includes\settings.sqf"
            
        while {((mission_allow_tp_veh != "everyone")&&!(player in tp_allowed_units))} do {
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
};