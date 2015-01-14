#include "settings.sqf"

lockFree = false;

if (player in co_lock_units) then {
    removeBulletsEH = 0;
    
    freePlayers = {
        hint "The commander declares mission as go!";
        player removeEventHandler ["Fired", removeBulletsEH];
        lockFree = true; 
        publicVariable "lockFree";
    };
    publicVariable "freePlayers";
            
    player addAction ["<t color='#FF0000'>Start the mission.</t>", { [[],"freePlayers",true,true] spawn BIS_fnc_MP; },nil,0.5,true,true,"'", "(player in co_lock_units)&&!lockFree" ];
} else {
    player spawn {
        while {(true)} do {
            if (lockFree) exitWith {};

            if (vehicle player != _this) then {
                player action ["getout", vehicle player];
                hint "Please wait until the commander clears the mission to begin.";
            };        
            sleep 0.5;
        };
    };

    removeBulletsEH = player addEventHandler ["Fired", { deleteVehicle (_this select 6) }];
};