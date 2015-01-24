private["_ret"];

switch (_this select 0) do {
    case west: { _ret = 1 };
    case east: { _ret = 0 };
    case resistance: { _ret = 2 };
    case civilian: { _ret = 3 };
};

_ret