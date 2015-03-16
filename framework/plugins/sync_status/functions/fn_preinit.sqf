if (isServer) then {
    mission_player_status = [];
    
    addMissionEventHandler ["HandleDisconnect", BRM_SyncStatus_fnc_postStatus];
};