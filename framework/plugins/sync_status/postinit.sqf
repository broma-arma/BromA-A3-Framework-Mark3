
if (hasInterface) then {
    waitUntil{!(isNull player)};
    
    sleep 3;
    
    if (player_is_jip) then { [] spawn BRM_fnc_setStatus };

    0 spawn {
        player setVariable ["player_current_vehicle", (vehicle player), true];
        player setVariable ["player_current_gear", [player] call BRM_fnc_getGear, true];
        while {(alive player)} do {
            player setVariable ["player_current_gear", [player] call BRM_fnc_getGear, true];
            _vehicle = player getVariable "player_current_vehicle";
            if (((vehicle player) != _vehicle)) then {
                player setVariable ["player_current_vehicle", (vehicle player), true];
            };
            sleep 1;
        };
    };
};