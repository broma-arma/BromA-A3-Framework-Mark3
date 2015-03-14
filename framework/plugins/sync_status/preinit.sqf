
_path = _this select 0;

BRM_fnc_postStatus = compile preprocessFileLineNumbers (_path+"fn_postStatus.sqf");
BRM_fnc_setStatus = compile preprocessFileLineNumbers (_path+"fn_setStatus.sqf");
BRM_fnc_moveToVehicle = compile preprocessFileLineNumbers (_path+"fn_moveToVehicle.sqf");
BRM_fnc_getGear = compile preprocessFileLineNumbers (_path+"fn_getGear.sqf");
BRM_fnc_setGear = compile preprocessFileLineNumbers (_path+"fn_setGear.sqf");

if (isServer) then {
    mission_player_status = [];
    
    addMissionEventHandler ["HandleDisconnect", BRM_fnc_postStatus];
};