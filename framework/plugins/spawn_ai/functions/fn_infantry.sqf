
/*

Side
Loadout
Type = Infantry, sniper, recon
Amount
Group size
Skill
Behavior
Combat
Task - attack/defend/patrol
Transport vehicle [array filled with vehicles]
Starting point [markers]
End point [markers]

[EAST, "AUTO", 0, 4, 2, 0.5, "SAFE", "YELLOW", "ATTACK", false, ["point1"], ["point2","point3"]] spawn BRM_SpawnAI_fnc_infantry;

*/

_c=0;

_side = _this select _c;_c=_c+1;
_loadout = _this select _c;_c=_c+1;
_type = _this select _c;_c=_c+1;
_amount = _this select _c;_c=_c+1;
_size = _this select _c;_c=_c+1;
_skill = _this select _c;_c=_c+1;
_behavior = _this select _c;_c=_c+1;
_combat = _this select _c;_c=_c+1;
_task = _this select _c;_c=_c+1;
_transport = _this select _c;_c=_c+1;
_starting = _this select _c;_c=_c+1;
_end = _this select _c;_c=_c+1;

#include "includes\units.sqf"
#include "includes\dictionary.sqf"

private ["_uPrefix","_color","_groupType","_hq","_uUnits"];

switch (_side) do {
    case WEST: { _uPrefix = "B"; _hq = WEST_HQ; _color = "Blue" };
    case EAST: { _uPrefix = "O"; _hq = EAST_HQ; _color = "Red" };
    case RESISTANCE: { _uPrefix = "I"; _hq = IND_HQ; _color = "Green" };
    default { _uPrefix = "B"; _hq = WEST_HQ };
};

switch (_size) do {
    case 0: { _size = 2; _groupType = "duo" };
    case 1: { _size = 4; _groupType = "fireteam" };
    case 2: { _size = 10; _groupType = "squad" };
    case 3: { _size = 20; _groupType = "platoon" };
};

switch (_type) do {
    case 0: { _uUnits = _unitsInfantry };
    case 1: { _uUnits = _unitsRecon };
    case 2: { _uUnits = _unitsSniper };
};

for "_i" from 0 to _amount do {
    
    _group = createGroup _hq;
    _startPos = getMarkerPos (_starting call BIS_fnc_selectRandom);
    _endPos = getMarkerPos (_end call BIS_fnc_selectRandom);
            
    for "_j" from 0 to _size do {
        private ["_unitIndex"];
        
        if (_j == 0) then {
            if (_type == 0) then {
            switch (_groupType) do {
                case "duo": { _unitIndex = 3 };
                case "fireteam": { _unitIndex = 0 };
                case "squad": { _unitIndex = 1 };
                case "platoon": { _unitIndex = 2 };
            };
            } else { _unitIndex = 0 };
        } else {
            _unitIndex = [3,(count _uUnits)-1] call BIS_fnc_randomInt;
        };
        
        _unitName = format ["%1_%2_F", _uPrefix, _uUnits select _unitIndex];
        
        ["LOCAL", "CHAT", format["_unitName(%3): %1 | _startPos: %2", _unitName, _startPos, _unitIndex]] call BRM_fnc_doLog;
        
        _unit = _group createUnit [_unitName, _startPos, [], 0, "FORM"];
        _unit setSkill _skill;
        
        [_unit, _loadout] spawn BRM_fnc_initAI;
        
        [_unit, _color] spawn {
            _unit = _this select 0;
            _color = _this select 1;            
                
            _marker = ["local", getPos _unit, "hd_dot", "Color"+_color, "", [2,2], 0, 1] call BRM_fnc_newMarkerIcon;
            
            while {(alive _unit)} do {
                sleep 0.1;
                _marker setMarkerPos getPos _unit;
            };
            deleteMarker _marker;
        };        
    };
    
    ["LOCAL", "CHAT", format["Group %1 with %2 units finished generating.", _group, count units _group]] call BRM_fnc_doLog;
    
    switch (_task) do {
        case "ATTACK": { [(units _group) select 0, _endPos, 50] call CBA_fnc_taskAttack };
        case "DEFEND": { [(units _group) select 0, _endPos, 50] call CBA_fnc_taskDefend };
        case "PATROL": { [(units _group) select 0, _endPos, 50] call CBA_fnc_taskPatrol };
    };
    
    _group setBehaviour _behavior;
    _group setCombatMode _combat;    
};
