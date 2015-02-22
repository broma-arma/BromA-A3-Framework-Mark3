_unit = _this select 0;
_faction = _this select 1;

_initialized = _unit getVariable ["unit_initialized", false];
if (_initialized) exitWith {};

_unit setVariable ["unit_side", (side _unit), true];

switch (true) do {
    case (_faction == "side_a"): { _faction = side_a_faction };
    case (_faction == "side_b"): { _faction = side_b_faction };
    case (_faction == "side_c"): { _faction = side_c_faction };
};

if (toUpper(_faction) == "AUTO") then {
    switch (true) do {
        case (side _unit == side_a_side): { _faction = side_a_faction };
        case (side _unit == side_b_side): { _faction = side_b_faction };
        case (side _unit == side_c_side): { _faction = side_c_faction };
        default { _faction = "default" };
    };
};

if ((_faction != "CIVILIAN") && !units_AI_useVanillaGear) then {
    [_unit, _faction] call BRM_fnc_assignLoadout;
};

_unit addEventHandler ["Hit", BRM_fnc_setHitFace];
_unit addEventHandler ["Killed", BRM_fnc_onAIKilled];

if ("civilian_casualty_cap" in usedPlugins) then {
    waitUntil{ (!isNil"fnc_CivFiredWeapon")&&(!isNil"fnc_countCivDeaths") };
    
    if (side _unit == civilian) then {
      _unit addEventHandler ["fired", fnc_civFiredWeapon];
      _unit addMPEventHandler ["mpkilled", fnc_countCivDeaths];
    };
};

_unit setVariable ["unit_initialized", true, true];