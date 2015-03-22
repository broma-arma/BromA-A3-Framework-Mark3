if (!isServer) exitWith {};

gl_fnc_areaClear = {
	private ["_area", "_side", "_max", "_count"];
	_area = _this select 0;
	_side = _this select 1;
	_max = _this select 2;
	_count = 0;
	{ // forEach
		if ((alive _x) && {(side _x) == _side} && {!(_x getVariable ["ace_sys_wounds_uncon", false])} && {[_x, _area] call cba_fnc_inArea}) then {
			_count = _count + 1;
		};
		if (_count > _max) exitWith {};
	} forEach allUnits;
	_count <= _max
};

gl_fnc_areaOccupied = {
	private ["_area", "_side", "_min", "_count"];
	_area = _this select 0;
	_side = _this select 1;
	_min = _this select 2;
	_count = 0;
	{ // forEach
		if ((alive _x) && {(side _x) == _side} && {!(_x getVariable ["ace_sys_wounds_uncon", false])} && {[_x, _area] call cba_fnc_inArea}) then {
			_count = _count + 1;
		};
		if (_count >= _min) exitWith {};
	} forEach allUnits;
	_count >= _min
};

gl_fnc_checkCasualties = {
	private ["_side", "_limit", "_totalCount", "_aliveCount"];
	_side = _this select 0;
	_limit = _this select 1;
	_totalCount = {(side _x) == _side} count allUnits;
	_aliveCount = { // count
		((side _x) == _side) &&
		{alive _x} &&
		{!(_x getVariable ["ace_sys_wounds_uncon", false])} &&
		{!(_x getVariable ["spectating", false])}
	} count allUnits;
	_aliveCount < (_totalCount * ((_limit - 1) / 100))
};