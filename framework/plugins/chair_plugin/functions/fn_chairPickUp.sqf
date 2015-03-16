
_chair = _this select 0; 
_unit = _this select 1; 

deleteVehicle _chair;
_unit setVariable ["chair_holding", typeOf _chair, false];
_unitChair = _unit getVariable ["chair_holding", "nothing"];

deployChair = _unit addaction ["<t color='#0099FF'>Put chair down</t>",{ player spawn BRM_ChairPlugin_fnc_chairDeploy; }, _unit];

_localChair = _unitChair createVehicleLocal (position player);
_deployed = false;

MYPOSX = 1;
MYPOSY = 1;
MYPOSZ = 1;

while {(_unit call BRM_ChairPlugin_fnc_canHoldChair)} do {
    _eyePos = (ASLtoATL eyePos player);
    _eyePos set [2, 0.8];
    _pos = _eyePos vectorAdd ( positionCameraToWorld [0,0,0] vectorDiff positionCameraToWorld [0,1,-2]);
    _localChair setPos _pos;
    _localChair setDir (getDir _unit) - 180;
};

if (_unit getVariable ["chair_holding", "nothing"] != "nothing") then {
    player spawn BRM_ChairPlugin_fnc_chairDeploy;
};
deleteVehicle _localChair;