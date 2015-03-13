
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
    
    player setPosATL (_stats select _count); _count = _count + 1;
    player setDamage (_stats select _count); _count = _count + 1;
    
    _vehicle = (_stats select _count); _count = _count + 1;
    _vehicleSeat = (_stats select _count); _count = _count + 1;
    
    if (_vehicle != vehicle player) then {
        [-1, { (_this select 0) enableSimulation (_this select 1) }, [_vehicle, false]] call CBA_fnc_globalExecute;
        switch (_vehicleSeat) do {
            case "CARGO": { if (_vehicle emptyPositions "cargo" > 0) then { player moveInCargo _vehicle } };
            case "DRIVER": { if (_vehicle emptyPositions "driver" > 0) then { player moveInDriver _vehicle } };
            case "GUNNER": { if (_vehicle emptyPositions "gunner" > 0) then { player moveInGunner _vehicle } };
            case "COMMANDER": { if (_vehicle emptyPositions "commander" > 0) then { player moveInCommander _vehicle } };
            default {
                if (_vehicle emptyPositions "cargo" == 0) then {
                    player moveInCargo _vehicle;
                } else {
                    _vehiclePos = getPosATL _vehicle;
                    player setPosATL [(_vehiclePos select 0) + random(5), (_vehiclePos select 1)  + random(5), 0];
                };
            };
        };
        sleep 1;
        [-1, { (_this select 0) enableSimulation (_this select 1) }, [_vehicle, true]] call CBA_fnc_globalExecute;
    };
};