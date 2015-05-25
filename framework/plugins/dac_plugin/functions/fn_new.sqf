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
        _id = _arguments select 7;

        if (_name in _aliasRANDOM) then { _name = "DACZone" + str(floor(random(99999))) };

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
                
                if (_id in _aliasRANDOM) then {
                    _id = floor(random(999999));
                } else {
                    _id = parseNumber _id;
                };                    
                
                _argamount = _arguments select 8;
                _argtype = _arguments select 9;
                _arg = _arguments select 10;
                
                _argindex = 0;
                _argamount = parseNumber _argamount;
                
                switch (true) do {
                    case (_argtype in _aliasTIER1): { _argtype = 1 };
                    case (_argtype in _aliasTIER2): { _argtype = 2 };
                    case (_argtype in _aliasTIER3): { _argtype = 3 };
                    case (_argtype in _aliasTIER4): { _argtype = 4 };
                };

                switch (true) do {
                    case (_arg in _aliasINFANTRY): { _argindex = 0 };
                    case (_arg in _aliasVEHICLES): { _argindex = 1 };
                    case (_arg in _aliasTANKS): { _argindex = 2 };
                    case (_arg in _aliasAIRCRAFTS): { _argindex = 3 };
                };
                
                _units set [_argindex, [_argamount,_argtype,10,40]];

                if ( count _arguments >= 14 ) then {
                    _argamount = _arguments select 11;
                    _argtype = _arguments select 12;
                    _arg = _arguments select 13;

                    _argindex = 0;
                    _argamount = parseNumber _argamount;

                    switch (true) do {
                        case (_argtype in _aliasTIER1): { _argtype = 1 };
                        case (_argtype in _aliasTIER2): { _argtype = 2 };
                        case (_argtype in _aliasTIER3): { _argtype = 3 };
                        case (_argtype in _aliasTIER4): { _argtype = 4 };
                    };

                    switch (true) do {
                        case (_arg in _aliasINFANTRY): { _argindex = 0 };
                        case (_arg in _aliasVEHICLES): { _argindex = 1 };
                        case (_arg in _aliasTANKS): { _argindex = 2 };
                        case (_arg in _aliasAIRCRAFTS): { _argindex = 3 };
                    };

                    _units set [_argindex, [_argamount,_argtype,10,40]];
                };

                if ( count _arguments >= 17 ) then {
                    _argamount = _arguments select 14;
                    _argtype = _arguments select 15;
                    _arg = _arguments select 16;

                    _argindex = 0;
                    _argamount = parseNumber _argamount;

                    switch (true) do {
                        case (_argtype in _aliasTIER1): { _argtype = 1 };
                        case (_argtype in _aliasTIER2): { _argtype = 2 };
                        case (_argtype in _aliasTIER3): { _argtype = 3 };
                        case (_argtype in _aliasTIER4): { _argtype = 4 };
                    };

                    switch (true) do {
                        case (_arg in _aliasINFANTRY): { _argindex = 0 };
                        case (_arg in _aliasVEHICLES): { _argindex = 1 };
                        case (_arg in _aliasTANKS): { _argindex = 2 };
                        case (_arg in _aliasAIRCRAFTS): { _argindex = 3 };
                    };

                    _units set [_argindex, [_argamount,_argtype,10,40]];
                };

                if (count _arguments >= 20 ) then {
                    _argamount = _arguments select 17;
                    _argtype = _arguments select 18;
                    _arg = _arguments select 19;

                    _argindex = 0;
                    _argamount = parseNumber _argamount;

                    switch (true) do {
                        case (_argtype in _aliasTIER1): { _argtype = 1 };
                        case (_argtype in _aliasTIER2): { _argtype = 2 };
                        case (_argtype in _aliasTIER3): { _argtype = 3 };
                        case (_argtype in _aliasTIER4): { _argtype = 4 };
                    };

                    switch (true) do {
                        case (_arg in _aliasINFANTRY): { _argindex = 0 };
                        case (_arg in _aliasVEHICLES): { _argindex = 1 };
                        case (_arg in _aliasTANKS): { _argindex = 2 };
                        case (_arg in _aliasAIRCRAFTS): { _argindex = 3 };
                    };

                    _units set [_argindex, [_argamount,_argtype,10,40]];
                };

                [_name, _id, _status, _faction, _units select 0, _units select 1, _units select 2, _units select 3, _side, _skill, _area, _pos] spawn BRM_DAC_fnc_createDACZone;
            };
            
            case ((_kind == "camp") || (_kind == "camps")): {
                
                sleep 2;
                
                _reinforce = [];
                
                if !(_id in _aliasRANDOM) then {
                    
                    _id = parseNumber _id;
                    {
                        if ((_x select 1) == _id) then {
                            _reinforce pushBack (_x select 0);
                        };
                    } forEach mission_dac_zones;
                };
                
                _id = floor(random(999999));
                        
                _respawns = parseNumber (_arguments select 8);
                _units = _arguments select 9;
                
                { if (_forEachIndex >= 10) then { _reinforce pushBack _x } } forEach _arguments;
                
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