/*
================================================================================

NAME:
    BRM_fnc_initAI

AUTHOR(s):
    Nife

DESCRIPTION:
    Initializes an AI unit with their loadout and environment variables.

PARAMETERS:
    0 - Target unit. (OBJECT)
    1 - Faction the unit belongs to. (STRING)

USAGE:
    [aiUnit, "SLA"] call BRM_fnc_initAI;
    [this, "RACS"] call BRM_fnc_initAI;

RETURNS:
    Nothing.

================================================================================
*/

_unit = _this select 0;
_faction = _this select 1;

if !(_unit isKindOf "CAManBase") exitWith {};

// Check if the unit already hasn't been initialized. ==========================

_initialized = _unit getVariable ["unit_initialized", false];

if (!_initialized) then {

    // Determines the unit's faction. ==========================================

    _unit setVariable ["unit_side", (side _unit), true];

    switch (true) do {
        case (_faction == "side_a"): { _faction = side_a_faction };
        case (_faction == "side_b"): { _faction = side_b_faction };
        case (_faction == "side_c"): { _faction = side_c_faction };
    };

    if (toUpper(_faction) == "AUTO") then {
        _faction = [(side _unit), "FACTION"] call BRM_fnc_getSideInfo;
    };

    if (typeName _faction != "STRING") then { _faction = str _faction };

    // Assigns the Unit's loadout depending on mission settings. ===============

    if (!(_faction == "VANILLA") && !units_AI_useVanillaGear) then {
        [_unit, _faction] call BRM_fnc_assignLoadout;
    };

    // Adds the relevant Event Handlers. =======================================

    _unit addEventHandler ["Hit", BRM_fnc_setHitFace];
    _unit addEventHandler ["Hit", {(_this select 0)setVariable["last_damage",(_this select 1)]}];
    _unit addEventHandler ["Killed", BRM_fnc_onAIKilled];

    // Adds the Civilian Casualty Cap EHs. =====================================

    if (("civilian_casualty_cap" in usedPlugins)) then {
        if ((mission_dead_civilian_limit > -1)&&(side _unit == civilian)) then {
            waitUntil{(!isNil"fnc_civFiredWeapon")&&(!isNil"fnc_countCivDeaths")};

            _unit addEventHandler ["fired", fnc_civFiredWeapon];
            _unit addMPEventHandler ["mpkilled", fnc_countCivDeaths];
        };
    };

    // Finishes loading. =======================================================

    _unit setVariable ["unit_initialized", true, true];
};