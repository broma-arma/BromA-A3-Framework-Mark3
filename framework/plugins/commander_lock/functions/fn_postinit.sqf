0 spawn {
#include "includes\settings.sqf"

call compile format ["co_lock_units = %1", co_lock_units];

if (co_lock_tvt_mode) then { co_lock_text_select = 1 } else { co_lock_text_select = 0 };

co_lock_text_start = ["Start the mission.", "Ready your side."];
co_lock_text_started = ["The commander declares the mission as go!", "All sides are ready - mission start."];
co_lock_text_wait = ["Please wait until the commander clears the mission to begin.", "Please wait until all teams are ready."];

co_lock_text_start = co_lock_text_start select co_lock_text_select;
co_lock_text_started = co_lock_text_started select co_lock_text_select;
co_lock_text_wait = co_lock_text_wait select co_lock_text_select;

if (isServer) then {
    locked_sides = [];
    co_lock_allSidesReady = false;
    publicVariable "co_lock_allSidesReady";

    {
        if ((!(side _x in locked_sides))&&!(str _x == "<NULL-object>")) then {
            locked_sides pushBack (side _x);
        };
    } forEach co_lock_units;
    publicVariable "locked_sides";
} else {
    waitUntil{(!isNil "locked_sides") && (!isNil "co_lock_allSidesReady")};
};

if ( (!(side player in locked_sides)) || !(hasInterface) ) exitWith {};

player_co_locked = true;

if (player in co_lock_units) then {
    
    alertColor = "Alert";
    _color = "#FF0000";
    switch (side player) do {
        case WEST: { alertColor = "AlertBLU"; _color = ["blue"] call BRM_fnc_colorToHex; };
        case EAST: { alertColor = "AlertOP"; _color = ["red"] call BRM_fnc_colorToHex; };
        case RESISTANCE: { alertColor = "AlertIND"; _color = ["green"] call BRM_fnc_colorToHex; };
    };         

    player addAction ["<t color='"+_color+"'>"+ co_lock_text_start + "</t>", {   
        
        locked_sides = locked_sides - [side player]; publicVariable "locked_sides";
        if (count locked_sides <= 0) then { co_lock_allSidesReady = true; publicVariable "co_lock_allSidesReady" };

        if (co_lock_tvt_mode) then {
            if (co_lock_allSidesReady) then {
                [-1, { ["Alert",[co_lock_text_started]] call bis_fnc_showNotification }] call CBA_fnc_globalExecute;
            } else {
                _sidename = [(side player), "name"] call BRM_fnc_getSideInfo;
                _msg = format ["%1 is ready to begin the mission.", _sidename];
                [-1, { [_this select 1,[_this select 0]] call bis_fnc_showNotification }, [_msg, alertColor]] call CBA_fnc_globalExecute;
            };
        } else {
            [-1, {
                if (_this == side player) then {
                    ["Alert",[co_lock_text_started]] call bis_fnc_showNotification;                    
                };
            }, side player] call CBA_fnc_globalExecute;        
        };

    }, nil, 0.5, true, true,"'", "(player in co_lock_units)&&(side player in locked_sides)"];

} else {
    if (((!co_lock_tvt_mode) && (side player in locked_sides)) || ((co_lock_tvt_mode) && (!co_lock_allSidesReady))) then {
        removeBulletsEH = player addEventHandler ["Fired", { deleteVehicle (_this select 6) }];
    };

    player spawn {
        while {((!co_lock_tvt_mode) && (side player in locked_sides)) || ((co_lock_tvt_mode) && (!co_lock_allSidesReady))} do {

            if ( typeof vehicle player != typeof _this ) then {
                player action ["getout", vehicle player];
                hint co_lock_text_wait;
            };
            sleep 0.5;
        };
        player_co_locked = false;
        player removeEventHandler ["Fired", removeBulletsEH];
    };
};
};