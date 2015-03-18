/*
================================================================================

NAME:
    BRM_fnc_setAlias
    
AUTHOR(s):
    Nife

DESCRIPTION:
    Assigns an alias to a unit and its group.

PARAMETERS:
    0 - Unit. (OBJECT)
    1 - Group. (GROUP)
    2 - Unit's role. (STRING)
    
USAGE:
    [] call BRM_fnc_setAlias
    
RETURNS:
    Nothing.

================================================================================
*/

private ["_side","_number","_sideGroup","_role","_groupName","_groupNameNumber"];

_aliasAUTO = ["*","AUTO","ANY"];

_unit = _this select 0;
_group = _this select 1;
_role = _this select 2;

_playerUnit = [str(_unit), "_"] call CBA_fnc_split;

_unitSide = _playerUnit select 0;
_groupCallsign = _playerUnit select 1;
_groupNumber = _playerUnit select 2;
_unitNumber = _playerUnit select 3;

_isLeader = (isFormationLeader _unit);
_groupName = _group;
_actualGroup = (_groupNumber == "0");
_autoNamed = (_group in _aliasAUTO);

if (!_autoNamed) then { _groupNumber = "" };

if (_autoNamed) then {

    switch (_unitSide) do {
        case ("blu"): { _side = WEST };
        case ("op"): { _side = EAST };
        case ("ind"): { _side = RESISTANCE };
        case ("civ"): { _side = CIVILIAN };
    };
    
    switch (true) do {
        case (_side == side_a_side): { _group = side_a_callsigns select (parseNumber(_groupCallsign)) };
        case (_side == side_b_side): { _group = side_b_callsigns select (parseNumber(_groupCallsign)) };
        case (_side == side_c_side): { _group = side_c_callsigns select (parseNumber(_groupCallsign)) };
    };

    if (_actualGroup) then { _groupNameNumber = "" } else { _groupNameNumber = " " + _groupNumber };
    _groupName = _group + _groupNameNumber;
};

if (_actualGroup) then { _groupNumber = "" };
if ( (_isLeader) && !(_actualGroup) && (_autoNamed) ) then { _groupNumber = _groupNumber + " " };
if (_isLeader) then { _unitNumber = "" } else { _unitNumber = "'"+(_unitNumber) };

_aliasACTUAL = ["CO", "Officer", "SL", "Squad Leader"];
_aliasFTL = ["FTL", "Team Leader"];

switch (true) do {
    case (_actualGroup && _isLeader): { _role = "Actual" };
    case (_role in _aliasACTUAL): { _role = "Actual" };
    case (_role in _aliasFTL): { _role = "FTL" };
    case (_isLeader): { _role = "Leader" };    
};

if (_unitNumber != "") then { _unitNumber = _unitNumber + " " };

_rosterAlias = format ["%1 %2%3%4", _group, _groupNumber, _unitNumber, _role];

(group _unit) setGroupId [_groupName];
[[(group _unit), _groupName],"BRM_fnc_setGrpIDGlobal",true,true] call BIS_fnc_MP;

_unit setVariable ["rosterAlias", _rosterAlias, true];