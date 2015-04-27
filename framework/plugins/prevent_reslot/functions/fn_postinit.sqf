
if (isServer) then {
    mission_player_slots = [];
    publicVariable "mission_player_slots";
};

0 spawn {
    
["LOCAL", "F_LOG", "LOADED SLOT PREVENTION PLUGIN"] call BRM_fnc_doLog;

#include "includes\settings.sqf"

sleep 1;

if (hasInterface) then {
    
    if (player_is_spectator) exitWith {};
    
    _index = -1;
    
    _takenIndex = 0;

    { 
        if ((_x select 0) == (getPlayerUID player)) then { _index = _forEachIndex };
        if (((_x select 1) == str player) && ((_x select 0) != (getPlayerUID player))) exitWith { _index = -2; _takenIndex = _forEachIndex };
    } forEach mission_player_slots;

    switch (_index) do {
        case -1: {
            player setVariable ["unit_valid_slot", true, true];
            sleep mission_preventreslot_timer;

            ["Alert",["Your slot has been locked for the remainder of the mission."]] call BIS_fnc_showNotification;

            [0, {
                 _index = (count mission_player_slots);

                 { if ((_x select 0) == (_this select 0)) then { _index = _forEachIndex } } forEach mission_player_slots;

                 mission_player_slots set [_index, _this];
                 publicVariable "mission_player_slots";
            }, [getplayerUID player, str player, name player, player getVariable "rosterAlias"]] call CBA_fnc_globalExecute;      
        };
        case -2: {
            _unitName = (mission_player_slots select _takenIndex) select 2;
            player setVariable ["unit_valid_slot", false, true];
            player enableSimulation false;
            closeDialog 0;
            sleep 5;
            ["LOCAL", "F_LOG", "ENDING MISSION - RESLOTTED AS TAKEN SLOT"] call BRM_fnc_doLog;
            titleText [ format ["The slot you're trying to join as is currently taken by %1 - please select a different one.", _unitName], "BLACK FADED"];
            ["LOCAL", "CHAT", format ["The slot you're trying to join as is currently taken by %1 - please select a different one.", _unitName]] call BRM_fnc_doLog;
            sleep 10;
            findDisplay 46 closeDisplay 0;        
        };
        default {
            _unit = (mission_player_slots select _index) select 1;
            _unitName = (mission_player_slots select _index) select 3;
            _match = (str player == _unit);

            if (!_match) then {
                player setVariable ["unit_valid_slot", false, true];
                player enableSimulation false;
                closeDialog 0;
                sleep 5;
                ["LOCAL", "F_LOG", "ENDING MISSION - RESLOTTED AS A DIFFERENT UNIT"] call BRM_fnc_doLog;
                ["LOCAL", "CHAT", format ["You are choosing a different slot from your original one. Please reslot as %1.", _unitName]] call BRM_fnc_doLog;
                titleText [ format ["You are choosing a different slot from your original one.\n\nPlease reslot as %1.", _unitName], "BLACK FADED"];
                sleep 10;
                findDisplay 46 closeDisplay 0;
            };        
        };
    };
};
};