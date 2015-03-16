if !(hasInterface) exitWith {};

player addEventHandler ["Hit", BRM_FriendlyFire_fnc_alert];

player addEventHandler ["Killed", BRM_FriendlyFire_fnc_alert];