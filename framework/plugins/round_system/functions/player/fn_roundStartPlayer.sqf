
if (!hasInterface) exitWith {};

hint "";

[player, toLower(str(player getVariable ["unit_side",(side player)]))] call BRM_fnc_assignLoadout;

player setDamage 0;

if (mission_ACE3_enabled) then { [player] spawn BRM_ACE3_fnc_ACE_RevivePlayer };

_respawn = [] call BRM_Round_System_fnc_moveToRespawn;

[_respawn, round_setup_size, round_seconds_between, [side player, "side"] call BRM_fnc_getSideInfo] spawn BRM_Round_System_fnc_setupZone;

player allowDamage true;

["Alert",[format ["ROUND %1 IS ABOUT TO START!", match_current_round]]] call BIS_fnc_showNotification;