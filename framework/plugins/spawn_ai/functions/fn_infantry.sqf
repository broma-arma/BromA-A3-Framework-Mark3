
/*
================================================================================

NAME:
    BRM_SpawnAI_fnc_infantry

AUTHOR(s):
    Nife

DESCRIPTION:
    Spawns AI groups with specific parameters, with room for a LOT of variation.

PARAMETERS:
    0 - Side of the units. (SIDE)
    1 - Loadout. (STRING)
    2 - Type of units (NUMBER): 0: Regular infantry, 1: Recon, 2: Snipers
    3 - How many groups will be spawned. (NUMBER)
    4 - The size of the groups. (NUMBER): 0: Duo, 1: Fire-team, 2: Squad, 3: Platoon
    5 - Unit skill. (SCALAR)
    6 - Behavior. (STRING)
    7 - Combat mode. (STRING)
    8 - Task. (STRING) "ATTACK" / "DEFEND" / "PATROL" / "PARADROP"
    9 - Possible vehicles to be used. (ARRAY of VEHICLES) - This may be left empty.
    10 - Whether the vehicle will return after dropping off the infantry.
    11 - Possible starting points. (ARRAY of MARKERS)
    12 - Possible LZ/drop-off points. (ARRAY of MARKERS) - This may be left empty.
    13 - Possible end points. (ARRAY of MARKERS)
    14 - Radius of spawn (ARRAY): [Start, LZ, End]

USAGE:
   [WEST, "USARMY", 0, 2, 1, 0.5, "AWARE", "YELLOW", "PARADROP", ["B_Heli_Light_01_F"], true, ["point_2_1"], ["point_2_LZ"], ["point_2_2"], [200,100,50]] spawn BRM_SpawnAI_fnc_infantry;

   [EAST, "VDV", 0, 3, 2, 0.7, "COMBAT", "YELLOW", "ATTACK", ["RHS_Ural_MSV_01"], true, ["point_2_1"], [], ["point_2_2"], [200,100,50]] spawn BRM_SpawnAI_fnc_infantry;

   [WEST, "CSAT", 2, 5, 1, 1, "COMBAT", "YELLOW", "PATROL", [], true, ["point_2_1","point_1_1","point_3_1"], [], ["point_2_2", "point_1_2"], [200,100,50]] spawn BRM_SpawnAI_fnc_infantry;

RETURNS:
    Nothing.

NOTES:
    It is recommended to use this script inside the mission_AI.sqf file for HC compatibility.

================================================================================
*/

waitUntil{(time > 1)};

if !(mission_ai_controller) exitWith {};

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
_treturns = _this select _c;_c=_c+1;
_starting = _this select _c;_c=_c+1;
_LZ = _this select _c;_c=_c+1;
_end = _this select _c;_c=_c+1;
_radius = _this select _c;_c=_c+1;

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

