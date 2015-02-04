_unit = _this select 0;
_faction = _this select 1;

_initialized = _unit getVariable ["unit_initialized", false];
if (_initialized) exitWith {};

_unit setVariable ["unit_side", side _unit, true];

if (toUpper(_faction) == "AUTO") then {
    switch (side _unit) do {
        case WEST: { _faction = "BLUFOR" };
        case EAST: { _faction = "OPFOR" };
        case RESISTANCE: { _faction = "INDFOR" };
        case CIVILIAN: { _faction = "CIVILIAN" };
        default { _faction = "CIVILIAN" };
    };
};

[_unit, _faction] call BRM_fnc_assignLoadout;

_unit addEventHandler ["Killed", BRM_fnc_onAIKilled];

_unit setVariable ["unit_initialized", true, true];