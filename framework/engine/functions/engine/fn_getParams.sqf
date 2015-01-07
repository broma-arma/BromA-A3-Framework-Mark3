0 spawn {
    if (!isServer) exitWith {};
    waitUntil{(!isNil "paramsArray")};
    _paramArray = paramsArray;
    {
        _paramName = (configName ((missionConfigFile >> "Params") select _forEachIndex));
        _paramValue = (_paramArray select _forEachIndex);
        _paramCode = ( getText (missionConfigFile >> "Params" >> _paramName >> "code"));
        _code = format[_paramCode, _paramValue];
        call compile _code;
        if (isServer) then {
            publicVariable _paramName;
        };
    } foreach _paramArray;    
    
    switch (revive_time) do {
        case 0: { revive_time_param = 10 };
        case 1: { revive_time_param = 120 };
        case 2: { revive_time_param = 300 };
        case 3: { revive_time_param = 600 };
    };
    publicVariable "revive_time_param";
    
    paramsDone = true; publicVariable "paramsDone";
};