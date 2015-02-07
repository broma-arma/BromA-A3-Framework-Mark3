_unit = _this select 0;
if ("respawn_system" in usedPlugins) then {
    waitUntil{!isNil "BRM_fnc_killPlayer"};
    titletext ["This mission does not allow for joining in progress. \n\n You will be sent to spectator mode.", "BLACK FADED",0];
    sleep 5;
    [_unit] call BRM_fnc_killPlayer;
} else {
    _unit setdamage 1;
};