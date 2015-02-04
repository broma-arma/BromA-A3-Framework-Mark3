private["_gear"];
_unit = _this select 0;

if ("agm_plugin" in usedPlugins) then {
    _gear = [_unit] call AGM_Respawn_fnc_getAllGear;
};

sleep 1;

removeVest _unit;
removeHeadgear _unit;
removeBackpack _unit;
removeGoggles _unit;
removeUniform _unit;
removeAllItems _unit;
removeAllWeapons _unit;

_oldgrp = group _unit;

[_unit] joinSilent grpnull;

_unit setPos [0,0,10];

player enablesimulation false;
player allowDamage false;

player setVariable ["isDead", true, true];

if ("cssa3_spectator" in usedPlugins) then {
    ["forced"] spawn CSSA3_fnc_createSpectateDialog;
};

sleep 5;

_unit unlinkItem "ItemRadio";
_unit removeItem "ItemRadio";

waitUntil{!([getPlayerUID _unit, name _unit] in mission_dead_players)};

titletext ["You are respawning...", "BLACK FADED",0];

closeDialog 0;

player enablesimulation true;
player allowDamage true;

player setVariable ["isDead", false, true];

if ("agm_plugin" in usedPlugins) then {
    [_unit, _gear] call AGM_Respawn_fnc_restoreGear;
};

[_unit] joinSilent _oldgrp;

_respawn = [_unit] call BRM_fnc_getSpawnPoint;

_unit setPos getMarkerPos _respawn;