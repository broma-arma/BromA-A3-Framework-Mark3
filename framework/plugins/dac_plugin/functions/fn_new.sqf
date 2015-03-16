if (!mission_AI_controller) exitWith {};

sleep 0.5;

private["_id","_units","_side","_skill","_faction","_arg1","_arg1size","_arg2","_arg2size","_arg3","_arg3size","_arg4","_arg4size"];

_trigger = _this select 0;
_pos = getPos _trigger;
_area = triggerArea _trigger;
_string = _this select 1;
_output = [];
_units = [[],[],[],[]];

#include "includes\dictionary.sqf"

_string = toLower(_string);

_string = [_string, ",", ""] call CBA_fnc_replace;
_string = [_string, ".", ""] call CBA_fnc_replace;
_string = [_string, "!", ""] call CBA_fnc_replace;

_arguments = [_string, " "] call CBA_fnc_split;
_arguments = _arguments - _ignoredWords;

_command = _arguments select 0;

switch (_command) do {
    case "create": {
        _status = _arguments select 1;
        _skill = _arguments select 2;
        _faction = _arguments select 3;        
        _side = _arguments select 4;
        _kind = _arguments select 5;
        _name = _arguments select 6;

        switch (true) do {
            case (_name in _aliasRANDOM): { _id = floor(random(99999)); _name = "DAC_zone_" + str(_id) };
            default { _id = floor(random(99999)) };
        };

        switch (true) do {
            case (_side in _aliasOPFOR): { _side = 0 };
            case (_side in _aliasBLUFOR): { _side = 1 };
            case (_side in _aliasRESISTANCE): { _side = 2 };
            case (_side in _aliasCIVILIAN): { _side = 3 };
            case (_side == "side_a"): { _side = ["SIDE", side_a_side] call BRM_DAC_fnc_getDACStat };
            case (_side == "friendly"): { _side = ["SIDE", side_a_side] call BRM_DAC_fnc_getDACStat };    
            case (_side == "side_b"): { _side = ["SIDE", side_b_side] call BRM_DAC_fnc_getDACStat };
            case (_side == "enemy"): { _side = ["SIDE", side_b_side] call BRM_DAC_fnc_getDACStat };    
            case (_side == "side_c"): { _side = ["SIDE", side_c_side] call BRM_DAC_fnc_getDACStat };
        };
        
        _skill = ["SKILL", _skill] call BRM_DAC_fnc_getDACStat;
        
        switch (true) do {
            case (_faction == "default"): { _faction = 1 };
            case (_faction == "vanilla"): { _faction = 2 };
            case (_faction == "side_a"): { _faction = [side_a_side, "FACTION"] call BRM_fnc_getSideInfo };
            case (_faction == "side_b"): { _faction = [side_b_side, "FACTION"] call BRM_fnc_getSideInfo };
            case (_faction == "side_c"): { _faction = [side_c_side, "FACTION"] call BRM_fnc_getSideInfo };
            case (_faction in _aliasBLUFOR): { _faction = [west, "FACTION"] call BRM_fnc_getSideInfo };
            case (_faction in _aliasOPFOR): { _faction = [east, "FACTION"] call BRM_fnc_getSideInfo };
            case (_faction in _aliasRESISTANCE): { _faction = [resistance, "FACTION"] call BRM_fnc_getSideInfo };
            default {
                _faction = ["FACTION", _faction] call BRM_DAC_fnc_getDACStat;
            };
        };

        if ((_kind == "camp") || (_kind == "camps")) then {
            _status = parseNumber _status;
        } else {
            switch (_status) do {
                case "activated": { _status = 0 };
                case "deactivated": { _status = 1 };
                case "automatic": {
                    _status = 1;
                    _ax = (_area select 0)*5;
                    _ay = (_area select 1)*5;
                    _aa = _area select 2;
                    _as = _area select 3;

                    _markerColor = "ColorBlue";

                    switch (_side) do {
                        case 1: { "ColorRed" };
                        case 0: { "ColorBlue" };
                        case 2: { "ColorGreen" };
                        case 3: { "ColorPurple" };
                    };

                    _activationcond = "this && (time > 3) && ({ ((_x isKindOf 'LandVehicle') || (_x isKindOf 'CAManBase') && (isPlayer _x) ) } count thislist) > 0";

                    _mynewMarker = ["local", _pos, "ELLIPSE", "Solid", _markerColor, [_ax, _ay], _aa, 0.5] spawn BRM_fnc_newMarkerArea;

                    _trg = createTrigger ["EmptyDetector", _pos];
                    _trg setTriggerArea [_ax, _ay, _aa, _as];
                    _trg setTriggerActivation ["ANY", "PRESENT", true];
                    _trg setTriggerStatements [_activationcond, "["+ (_name) +"] call DAC_Activate", "["+ (_name) +"] call DAC_Deactivate"];
                };
                default { _status = 0 };
            };
        };

        switch (true) do {
            case (_kind == "zone"): {
                _arg1size = _arguments select 7;
                _arg1 = _arguments select 8;

                switch (true) do {
                    case (_arg1 in _aliasINFANTRY): { _units set [0, ([_arg1size] call BRM_DAC_fnc_scaleUnits)] };
                    case (_arg1 in _aliasVEHICLES): { _units set [1, ([_arg1size] call BRM_DAC_fnc_scaleUnits)] };
                    case (_arg1 in _aliasTANKS): { _units set [2, ([_arg1size] call BRM_DAC_fnc_scaleUnits)] };
                    case (_arg1 in _aliasAIRCRAFTS): { _units set [3, ([_arg1size] call BRM_DAC_fnc_scaleUnits)] };
                };

                if ( count _arguments >= 11 ) then {    
                    _arg2 = toLower(_arguments select 10);
                    _arg2size = toLower(_arguments select 9);

                    switch (true) do {
                        case (_arg2 in _aliasINFANTRY): { _units set [0, ([_arg2size] call BRM_DAC_fnc_scaleUnits)] };
                        case (_arg2 in _aliasVEHICLES): { _units set [1, ([_arg2size] call BRM_DAC_fnc_scaleUnits)] };
                        case (_arg2 in _aliasTANKS): { _units set [2, ([_arg2size] call BRM_DAC_fnc_scaleUnits)] };
                        case (_arg2 in _aliasAIRCRAFTS): { _units set [3, ([_arg2size] call BRM_DAC_fnc_scaleUnits)] };
                    };
                };

                if ( count _arguments >= 13 ) then {
                    _arg3 = toLower(_arguments select 12);
                    _arg3size = toLower(_arguments select 11);

                    switch (true) do {
                        case (_arg3 in _aliasINFANTRY): { _units set [0, ([_arg3size] call BRM_DAC_fnc_scaleUnits)] };
                        case (_arg3 in _aliasVEHICLES): { _units set [1, ([_arg3size] call BRM_DAC_fnc_scaleUnits)] };
                        case (_arg3 in _aliasTANKS): { _units set [2, ([_arg3size] call BRM_DAC_fnc_scaleUnits)] };
                        case (_arg3 in _aliasAIRCRAFTS): { _units set [3, ([_arg3size] call BRM_DAC_fnc_scaleUnits)] };
                    };
                };

                if (count _arguments >= 15 ) then {
                    _arg4 = toLower(_arguments select 14);
                    _arg4size = toLower(_arguments select 13);

                    switch (true) do {
                        case (_arg4 in _aliasINFANTRY): { _units set [0, ([_arg4size] call BRM_DAC_fnc_scaleUnits)] };
                        case (_arg4 in _aliasVEHICLES): { _units set [1, ([_arg4size] call BRM_DAC_fnc_scaleUnits)] };
                        case (_arg4 in _aliasTANKS): { _units set [2, ([_arg4size] call BRM_DAC_fnc_scaleUnits)] };
                        case (_arg4 in _aliasAIRCRAFTS): { _units set [3, ([_arg4size] call BRM_DAC_fnc_scaleUnits)] };
                    };    
                };

                [_name, _id, _status, _faction, _units select 0, _units select 1, _units select 2, _units select 3, _side, _skill, _area, _pos] spawn BRM_DAC_fnc_createDACZone;
            };
            case ((_kind == "camp") || (_kind == "camps")): {
                _respawns = parseNumber (_arguments select 7);                
                _units = _arguments select 8;
                
                _reinforce = [];
                
                { if (_forEachIndex >= 9) then { _reinforce pushBack _x } } forEach _arguments;
                
                _newString = "";
                
                if (count _reinforce > 0) then {
                    { 
                        _punct = ",";
                        if (_forEachIndex >= (count _reinforce)-1) then { _punct = "" };
                        _newString = _newString + _x + _punct;
                    } forEach _reinforce;
                };
                
                _reinforce = _newString;
                
                switch (true) do {
                    case (_units in _aliasINFANTRY): { _units = 1 };
                    case (_units in _aliasVEHICLES): { _units = 2 };
                    case (_units in _aliasALL): { _units = 0 };
                };
                    
                [_name, _id, _status, _faction, _respawns, _units, _reinforce, _side, _skill, _area, _pos] spawn BRM_DAC_fnc_createDACCamp;
            };
        };
    };
};