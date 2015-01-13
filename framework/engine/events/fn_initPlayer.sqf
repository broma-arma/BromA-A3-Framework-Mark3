_defaultValues = ["white", "blufor", "rifleman"];

_initUnit = player getVariable ["initUnit", _defaultValues];

_groupColor = _initUnit select 0;
_faction = _initUnit select 1;
_role = _initUnit select 2;
_groupName = _initUnit select 3;
_groupID = _initUnit select 4;

(group player) setGroupId [_groupName];
call compile format ["%1 = group player; publicVariable '%1'", _groupID];

[player, _faction, _role] call BRM_fnc_assignLoadout;

if ("agm_plugin" in usedPlugins) then {
    switch (_role) do {
        case "medic": { player setVariable ["AGM_IsMedic", true, true] };
        case "pilot": { player setVariable ["AGM_GForceCoef", 0.75, true] };
        case "engineer": { player setVariable ["AGM_IsEOD", true, true] };
    };
};

player addEventHandler ["Respawn", {[_this] call BRM_fnc_onRespawn}];
player addEventHandler ["Killed", {[_this] call BRM_fnc_onKilled}];

[player, toUpper(_groupColor)] spawn { sleep 10; waitUntil{(!isNull(_this select 0))}; (_this select 0) assignTeam (_this select 1) };