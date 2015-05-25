_name = _this select 0;
_id = _this select 1;
_status = _this select 2;
_faction = _this select 3;

_arg1 = _this select 4;
_arg2 = _this select 5;
_arg3 = _this select 6;
_arg4 = _this select 7;

_side = _this select 8;

_skill = _this select 9;

_area  = _this select 10;
_ax = _area select 0;
_ay = _area select 1;
_aa = _area select 2;
_as = _area select 3;

_pos = _this select 11;

call compile format ["
%1 = createTrigger ['EmptyDetector', %15];
%1 setTriggerArea [%11, %12, %13, %14];
%1 setTriggerActivation ['NONE', 'NOT PRESENT', false];
_statement = ""null=['%1',[%2,%3,%4], %5, %6, %7, %8, [%9, %9, %10,0]] spawn DAC_Zone"";
%1 setTriggerStatements ['(time > 5)', _statement, ''];", _name, _id, _status, _faction, _arg1, _arg2, _arg3, _arg4, _side, _skill, _ax, _ay, _aa, _as, _pos];

mission_dac_zones pushBack [_name,_id]; 

publicVariable "mission_dac_zones";