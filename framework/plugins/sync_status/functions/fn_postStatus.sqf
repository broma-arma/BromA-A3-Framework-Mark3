
private ["_unit", "_uid","_name"];

_unit = _this select 0;
_uid = _this select 2;
_name = _this select 3;

_validSlot = _unit getVariable ["unit_valid_slot", false];

if ([_uid, _name] in mission_dead_players) exitWith {};
if (!_validSlot) exitWith {};

private 
["_tfarGlobalVolume", "_tfarVoiceVolume", "_tfarAbleUseRadio", 
"_acreIsDisabled", "_acreGlobalVolume",
"_agmCaptive","_agmIsDiagnosed","_agmCanTreat","_agmIsTreatable","_agmBlood",
"_agmIsBleeding","_agmPainkiller","_agmPain","_agmIsUnconscious","_agmIsOverdosing","_agmTransporting",
"_playerVehicleSeat"];

_packetPlayer = [];

_packetPlayer pushBack _uid;

if (mission_TFAR_enabled) then {

    _tfarGlobalVolume = _unit getVariable ["tf_globalVolume", 1];
    _tfarVoiceVolume = _unit getVariable ["tf_voiceVolume", 1];
    _tfarAbleUseRadio =  _unit getVariable ["tf_unable_to_use_radio", false];

    _packetPlayer pushBack _tfarGlobalVolume;
    _packetPlayer pushBack _tfarVoiceVolume;
    _packetPlayer pushBack _tfarAbleUseRadio;
};

if (mission_ACRE2_enabled) then {
    _acreIsDisabled = _unit getVariable ["acre_sys_core_isDisabled", false];
    _acreGlobalVolume = _unit getVariable ["acre_sys_core_globalVolume", 1];

    _packetPlayer pushBack _acreIsDisabled;
    _packetPlayer pushBack _acreGlobalVolume;
};

if (mission_AGM_enabled) then {
    _agmCaptive = _unit getVariable ["AGM_isCaptive", false];

    _agmBlood = _unit getVariable ["AGM_Blood", 1];
    _agmIsBleeding = _unit getVariable ["AGM_isBleeding", false];
    _agmPainkiller = _unit getVariable ["AGM_Painkiller", 1];
    _agmPain = _unit getVariable ["AGM_Pain", 0];

    _agmIsUnconscious = _unit getVariable ["AGM_isUnconscious", false];
    _agmIsOverdosing = _unit getVariable ["AGM_isOverdosing", false];
    _agmEarplugs = _unit getVariable ["AGM_hasEarPlugsIn", false];

    _packetPlayer pushBack _agmCaptive;
    _packetPlayer pushBack _agmBlood;
    _packetPlayer pushBack _agmIsBleeding;
    _packetPlayer pushBack _agmPainkiller;
    _packetPlayer pushBack _agmPain;
    _packetPlayer pushBack _agmIsUnconscious;
    _packetPlayer pushBack _agmIsOverdosing;
    _packetPlayer pushBack _agmEarplugs;
};

_playerDir = getDir _unit;
_playerPos = getPosATL _unit;
_playerDamage = getDammage _unit;

_playerVehicle = (vehicle _unit);
_playerUnit = _unit;

switch (true) do {
    case (_unit == commander _playerVehicle): { _playerVehicleSeat = "COMMANDER" };
    case (_unit == driver _playerVehicle): { _playerVehicleSeat = "DRIVER" };
    case (_unit == gunner _playerVehicle): { _playerVehicleSeat = "GUNNER" };
    default { _playerVehicleSeat = "CARGO" };
};

_playerGear = [_unit] call BRM_fnc_getGear;

_packetPlayer pushBack _playerDir;
_packetPlayer pushBack _playerPos;
_packetPlayer pushBack _playerDamage;

_packetPlayer pushBack str _playerUnit;
_packetPlayer pushBack _playerVehicle;
_packetPlayer pushBack _playerVehicleSeat;
_packetPlayer pushBack _playerGear;

 _index = (count mission_player_status);

 { if ((_x select 0) == (_packetPlayer select 0)) then { _index = _forEachIndex } } forEach mission_player_status;

 ["LOCAL", "CHAT", format ["PLAYER %1 DISCONNECTED: %2", _name, str _packetPlayer]] call BRM_fnc_doLog;
 ["LOCAL", "LOG", format ["PLAYER %1 DISCONNECTED: %2", _name, str _packetPlayer]] call BRM_fnc_doLog;

 mission_player_status set [_index, _packetPlayer];
 publicVariable "mission_player_status";