for "_i" from 1 to _amount do {

    private ["_leader"];

    _group = createGroup _hq;
    _startPos = getMarkerPos (_starting call BIS_fnc_selectRandom);
    _endPos = getMarkerPos (_end call BIS_fnc_selectRandom);

    _startPos = [_startPos, [-(_radius select 0), (_radius select 0)],[-(_radius select 0), (_radius select 0)]] call BRM_spawnAI_fnc_addDistance;
    _endPos = [_endPos, [-(_radius select 2), (_radius select 2)],[-(_radius select 2), (_radius select 2)]] call BRM_spawnAI_fnc_addDistance;

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

        _unit = [_group, _unitName, _startPos, _skill, _loadout, _color, _unitIndex] call BRM_SpawnAI_fnc_spawnUnit;

        if (_j == 0) then { _leader = _unit };

    };

    _groupSize = count (units _group);

    if (count _transport > 0) then {

        _finalLZ = _endPos;
        if (count _LZ > 0) then { _finalLZ = getMarkerPos (_LZ call BIS_fnc_selectRandom) };

        _finalLZ = [_finalLZ, [-(_radius select 1), (_radius select 1)],[-(_radius select 1), (_radius select 1)]] call BRM_spawnAI_fnc_addDistance;

        _landingPad = "HeliHEmpty" createVehicle _finalLZ;

        _typeVehicle = _transport call BIS_fnc_selectRandom;
        _vehicle = _typeVehicle createVehicle _startPos;

        _vehicle spawn {
            _count = 0;

            while {(alive _this)} do {
                _limit = 60*5;

                if (speed _this == 0) then { _count = _count + 1 } else { _count = 0 };

                if ((_count == _limit)) exitWith { { deleteVehicle _x } forEach (crew _this); deleteVehicle _this };

                sleep 1;
            };
            sleep 60;
            { deleteVehicle _x } forEach (crew _this); deleteVehicle _this;
        };

        _crewGroup = createGroup _hq;

        _createdCrew = [];

        private ["_crew"];

        switch (true) do {
           case (_vehicle isKindOf "Truck"): { _crew = _unitsInfantry };
           case (_vehicle isKindOf "Car"): { _crew = _unitsInfantry };
           case (_vehicle isKindOf "Tank"): { _crew = _unitsCrew };
           case (_vehicle isKindOf "Helicopter"): { _crew = _unitsHeli };
           case (_vehicle isKindOf "Plane"): { _crew = _unitsJet };
           default { _crew = _unitsInfantry };
        };

        _driver = [_crewGroup, format ["%1_%2_F", _uPrefix, _crew select 0], _startPos, _skill, _loadout, _color] call BRM_SpawnAI_fnc_spawnUnit;

        _driver setVariable ["can_leave_LZ", true];

        _driver moveInDriver _vehicle;

        _createdCrew pushBack _driver;

        _spawnCrew = true;

        while {(_spawnCrew)} do {
            switch(true) do {
                case (_vehicle emptyPositions "commander" > 0) : {
                    _unit = [_crewGroup, format ["%1_%2_F", _uPrefix, (_crew select ((count _crew)-1))], _startPos, _skill, _loadout, _color] call BRM_SpawnAI_fnc_spawnUnit;
                    _unit moveInCommander _vehicle;
                    _createdCrew pushBack _unit;
                };
                case (_vehicle emptyPositions "gunner" > 0) : {
                    _unit = [_crewGroup, format ["%1_%2_F", _uPrefix, (_crew select ((count _crew)-1))], _startPos, _skill, _loadout, _color] call BRM_SpawnAI_fnc_spawnUnit;
                    _unit moveInGunner _vehicle;
                    _createdCrew pushBack _unit;
                };
                default { _spawnCrew = false };
            };
        };

        _toMove = (units _group);

        while {(count _toMove > 0)} do {
            _unit = _toMove select 0;

            switch(true) do {
                case (_vehicle emptyPositions "cargo" > 0) : {
                    _unit moveinCargo _vehicle;
                    if (vehicle _unit == _unit) then {
                        deleteVehicle _unit;
                        ["LOCAL", "CHAT", format ["WARNING: %1 is out of spaces in %2", _unit, _vehicle]] call BRM_fnc_doLog;
                    };
                };
                case (_vehicle emptyPositions "cargo" <= 0) : {
                    deleteVehicle _unit;
                    ["LOCAL", "CHAT", format ["WARNING: %1 is out of spaces in %2", _unit, _vehicle]] call BRM_fnc_doLog;
                };
            };
            _toMove = _toMove - [_unit];
        };

        ["LOCAL", "CHAT", format["Group %1 with %2 units finished generating.", _group, count units _group]] call BRM_fnc_doLog;

        _wp = _crewGroup addWaypoint [_finalLZ, 0];
        [_crewGroup, 0] setWaypointBehaviour _behavior;
        [_crewGroup, 0] setWaypointCombatMode _combat;

        if (_task == "PARADROP") then {
            _driver setVariable ["drop_ready", false];
            _driver setVariable ["can_leave_LZ", false];

            _wp setWaypointType "MOVE";
            [_crewGroup, 0] setWaypointSpeed "LIMITED";
            _wp setWaypointStatements ["true", "this setVariable ['drop_ready', true]; this setVariable ['can_leave_LZ', true];"];

            _vehicle flyInHeight 100;

            ["LOCAL", "CHAT", "Received order to paradrop."] call BRM_fnc_doLog;

            [_group, _driver, _endPos] spawn {
                _group = _this select 0;
                _driver = _this select 1;
                _endPos = _this select 2;

                ["LOCAL", "CHAT", "Waiting to approach LZ."] call BRM_fnc_doLog;
                waitUntil {
                    sleep 1;
                    _driver getVariable ["drop_ready", false]
                };

                ["LOCAL", "CHAT", "Everyone jump!"] call BRM_fnc_doLog;

                { removeBackpack _x; _x addBackpack "B_Parachute" } forEach (units _group);

                {
                    [_x] orderGetIn false;
                    moveOut _x;
                    _x action ["eject", (vehicle _x)];
                    ["LOCAL", "CHAT", (name _x)+" is now attempting to jump."] call BRM_fnc_doLog;
                    sleep random(0.5)+0.5;
                } forEach (units _group);
            };
        } else {
            _wp setWaypointType "TR UNLOAD";
        };

        if (_treturns) then {
            [_crewGroup, _startPos, _driver, _combat] spawn {
                _crewGroup = _this select 0;
                _startPos = _this select 1;
                _driver = _this select 2;
                _combat = _this select 3;
                _vehicle = (vehicle _driver);

                waitUntil {(_driver getVariable ["can_leave_LZ", false])};

                sleep 3;

                ["LOCAL", "CHAT", "Transport now returning to base."] call BRM_fnc_doLog;

                _driver moveInDriver _vehicle;
                _driver assignAsDriver _vehicle;

                _wp3 = _crewGroup addWaypoint [_startPos, 1];
                [_crewGroup, 1] setWaypointCompletionRadius 50;
                [_crewGroup, 1] setWaypointBehaviour "CARELESS";
                [_crewGroup, 1] setWaypointCombatMode _combat;
                [_crewGroup, 1] setWaypointSpeed "FULL";
                _wp3 setWaypointType "MOVE";
                _wp3 setWaypointStatements ["true", "{ _veh = vehicle _x; deleteVehicle _x; deleteVehicle _veh } forEach thislist"];
            };
        };

        [_task, _vehicle, _group, _groupSize, _endPos, _radius, _behavior, _combat] spawn {

            _task = _this select 0;
            _vehicle = _this select 1;
            _group = _this select 2;
            _groupSize = _this select 3;
            _endPos = _this select 4;
            _radius = _this select 5;
            _behavior = _this select 6;
            _combat = _this select 7;

            if (_task == "PARADROP") then {
                waitUntil {
                    (((getPos (_vehicle)) select 2) > 5)
                };
                waitUntil {
                    sleep 1;
                    _count = 0;
                    {
                        _height = (getPos (vehicle _x)) select 2;

                        if (_height <= 1) then { _count = _count + 1 };
                    } forEach (units _group);
                    _count == count (units _group)
                };

                ["LOCAL", "CHAT", "We have paradropped successfully."] call BRM_fnc_doLog;

                waitUntil {
                    sleep 1;
                    _count = 0;
                    {
                        _distance = ((getPos _x) distance (getPos (leader _group)));

                        if (_distance <= 15) then { _count = _count + 1 };
                    } forEach (units _group);
                    _count == count (units _group)
                };

                ["LOCAL", "CHAT", format ["All units regrouped, suffered %1 casualties.", _groupSize - (count (units _group))]] call BRM_fnc_doLog;

                [_group, _endPos, 50] call CBA_fnc_taskAttack;
            };

            ["LOCAL", "CHAT", "Moving to designated way-point."] call BRM_fnc_doLog;

            switch (_task) do {
                case "ATTACK": { [_group, _endPos, 50] call CBA_fnc_taskAttack };
                case "DEFEND": { [_group, _endPos, 50, 2, true] call CBA_fnc_taskDefend };
                case "PATROL": { [_group, _endPos, (_radius select 2), 7, "MOVE", _behavior, _combat, "FULL", "NO CHANGE", "", [3,6,9]] call CBA_fnc_taskPatrol };
            };
        };

    } else {
        switch (_task) do {
            case "ATTACK": { [_group, _endPos, 50] call CBA_fnc_taskAttack };
            case "DEFEND": { [_group, _endPos, 50, 2, true] call CBA_fnc_taskDefend };
            case "PATROL": { [_group, _endPos, (_radius select 2), 7, "MOVE", _behavior, _combat, "FULL", "NO CHANGE", "", [3,6,9]] call CBA_fnc_taskPatrol };
        };

        _group setBehaviour _behavior;
        _group setCombatMode _combat;
    };

    if (AI_spawn_enable_caching) then { [_group, _loadout, _skill, _color] spawn BRM_SpawnAI_fnc_cacheUnits };
};