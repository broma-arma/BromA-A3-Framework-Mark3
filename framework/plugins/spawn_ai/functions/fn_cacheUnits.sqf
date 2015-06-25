
_group = _this select 0;
_loadout = _this select 1;
_skill = _this select 2;
_color = _this select 3;

_groupIsCached = false;
_groupCachedUnits = [];

_allowedDistance = AI_spawn_cache_distance;

_targetCheck = playableUnits;
if (!isMultiplayer) then { _targetCheck = switchableUnits };

sleep 3;

while {(count (units _group) > 0)} do {
    _leader = leader _group;
    _units = units _group;
    
    _closeUnits = false;
    
    { if (((getPos _leader) distance (getPos _x)) <= _allowedDistance ) then { _closeUnits = true }} forEach _targetCheck;

    if (((_closeUnits) && ((count _groupCachedUnits) > 0))) then {
        {
            _unitClass = _x select 0;
            _vehicle = _x select 1;
            _vehicleClass = _x select 2;

            _unit = [_group, _unitClass, [0,0,0], _skill, _loadout, _color] call BRM_SpawnAI_fnc_spawnUnit;

            if !(str(_vehicle) == "<NULL-object>") then {
                if ((alive _vehicle) && ((getPos _vehicle) distance (getPos _leader)) < 50) then {
                    switch(true) do {
                        case (_vehicle emptyPositions "cargo" > 0) : { _unit moveinCargo _vehicle; if (vehicle _unit == _unit) then { deleteVehicle _unit } };
                        case (_vehicle emptyPositions "cargo" <= 0) : { deleteVehicle _unit };
                    };
                } else {
                    _unit setPos [((getPos _leader) select 0) + (5 + random(5)), ((getPos _leader) select 1) + (5 + random(5)), 0];
                };
            } else {
                _unit setPos [((getPos _leader) select 0) + (5 + random(5)), ((getPos _leader) select 1) + (5 + random(5)), 0];
            };

            ["LOCAL", "CHAT", "De-caching " + (name _unit) + "."] call BRM_fnc_doLog;
        } forEach _groupCachedUnits;
        
        _groupCachedUnits = [];
    };
    
    if ((!(_closeUnits) && ((count _groupCachedUnits) == 0))) then {
        
        if (count _units > 0) then {
            {
                if (!(_x == _leader)) then {
                    _isDriver = ( (driver (vehicle _x) == _x) && ((vehicle _x) != _x));
                    if (!_isDriver) then {
                        _array = [];

                        _array pushBack (typeOf _x);
                        _array pushBack (vehicle _x);
                        _array pushBack typeOf (vehicle _x);

                        _groupCachedUnits pushBack _array;

                        ["LOCAL", "CHAT", "Cached unit "+(name _x)+"."] call BRM_fnc_doLog;
                        
                        [_x] joinSilent grpNull;
                        
                        deleteVehicle _x;
                    };
                };
            } forEach _units;
        };
    };
    
    sleep 3;
};

["LOCAL", "CHAT", format ["%1 no longer exists.", _group]] call BRM_fnc_doLog;

true