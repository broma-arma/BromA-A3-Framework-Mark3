_defaultValues = ["white", "blufor", "rifleman"];

_gearInit = player getVariable ["initUnit", _defaultValues];

_groupColor = _gearInit select 0;
_faction = _gearInit select 1;
_role = _gearInit select 2;

[player, toUpper(_groupColor)] spawn { waitUntil{(!isNull(_this select 0))}; (_this select 0) assignTeam (_this select 1) };

[player, _faction, _role] call BRM_fnc_assignLoadout;

currentLives = [player] spawn BRM_fnc_getLives;

player addEventHandler ["Respawn", {[_this] call BRM_fnc_onRespawn}];
player addEventHandler ["Killed", {[_this] call BRM_fnc_onKilled}];