/*
================================================================================

NAME:
    BRM_fnc_initPlayer

AUTHOR(s):
    Nife

DESCRIPTION:
    Function called by the player to initialize itself.

PARAMETERS:
    None. All parameters are taken from the unit's "unitInit" object variable.

USAGE:
    [] call BRM_fnc_initPlayer

RETURNS:
    Nothing.

================================================================================
*/

// Waits until initialization is safe. =========================================

if (!hasInterface) exitWith {};
finishMissionInit;
waitUntil {(player == player)};
waitUntil{!(isNull player)};
waitUntil{!(isNil "mission_params_read")};

_playerLog = format ["INITIALIZING PLAYER '%1' (%2)", name player, player];

["LOCAL", "F_LOG", _playerLog] call BRM_fnc_doLog;
["SERVER", "F_LOG", _playerLog] call BRM_fnc_doLog;

// Assigns JIP status. =========================================================

player_is_jip = (time > 0.1);

player_is_spectator = player getVariable ["is_spectator", false];

if (!mission_allow_jip && player_is_jip) exitWith {
    [player] spawn BRM_fnc_removeJIP;
    player setVariable ["unit_initialized", true, true];
};

["LOCAL", "F_LOG", format ["JIP STATUS: %1 | TIME: %2", player_is_jip, time]] call BRM_fnc_doLog;

// Synchronize time with the server. ===========================================

[] spawn BRM_fnc_syncTime;

// Removes spectators from the game. ===========================================

if (player_is_spectator) exitWith { [player] call BRM_fnc_initSpectator };

// Checks if player hasn't already been initialized. ===========================

_initialized = player getVariable ["unit_initialized",false];

if (_initialized) exitWith {};

private["_faction","_role"];

// Reads player's init line. ===================================================

_initUnit = player getVariable ["unitInit", ["white", "*", "*", "*", "*"]];
_aliasAUTO = ["*","AUTO","ANY"];
_aliasNONE = ["-","NONE","VANILLA"];

_groupColor = _initUnit select 0;
_faction = _initUnit select 1;
_role = _initUnit select 2;
_groupName = _initUnit select 3;

// Adds player to relevant lists and registers its original side. ==============

player setVariable ["unit_side", (side player), true];

switch (true) do {
    case (side player == side_a_side): { if !(player in mission_players_A) then { mission_players_A pushBack player; publicVariable "mission_players_A" } };
    case (side player == side_b_side): { if !(player in mission_players_B) then { mission_players_B pushBack player; publicVariable "mission_players_B" } };
    case (side player == side_c_side): { if !(player in mission_players_C) then { mission_players_C pushBack player; publicVariable "mission_players_C" } };
};

// Reads player faction and assigns the unit loadout. ==========================

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

if ((!(_faction in _aliasNONE)) && (!units_player_useVanillaGear)) then {
    [player, _faction, _role] call BRM_fnc_assignLoadout;
};

// Assigns alias to other units and groups. ====================================

if (player_is_jip) then {
    [player, _groupName, _role] call BRM_fnc_setAlias;
};

// Initializes score related variables. ========================================

_score = 0;

{ if ((_x select 0) == name player) then { _score = (_x select 2) } } forEach mission_unit_score;

player setVariable ["unit_score", player getVariable ["unit_score", _score]];
player setVariable ["unit_deaths", player getVariable ["unit_deaths",0]];

// Assigns AGM related variables. ==============================================

if (mission_AGM_enabled) then {
    switch (_role) do {
        case "medic": { player setVariable ["AGM_IsMedic", true, true] };
        case "pilot": { player setVariable ["AGM_GForceCoef", 0.75, true] };
        case "engineer": { player setVariable ["AGM_IsEOD", true, true] };
    };
};

// Adds Event Handlers with pre-configured functions. ==========================

player addEventHandler ["Respawn", BRM_fnc_onPlayerRespawn];
player addEventHandler ["Hit", {(_this select 0)setVariable["last_damage",(_this select 1)]}];
player addEventHandler ["Killed", BRM_fnc_onPlayerKilled];

// Changes the player's assigned color within its group. =======================

[player, _role, toUpper(_groupColor)] spawn {
    _player = _this select 0;
    _role = _this select 1;
    _color = _this select 2;

    sleep 5;

    [-1, { (_this select 0) assignTeam (_this select 1)}, [_player, _color]] call CBA_fnc_globalExecute;
};

// Disables object recognition to save performance. ============================

if (mission_game_mode == "tvt") then { disableRemoteSensors true };

// Finishes initialization sequence. ===========================================

["LOCAL", "F_LOG", "PLAYER INITIALIZED"] call BRM_fnc_doLog;

player setVariable ["unit_initialized", true, true];