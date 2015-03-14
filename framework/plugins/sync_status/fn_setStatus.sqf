
_index = -1;

{ if ((_x select 0) == (getPlayerUID player)) then { _index = _forEachIndex } } forEach mission_player_status;

if (_index >= 0) then {
    _stats = mission_player_status select _index;
    
    _count = 1;
    
    if ("tfar_plugin" in usedPlugins) then {
        player setVariable ["tf_globalVolume", (_stats select _count)]; _count = _count + 1;
        player setVariable ["tf_voiceVolume", (_stats select _count), true]; _count = _count + 1;
        player setVariable ["tf_unable_to_use_radio", (_stats select _count), true]; _count = _count + 1;
    };
    
    if ("acre2_plugin" in usedPlugins) then {
        player setVariable ["acre_sys_core_isDisabled", (_stats select _count), true]; _count = _count + 1;
        player setVariable ["acre_sys_core_globalVolume", (_stats select _count)]; _count = _count + 1;
    };

    if ("agm_plugin" in usedPlugins) then {
        [player, (_stats select _count)] spawn AGM_Captives_fnc_setCaptive; _count = _count + 1;
        player setVariable ["AGM_Blood", (_stats select _count), true]; _count = _count + 1;
        player setVariable ["AGM_isBleeding", (_stats select _count), true]; _count = _count + 1;
        player setVariable ["AGM_Painkiller", (_stats select _count), true]; _count = _count + 1;
        player setVariable ["AGM_Pain", (_stats select _count), true]; _count = _count + 1;

        player setVariable ["AGM_isUnconscious", (_stats select _count), true]; _count = _count + 1;
        player setVariable ["AGM_isOverdosing", (_stats select _count), true]; _count = _count + 1;
    };

    player setDir (_stats select _count); _count = _count + 1;
    
    _playerPos = (_stats select _count); _count = _count + 1;
    player setDamage (_stats select _count); _count = _count + 1;
    
    _vehicle = (_stats select _count); _count = _count + 1;
    _vehicleSeat = (_stats select _count); _count = _count + 1;
    _playerGear = (_stats select _count); _count = _count + 1;
    
    [player, _playerGear] call BRM_fnc_setGear;
    
    [_vehicle, _vehicleSeat] spawn BRM_fnc_moveToVehicle;
    
    if (!(vehicle player == _vehicle)) then {
        while {!(vehicle player == _vehicle) && (alive _vehicle)} do {
            [_vehicle, _vehicleSeat] spawn BRM_fnc_moveToVehicle;
            sleep 3;
        };

        if (!alive _vehicle) then {
            ["LOCAL", "CHAT", "Your last known vehicle is currently destroyed."] call BRM_fnc_doLog;
        };
    } else {
        player setPos _playerPos;
    };
};