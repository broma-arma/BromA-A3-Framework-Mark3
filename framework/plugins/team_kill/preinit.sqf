player addEventHandler ["Hit", {
    #include "fn_teamKill.sqf"
}];

player addEventHandler ["Killed", {
    #include "fn_teamKill.sqf"
}];