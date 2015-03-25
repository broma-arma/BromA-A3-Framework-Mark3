if (isServer) then {
    mission_player_status = [];
    
    addMissionEventHandler ["HandleDisconnect", BRM_SyncStatus_fnc_postStatus];
};

time_to_broadcast = 10;

0 spawn {
    if (hasInterface) then {

        sleep 3;

        if (player_is_jip) then {
            player allowDamage false;
            [] spawn BRM_SyncStatus_fnc_setStatus; 
            sleep 3;
            player allowDamage true;
        };

        player setVariable ["player_current_vehicle", (vehicle player), true];
        player setVariable ["player_current_unit", str player, true];
        
        while {(alive player)} do {
            _vehicle = player getVariable "player_current_vehicle";
            if (((vehicle player) != _vehicle)) then {
                player setVariable ["player_current_vehicle", (vehicle player), true];
            };
            sleep time_to_broadcast;
        };
    };
};