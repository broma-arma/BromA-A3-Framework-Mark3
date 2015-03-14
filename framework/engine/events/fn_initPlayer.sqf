if (!hasInterface) exitWith {};
waitUntil{!(isNull player)};
waitUntil{(!isNil "paramsDone")};

["LOCAL", "F_LOG", format ["INITIALIZING PLAYER '%1' (%2)", name player, player]] call BRM_fnc_doLog;

_initialized = player getVariable ["unit_initialized",false];

if (_initialized) exitWith {};

private["_faction","_role"];

_initUnit = player getVariable ["unitInit", ["white", "*", "*", "*", "*"]];
_aliasAUTO = ["*","AUTO","ANY"];
_aliasNONE = ["-","NONE","VANILLA"];

_groupColor = _initUnit select 0;
_faction = _initUnit select 1;
_role = _initUnit select 2;
_groupName = _initUnit select 3;

player_is_jip = (time > 0.1);

["LOCAL", "F_LOG", format ["JIP STATUS: %1 | TIME: %2", player_is_jip, time]] call BRM_fnc_doLog;

[] spawn BRM_fnc_syncTime;

player setVariable ["unit_side", (side player), true];

switch (true) do {
    case (side player == side_a_side): { if !(player in mission_players_A) then { mission_players_A pushBack player; publicVariable "mission_players_A" } };
    case (side player == side_b_side): { if !(player in mission_players_B) then { mission_players_B pushBack player; publicVariable "mission_players_B" } };
    case (side player == side_c_side): { if !(player in mission_players_C) then { mission_players_C pushBack player; publicVariable "mission_players_C" } };
};

switch (true) do {
    case (_faction == "side_a"): { _faction = side_a_faction };
    case (_faction == "side_b"): { _faction = side_b_faction };
    case (_faction == "side_c"): { _faction = side_c_faction };
};

if (toUpper(_faction) in _aliasAUTO) then {
    _faction = [(side player), "faction"] call BRM_fnc_getSideInfo;
};

if (toUpper(_role) in _aliasAUTO) then {
    _role = getText (configfile >> "CfgVehicles" >> typeOf player >> "displayName");
};

if (player_is_jip) then {
    [player, _groupName, _role] call BRM_fnc_setAlias;
};

if ((!(_faction in _aliasNONE)) && (!units_player_useVanillaGear)) then {
    [player, _faction, _role] call BRM_fnc_assignLoadout;
};

if (!mission_allow_jip && player_is_jip) exitWith {
    [player] spawn BRM_fnc_removeJIP;
};

_score = 0;

{ if ((_x select 0) == name player) then { _score = (_x select 2) } } forEach mission_unit_score;

player setVariable ["unit_score", player getVariable ["unit_score", _score]];
player setVariable ["unit_deaths", player getVariable ["unit_deaths",0]];

if ("agm_plugin" in usedPlugins) then {
    switch (_role) do {
        case "medic": { player setVariable ["AGM_IsMedic", true, true] };
        case "pilot": { player setVariable ["AGM_GForceCoef", 0.75, true] };
        case "engineer": { player setVariable ["AGM_IsEOD", true, true] };
    };
};

player addEventHandler ["Respawn", BRM_fnc_onPlayerRespawn];
player addEventHandler ["Killed", BRM_fnc_onPlayerKilled];
["onDisconn", "onPlayerDisconnected", { [_uid,_name] call BRM_fnc_onPlayerHasDisconnected }] call BIS_fnc_addStackedEventhandler;

[player, _role, toUpper(_groupColor)] spawn {
    _player = _this select 0;
    _role = _this select 1;
    _color = _this select 2;

    sleep 5;

    [-1, { (_this select 0) assignTeam (_this select 1)}, [_player, _color]] call CBA_fnc_globalExecute;
};

["LOCAL", "F_LOG", "PLAYER INITIALIZED"] call BRM_fnc_doLog;

player setVariable ["unit_initialized", true, true];