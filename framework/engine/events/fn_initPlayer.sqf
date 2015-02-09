if (!hasInterface) exitWith {};
waitUntil{(!isNil "paramsDone")};

_initialized = player getVariable ["unit_initialized",false];

if (_initialized) exitWith {};

private["_faction","_role"];

_initUnit = player getVariable ["unitInit", ["white", "NONE", "NOTHING", "Empty", "grpNull"]];
_aliasAUTO = ["*","AUTO","ANY"];
_aliasNONE = ["-","NONE"];

_groupColor = _initUnit select 0;
_faction = _initUnit select 1;
_role = _initUnit select 2;
_groupName = _initUnit select 3;

player_is_jip = (time > 10);

[] spawn BRM_fnc_syncTime;

player setVariable ["unit_side", (side player), true];

switch (true) do {
    case (_faction == "side_a"): { _faction = side_a_faction };
    case (_faction == "side_b"): { _faction = side_b_faction };
    case (_faction == "side_c"): { _faction = side_c_faction };
};

if (toUpper(_faction) in _aliasAUTO) then {
    switch (true) do {
        case (side player == side_a_side): { _faction = side_a_faction };
        case (side player == side_b_side): { _faction = side_b_faction };
        case (side player == side_c_side): { _faction = side_c_faction };
        default { _faction = "default" };
    };
};

if (toUpper(_role) in _aliasAUTO) then {
    _role = getText (configfile >> "CfgVehicles" >> typeOf player >> "displayName");
};

if (player_is_jip) then {
    [player, _groupName, _role] call BRM_fnc_setAlias;
};

if ((!(_faction in _aliasNONE)) && !units_player_useVanillaGear) then {
    [player, _faction, _role] call BRM_fnc_assignLoadout;
};

if (!mission_allow_jip && player_is_jip) exitWith {
    [player] spawn BRM_fnc_removeJIP;
};

if ("agm_plugin" in usedPlugins) then {
    switch (_role) do {
        case "medic": { _player setVariable ["AGM_IsMedic", true, true] };
        case "pilot": { _player setVariable ["AGM_GForceCoef", 0.75, true] };
        case "engineer": { _player setVariable ["AGM_IsEOD", true, true] };
    };
};

player addEventHandler ["Respawn", BRM_fnc_onPlayerRespawn];
player addEventHandler ["Killed", BRM_fnc_onPlayerKilled];
["onDisconn", "onPlayerDisconnected", { [_uid,_name] call BRM_fnc_onPlayerHasDisconnected }] call BIS_fnc_addStackedEventhandler;

[player, _role, toUpper(_groupColor)] spawn {
    _player = _this select 0;
    _role = _this select 1;
    _color = _this select 2;

    sleep 10;

    waitUntil{ (_player) assignTeam (_color) };
};

player setVariable ["unit_initialized", true, true];