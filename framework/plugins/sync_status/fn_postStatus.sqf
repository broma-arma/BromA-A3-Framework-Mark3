
if (status_post_antispam) exitWith {
    sleep 60;
    status_post_antispam = false;
};

private 
["_tfarGlobalVolume", "_tfarVoiceVolume", "_tfarAbleUseRadio", 
"_acreIsDisabled", "_acreGlobalVolume",
"_agmCaptive","_agmIsDiagnosed","_agmCanTreat","_agmIsTreatable","_agmBlood",
"_agmIsBleeding","_agmPainkiller","_agmPain","_agmIsUnconscious","_agmIsOverdosing","_agmTransporting",
"_playerVehicleSeat"];

_packetPlayer = [];

_packetPlayer pushBack (getPlayerUID player);

if ("tfar_plugin" in usedPlugins) then {

    _tfarGlobalVolume = player getVariable ["tf_globalVolume", 1];
    _tfarVoiceVolume = player getVariable ["tf_voiceVolume", 1];
    _tfarAbleUseRadio =  player getVariable ["tf_unable_to_use_radio", false];

    _packetPlayer pushBack _tfarGlobalVolume;
    _packetPlayer pushBack _tfarVoiceVolume;
    _packetPlayer pushBack _tfarAbleUseRadio;
};

if ("acre2_plugin" in usedPlugins) then {
    _acreIsDisabled = player getVariable ["acre_sys_core_isDisabled", false];
    _acreGlobalVolume = player getVariable ["acre_sys_core_globalVolume", 1];

    _packetPlayer pushBack _acreIsDisabled;
    _packetPlayer pushBack _acreGlobalVolume;
};

if ("agm_plugin" in usedPlugins) then {
    _agmCaptive = player getVariable ["AGM_isCaptive", false];

    _agmBlood = player getVariable ["AGM_Blood", 1];
    _agmIsBleeding = player getVariable ["AGM_isBleeding", false];
    _agmPainkiller = player getVariable ["AGM_Painkiller", 1];
    _agmPain = player getVariable ["AGM_Pain", 0];

    _agmIsUnconscious = player getVariable ["AGM_isUnconscious", false];
    _agmIsOverdosing = player getVariable ["AGM_isOverdosing", false];

    _packetPlayer pushBack _agmCaptive;
    _packetPlayer pushBack _agmBlood;
    _packetPlayer pushBack _agmIsBleeding;
    _packetPlayer pushBack _agmPainkiller;
    _packetPlayer pushBack _agmPain;
    _packetPlayer pushBack _agmIsUnconscious;
    _packetPlayer pushBack _agmIsOverdosing;
};

_playerDir = getDir player;
_playerPos = getPosATL player;
_playerDamage = getDammage player;

_playerVehicle = vehicle player;

switch (true) do {
    case (player == commander _playerVehicle): { _playerVehicleSeat = "COMMANDER" };
    case (player == driver _playerVehicle): { _playerVehicleSeat = "DRIVER" };
    case (player == gunner _playerVehicle): { _playerVehicleSeat = "GUNNER" };
    default { _playerVehicleSeat = "CARGO" };
};

_packetPlayer pushBack _playerDir;
_packetPlayer pushBack _playerPos;
_packetPlayer pushBack _playerDamage;
_packetPlayer pushBack _playerVehicle;
_packetPlayer pushBack _playerVehicleSeat;

[0, { 
     _index = (count mission_player_status);

     { if ((_x select 0) == (_this select 0)) then { _index = _forEachIndex } } forEach mission_player_status;

     mission_player_status set [_index, _this];
     publicVariable "mission_player_status";
}, _packetPlayer] call CBA_fnc_globalExecute;

//["ALL", "CHAT", _packetPlayer] call BRM_fnc_doLog;