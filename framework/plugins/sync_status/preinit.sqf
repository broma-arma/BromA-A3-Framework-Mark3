_path = _this select 0;

if (isServer) then {
    mission_player_status = [];
};

BRM_fnc_postStatus = compile preprocessFileLineNumbers (_path+"fn_postStatus.sqf");
BRM_fnc_setStatus = compile preprocessFileLineNumbers (_path+"fn_setStatus.sqf");