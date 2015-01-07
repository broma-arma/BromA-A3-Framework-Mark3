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
    paramsDone = true; publicVariable "paramsDone";
};

mandatoryObjectivesA = [];
mandatoryObjectivesB = [];
mandatoryObjectivesC = [];

// =============================================================================
//          Initializes all possible groups whether they exist or not.
// =============================================================================
if (isNil"alpha_grp_blu1") then {alpha_grp_blu1 = grpNull}; if (isNil"alpha_grp_blu2") then {alpha_grp_blu2 = grpNull};
if (isNil"bravo_grp_blu1") then {bravo_grp_blu1 = grpNull}; if (isNil"bravo_grp_blu2") then {bravo_grp_blu2 = grpNull};
if (isNil"charlie_grp_blu1") then {charlie_grp_blu1 = grpNull}; if (isNil"charlie_grp_blu2") then {charlie_grp_blu2 = grpNull};
if (isNil"delta_grp_blu1") then {delta_grp_blu1 = grpNull}; if (isNil"delta_grp_blu2") then {delta_grp_blu2 = grpNull};

if (isNil"alpha_grp_op1") then {alpha_grp_op1 = grpNull}; if (isNil"alpha_grp_op2") then {alpha_grp_op2 = grpNull};
if (isNil"bravo_grp_op1") then {bravo_grp_op1 = grpNull}; if (isNil"bravo_grp_op2") then {bravo_grp_op2 = grpNull};
if (isNil"charlie_grp_op1") then {charlie_grp_op1 = grpNull}; if (isNil"charlie_grp_op2") then {charlie_grp_op2 = grpNull};
if (isNil"delta_grp_op1") then {delta_grp_op1 = grpNull}; if (isNil"delta_grp_op2") then {delta_grp_op2 = grpNull};

if (isNil"alpha_grp_ind1") then {alpha_grp_ind1 = grpNull}; if (isNil"alpha_grp_ind2") then {alpha_grp_ind2 = grpNull};
if (isNil"bravo_grp_ind1") then {bravo_grp_ind1 = grpNull}; if (isNil"bravo_grp_ind2") then {bravo_grp_ind2 = grpNull};
if (isNil"charlie_grp_ind1") then {charlie_grp_ind1 = grpNull}; if (isNil"charlie_grp_ind2") then {charlie_grp_ind2 = grpNull};
if (isNil"delta_grp_ind1") then {delta_grp_ind1 = grpNull}; if (isNil"delta_grp_ind2") then {delta_grp_ind2 = grpNull};
// =============================================================================