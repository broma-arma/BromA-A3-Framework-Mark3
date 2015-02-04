
#include "settings.sqf"

locked_sides = [];

{
    if (!(side _x in locked_sides)) then {
        locked_sides pushBack (side _x);
    };
} forEach co_lock_units;

if (!((side player in locked_sides))) exitWith {};

if (player in co_lock_units) then {
    
    player addAction ["<t color='#FF0000'>Start the mission.</t>", {
        
        locked_sides = locked_sides - [side player]; publicVariable "locked_sides";
        [-1, {
            removeBulletsEH = 0;

            if (_this == side player) then {
                ["Alert",["The commander declares the mission as go!"]] call bis_fnc_showNotification;
                player removeEventHandler ["Fired", removeBulletsEH];
            };
        }, side player] call CBA_fnc_globalExecute;
        
    }, nil, 0.5, true, true,"'", "(player in co_lock_units)&&(side player in locked_sides)"];
} else {
    player spawn {
        while {(side player in locked_sides)} do {

            if ( typeof vehicle player != typeof _this ) then {
                player action ["getout", vehicle player];
                hint "Please wait until the commander clears the mission to begin.";
            };
            sleep 0.5;
        };
    };

    removeBulletsEH = player addEventHandler ["Fired", { deleteVehicle (_this select 6) }];
};