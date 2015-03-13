
if (hasInterface) then {
    
    sleep 3;

    #include "settings.sqf"        
    
    _checkCond = true;
    
    status_post_antispam = false;
    
    if ("respawn_system" in usedPlugins) then {
        _checkCond = ((!isNil"player_current_lives")&&(player_current_lives > 0));
    };
    
    if (player_is_jip) then {
        [] spawn BRM_fnc_setStatus;
        sleep 3;
    };
    
    _checkCond spawn {
        _vehicle = vehicle player;
        while {(_this)} do {
            if (vehicle player != _vehicle) then {
                [] spawn BRM_fnc_postStatus;
                _vehicle = vehicle player;
            };
            sleep 1;
        };
    };
    
    player addEventHandler ["Hit", { [] spawn BRM_fnc_postStatus; sleep 1; status_post_antispam = true }];
    player addEventHandler ["Killed", {[] spawn BRM_fnc_postStatus; sleep 1; status_post_antispam = true }];
        
    while {(_checkCond)} do {
        [] spawn BRM_fnc_postStatus;
        sleep send_status_timer;
    };
};