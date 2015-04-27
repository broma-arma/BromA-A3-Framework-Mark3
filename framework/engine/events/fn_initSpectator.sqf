/*

    Initializes spectator units.

*/

(_this select 0) spawn {
    _this enableSimulation false;
    _this allowDamage false;
    _this setPos [0,0,random(50)+50];
    
    sleep 3;
        
    if ("cssa3_spectator" in usedPlugins) then {
        ["forced"] call CSSA3_fnc_createSpectateDialog;
    } else {
        _this setDamage 1;
    };
};