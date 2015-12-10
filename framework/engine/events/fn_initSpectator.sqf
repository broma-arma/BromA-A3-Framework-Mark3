/*

    Initializes spectator units.

*/

(_this select 0) spawn {
    _this enableSimulation false;
    _this allowDamage false;
    _this setPos [0,0,30];

    sleep 3;

    switch (true) do {
        case ("cssa3_spectator" in usedPlugins): {
            ["forced"] call CSSA3_fnc_createSpectateDialog;
        };
        case ("ace3_spectator" in usedPlugins): {
            [true] call ace_spectator_fnc_setSpectator;
        };
        default { _this setDamage 1 };
    };
};