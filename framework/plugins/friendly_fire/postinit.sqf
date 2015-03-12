_path = _this select 0;

BRM_fnc_friendlyFire = compile preprocessFileLineNumbers (_path+"fn_friendlyFire.sqf");

player addEventHandler ["Hit", BRM_fnc_friendlyFire];

player addEventHandler ["Killed", BRM_fnc_friendlyFire];