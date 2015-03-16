
_chair = _this select 0; 
_unit = _this select 1; 

deleteVehicle _chair;
_unit setVariable ["chair_holding", typeOf _chair, false];
_unitChair = _unit getVariable ["chair_holding", "nothing"];

deployChair = _unit addaction ["<t color='#0099FF'>Put chair down</t>",{ player spawn BRM_ChairPlugin_fnc_chairDeploy; }, _unit];

_localChair = _unitChair createVehicleLocal (position player);
_deployed = false;

while {(_unit call BRM_ChairPlugin_fnc_canHoldChair) && (_unitChair != "nothing")} do {
    _eyePos = (ASLtoATL eyePos player);
    _eyePos set [2, 0.8];
    _pos = _eyePos vectorAdd ( positionCameraToWorld [0,0,1] vectorDiff positionCameraToWorld [0,0,0]);
    _localChair setPos _pos;
    _localChair setDir (getDir _unit) - 180;
    _unitChair = _unit getVariable ["chair_holding", "nothing"];
};

deleteVehicle _localChair;

if (_unitChair != "nothing") then {
    player spawn BRM_ChairPlugin_fnc_chairDeploy;
};