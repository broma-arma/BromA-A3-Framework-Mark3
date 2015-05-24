
if (isServer) then {
    mission_player_status = [];
    
    addMissionEventHandler ["HandleDisconnect", BRM_SyncStatus_fnc_postStatus];
};

0 spawn {
    if (hasInterface) then {
        
        if (player_is_spectator) exitWith {};

        sleep 3;

        if (player_is_jip) then {
            waitUntil{!(isNil "mission_player_status")};
            player allowDamage false;            
            [] spawn BRM_SyncStatus_fnc_setStatus;
            sleep 3;
            player allowDamage true;
        };
    };
};