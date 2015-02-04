_name = _this select 0;
_id = _this select 1;
_status = _this select 2;

_arg1 = _this select 3;
_arg2 = _this select 4;
_arg3 = _this select 5;
_arg4 = _this select 6;

_side = _this select 7;

_area  = _this select 8;
_ax = _area select 0;
_ay = _area select 1;
_aa = _area select 2;
_as = _area select 3;

_pos = _this select 9;

call compile format ["
%1 = createTrigger ['EmptyDetector', %13];
%1 setTriggerArea [%9, %10, %11, %12];
%1 setTriggerActivation ['NONE', 'NOT PRESENT', false];
_statement = ""null=['%1',[%2,%3,1], %4, %5, %6, %7, [%8, %8, 0,0]] spawn DAC_Zone"";
%1 setTriggerStatements ['(time > 1)', _statement, ''];", _name, _id, _status, _arg1, _arg2, _arg3, _arg4, _side, _ax, _ay, _aa, _as, _pos];

mission_dac_zones pushBack _name; 

publicVariable "mission_dac_zones";