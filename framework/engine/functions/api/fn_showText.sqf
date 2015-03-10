
_array = _this select 0;

{
    titleText [(_x select 0), (_x select 1)];
    sleep (_x select 2);
} forEach _array;