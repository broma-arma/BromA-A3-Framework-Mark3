if (isNil "lockFree") then { lockFree = false };

if (lockFree) exitWith {};

#include "settings.sqf"

if (player in co_lock_units) then {
    removeBulletsEH = 0;
    
    freePlayers = {
        ["Alert",["The commander declares the mission as go!"]] call bis_fnc_showNotification;
        player removeEventHandler ["Fired", removeBulletsEH];
        lockFree = true; 
        publicVariable "lockFree";
    };
    publicVariable "freePlayers";
    
    player addAction ["<t color='#FF0000'>Start the mission.</t>", { [[],"freePlayers",false,true] spawn BIS_fnc_MP; },nil,0.5,true,true,"'", "(player in co_lock_units)&&!lockFree" ];
} else {
    player spawn {
        while {!(lockFree)} do {

            if ( typeof vehicle player != typeof _this) then {
                player action ["getout", vehicle player];
                hint "Please wait until the commander clears the mission to begin.";
            };        
            sleep 0.5;
        };
    };

    removeBulletsEH = player addEventHandler ["Fired", { deleteVehicle (_this select 6) }];
};