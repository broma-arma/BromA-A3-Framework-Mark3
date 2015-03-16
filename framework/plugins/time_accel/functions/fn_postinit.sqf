if (!isServer) exitWith {};

0 spawn {
    sleep 1;
    
    _center = createCenter sideLogic;
    _group = createGroup _center;

    _module = _group createUnit ["ModuleTimeMultiplier_F", [0,0,0],[],0.5,"NONE"];
    _module setVariable ["TimeMultiplier", mission_time_accel];
};