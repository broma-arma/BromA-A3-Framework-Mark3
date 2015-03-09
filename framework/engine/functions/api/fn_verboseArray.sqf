_array = _this select 0;
_str = "";
{
    _punct = ", ";
    if (_forEachIndex+2 == (count _array)) then { _punct = " and " };
    if (_forEachIndex+1 == (count _array)) then { _punct = "" };
    _str = _str + _x + _punct;
} forEach _array;
_str