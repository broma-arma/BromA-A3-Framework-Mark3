if (!hasInterface) exitWith {};
waitUntil{(!isNil "paramsDone")};

_initialized = player getVariable ["unit_initialized",false];

if (_initialized) exitWith {};

private["_faction","_role"];

_initUnit = player getVariable ["initUnit", ["white", "NONE", "NOTHING", "Empty", "grpNull"]];

_groupColor = _initUnit select 0;
_faction = _initUnit select 1;
_role = _initUnit select 2;
_groupName = _initUnit select 3;

player_is_jip = (time > 10);

[] spawn BRM_fnc_syncTime;

player setVariable ["unit_side", side player, true];

if (toUpper(_faction) == "AUTO") then {
    switch (side player) do {
        case WEST: { _faction = "BLUFOR" };
        case EAST: { _faction = "OPFOR" };
        case RESISTANCE: { _faction = "INDFOR" };
        case CIVILIAN: { _faction = "CIVILIAN" };
        default { _faction = "CIVILIAN" };
    };
};

if (toUpper(_role) == "AUTO") then {
    _role = getText (configfile >> "CfgVehicles" >> typeOf player >> "displayName");
};

if (!(_faction == "NONE")) then {
    [player, _faction, _role] call BRM_fnc_assignLoadout;
};

if (!mission_allow_jip && player_is_jip) exitWith {
    [] spawn {
        if ("respawn_system" in usedPlugins) then {
            waitUntil{!isNil "BRM_fnc_killPlayer"};
            titletext ["This mission does not allow for joining in progress. \n\n You will be sent to spectator mode.", "BLACK FADED",0];
            sleep 5;
            [player] call BRM_fnc_killPlayer;
        } else {
            player setdamage 1;
        };
    };
};

(group player) setGroupId [_groupName];

player addEventHandler ["Respawn", BRM_fnc_onPlayerRespawn];
player addEventHandler ["Killed", BRM_fnc_onPlayerKilled];
["onDisconn", "onPlayerDisconnected", { [_uid,_name] call BRM_fnc_onPlayerHasDisconnected }] call BIS_fnc_addStackedEventhandler;

[player, _role, toUpper(_groupColor)] spawn {
    _player = _this select 0;
    _role = _this select 1;
    _color = _this select 2;

    sleep 1;

    if ("agm_plugin" in usedPlugins) then {
        switch (_role) do {
            case "medic": { _player setVariable ["AGM_IsMedic", true, true] };
            case "pilot": { _player setVariable ["AGM_GForceCoef", 0.75, true] };
            case "engineer": { _player setVariable ["AGM_IsEOD", true, true] };
        };
    };

    sleep 10;

    waitUntil{ (_player) assignTeam (_color) };
};

player setVariable ["unit_initialized", true, true];