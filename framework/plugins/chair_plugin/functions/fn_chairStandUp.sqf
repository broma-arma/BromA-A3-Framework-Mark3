
_this = _this select 3;

_chair = _this select 0; 
_unit = _this select 1; 

_unit enableSimulation true;
_unit switchMove "";  
_unit removeaction standChair;

_chair setVariable ["chair_occupied", false, true];
_unit setVariable ["unit_sitting", false, false];