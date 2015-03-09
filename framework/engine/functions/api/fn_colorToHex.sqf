private ["_ret"];

switch (_this select 0) do {
    case "green": { _ret = "#006600"; };
    case "red": { _ret = "#e00d0d" };
    case "blue": { _ret = "#0060ff" };
    case "yellow": { _ret = "#ffd800" };    
    case "white": { _ret = "#FFFFFF" };
    case "black": { _ret = "#000000" };
    default { _ret = "#FFFFFF" };
};

_ret