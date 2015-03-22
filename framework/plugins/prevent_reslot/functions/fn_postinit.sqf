
if (isServer) then {
    mission_player_slots = [];
    publicVariable "mission_player_slots";
};

0 spawn {
    
["LOCAL", "F_LOG", "LOADED SLOT PREVENTION PLUGIN"] call BRM_fnc_doLog;

#include "includes\settings.sqf"

sleep 3;

if (hasInterface) then {
    
    _index = -1;

    { 
        if ((_x select 0) == (getPlayerUID player)) then { _index = _forEachIndex };
        if (((_x select 1) == str player) && ((_x select 0) != (getPlayerUID player))) exitWith { _index = -2 };
    } forEach mission_player_slots;

    switch (_index) do {
        case -1: {
            sleep mission_preventreslot_timer;

            ["Alert",["Your slot has been locked for the remainder of the mission."]] call bis_fnc_showNotification;

            [0, {
                 _index = (count mission_player_slots);

                 { if ((_x select 0) == (_this select 0)) then { _index = _forEachIndex } } forEach mission_player_slots;

                 mission_player_slots set [_index, _this];
                 publicVariable "mission_player_slots";
            }, [getplayerUID player, str player, name player]] call CBA_fnc_globalExecute;      
        };
        case -2: {
            player enableSimulation false;
            closeDialog 0;
            sleep 3;
            ["LOCAL", "F_LOG", "ENDING MISSION - RESLOTTED AS TAKEN SLOT"] call BRM_fnc_doLog;
            titleText [ "The slot you're trying to join as is currently taken - please select a different one.", "BLACK FADED"];
            sleep 10;
            findDisplay 46 closeDisplay 0;        
        };
        default {
            _unit = (mission_player_slots select _index) select 1;        
            _match = (str player == _unit);

            if (!_match) then {
                player enableSimulation false;
                closeDialog 0;
                sleep 3;
                ["LOCAL", "F_LOG", "ENDING MISSION - RESLOTTED AS A DIFFERENT UNIT"] call BRM_fnc_doLog;
                titleText [ format ["You are choosing a different slot from your original one.\nPlease reslot as %1.", _unit], "BLACK FADED"];
                sleep 10;
                findDisplay 46 closeDisplay 0;
            };        
        };
    };
};
};