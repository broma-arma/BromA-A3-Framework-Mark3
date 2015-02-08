private ["_side","_number","_sideGroup","_role"];

_unit = _this select 0;
_group = _this select 1;
_role = _this select 2;

_playerUnit = [str(_unit), "_"] call CBA_fnc_split;

_groupNumber = _playerUnit select 2;
_playerNumber = _playerUnit select 3;

if (_groupNumber == "0") then { _groupNumber = "" };

_test = [_group, "_"] call CBA_fnc_find;

if (_test > -1) then {
    _groupsplit = [_group, "_"] call CBA_fnc_split;

    _side = _groupsplit select 0;
    _number = parseNumber(_groupsplit select 2);

    switch (_side) do {
        case ("blu"): { _side = WEST };
        case ("op"): { _side = EAST };
        case ("ind"): { _side = RESISTANCE };
        case ("civ"): { _side = CIVILIAN };
    };
    
    switch (true) do {
        case (_side == side_a_side): { _sideGroup = side_a_groups };
        case (_side == side_b_side): { _sideGroup = side_b_groups };
        case (_side == side_c_side): { _sideGroup = side_c_groups };
    };
    
    _group = _sideGroup select _number;
    
    if (_groupNumber != "") then { _groupNumber = " " + _groupNumber };
    
    _group = _group + _groupNumber;
};

[-1, { (_this select 0) setGroupId [_this select 1] }, [(group _unit), _group]] call CBA_fnc_globalExecute;

_isLeader = (isFormationLeader _unit);

if (_isLeader) then { _playerNumber = "" } else { _playerNumber = "'"+(_playerNumber) };

_aliasACTUAL = ["CO", "Officer", "SL", "Squad Leader"];
_aliasFTL = ["FTL", "Team Leader"];

switch(true) do {    
    case (_role in _aliasACTUAL): { _role = "Actual" };
    case (_role in _aliasFTL): { _role = "FTL" };
    case (_isLeader): { _role = "Leader" };
    default { _role = [_role] call CBA_fnc_capitalize };
};

if (_playerNumber != "") then { _playerNumber = _playerNumber + " " };
_groupNumber = [_groupNumber, " ", ""] call CBA_fnc_replace;

_rosterAlias = format ["%1 %2%3%4", _group, _groupNumber, _playerNumber, _role];

_unit setVariable ["rosterAlias", _rosterAlias, true];