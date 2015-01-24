if (!HeadlessController) exitWith {};

private["_id","_units","_side","_arg1","_arg1size","_arg2","_arg2size","_arg3","_arg3size","_arg4","_arg4size"];

_trigger = _this select 0;
_pos = getPos _trigger;
_area = triggerArea _trigger;
_string = _this select 1;
_output = [];
_units = [[],[],[],[]];

_ignoredWords = ["hey","please","a","an","with","also","and","but","however","of","amounts"];

_aliasRANDOM = ["whatever","anything","random"];

_aliasBLUFOR = ["blufor"];
_aliasOPFOR = ["opfor","redfor"];
_aliasRESISTANCE = ["independent","resistance","indfor","guerilla"];
_aliasCIVILIAN = ["civilian","civilians","civies"];

_aliasINFANTRY = ["infantry","units","soldiers"];
_aliasVEHICLES = ["vehicles","technicals","lavs"];
_aliasTANKS = ["tanks","armor"];
_aliasAIRCRAFTS = ["aircrafts","helicopters"];

_string = toLower(_string);

_string = [_string, ",", ""] call CBA_fnc_replace;
_string = [_string, ".", ""] call CBA_fnc_replace;
_string = [_string, "!", ""] call CBA_fnc_replace;

_arguments = [_string, " "] call CBA_fnc_split;
_arguments = _arguments - _ignoredWords;

_command = _arguments select 0;
_status = _arguments select 1;
_side = _arguments select 2;
_kind = _arguments select 3;
_name = _arguments select 5;

_arg1size = _arguments select 6;
_arg1 = _arguments select 7;

switch (_status) do {
    case "activated": { _status = 0 };
    case "deactivated": { _status = 1 };
    default { _status };
};

switch (true) do {
    case (_name in _aliasRANDOM): { _id = floor(random(99999)); _name = "DAC_zone_" + str(_id) };
    default { _id = _name };
};

switch (true) do {
    case (_side in _aliasOPFOR): { _side = 0 };
    case (_side in _aliasBLUFOR): { _side = 1 };
    case (_side in _aliasRESISTANCE): { _side = 2 };
    case (_side in _aliasCIVILIAN): { _side = 3 };
    case (_side == "side_a"): { _side = [side_a_side] call BRM_fnc_getDACSide };
    case (_side == "friendly"): { _side = [side_a_side] call BRM_fnc_getDACSide };    
    case (_side == "side_b"): { _side = [side_b_side] call BRM_fnc_getDACSide };
    case (_side == "enemy"): { _side = [side_b_side] call BRM_fnc_getDACSide };    
    case (_side == "side_c"): { _side = [side_c_side] call BRM_fnc_getDACSide };
};

switch (_kind) do {
    case "zone": { _kind = 0 };
};

switch (true) do {
    case (_arg1 in _aliasINFANTRY): { _units set [0, ([_arg1size] call BRM_fnc_scaleUnits)] };
    case (_arg1 in _aliasVEHICLES): { _units set [1, ([_arg1size] call BRM_fnc_scaleUnits)] };
    case (_arg1 in _aliasTANKS): { _units set [2, ([_arg1size] call BRM_fnc_scaleUnits)] };
    case (_arg1 in _aliasAIRCRAFTS): { _units set [3, ([_arg1size] call BRM_fnc_scaleUnits)] };
};

if (count _arguments >= 9) then {
    _arg2size = toLower(_arguments select 8);
    _arg2 = toLower(_arguments select 9);    
        
    switch (true) do {
        case (_arg2 in _aliasINFANTRY): { _units set [0, ([_arg2size] call BRM_fnc_scaleUnits)] };
        case (_arg2 in _aliasVEHICLES): { _units set [1, ([_arg2size] call BRM_fnc_scaleUnits)] };
        case (_arg2 in _aliasTANKS): { _units set [2, ([_arg2size] call BRM_fnc_scaleUnits)] };
        case (_arg2 in _aliasAIRCRAFTS): { _units set [3, ([_arg2size] call BRM_fnc_scaleUnits)] };
    };    
};

if (count _arguments >= 11) then {
    _arg3 = toLower(_arguments select 11);
    _arg3size = toLower(_arguments select 10);
        
    switch (true) do {
        case (_arg3 in _aliasINFANTRY): { _units set [0, ([_arg3size] call BRM_fnc_scaleUnits)] };
        case (_arg3 in _aliasVEHICLES): { _units set [1, ([_arg3size] call BRM_fnc_scaleUnits)] };
        case (_arg3 in _aliasTANKS): { _units set [2, ([_arg3size] call BRM_fnc_scaleUnits)] };
        case (_arg3 in _aliasAIRCRAFTS): { _units set [3, ([_arg3size] call BRM_fnc_scaleUnits)] };
    };    
};

if (count _arguments >= 12) then {
    _arg4 = toLower(_arguments select 12);
    _arg4size = toLower(_arguments select 11);

    switch (_arg4) do {
        case (_arg4 in _aliasINFANTRY): { _units set [0, ([_arg4size] call BRM_fnc_scaleUnits)] };
        case (_arg4 in _aliasVEHICLES): { _units set [1, ([_arg4size] call BRM_fnc_scaleUnits)] };
        case (_arg4 in _aliasTANKS): { _units set [2, ([_arg4size] call BRM_fnc_scaleUnits)] };
        case (_arg4 in _aliasAIRCRAFTS): { _units set [3, ([_arg4size] call BRM_fnc_scaleUnits)] };
    };    
};

switch (_command) do {
    case "create": {
        [-1, { player globalChat format ["%1 activated zone %2",_this select 0, _this select 1] }, [player, _id] ] call CBA_fnc_globalExecute;
        [_name, _id, _status, _units select 0, _units select 1, _units select 2, _units select 3, _side, _area, _pos] spawn BRM_fnc_createDACZone;
    };
};