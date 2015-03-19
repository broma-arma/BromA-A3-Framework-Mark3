case "ESTABLISHING": {
    [player, toUpper(worldName)+", "+(_posPlayer call BIS_fnc_locationDescription), 1.5, 1, 280, 0] spawn BIS_fnc_establishingShot;
    0 spawn {
        sleep 15;
        enableSaving [false, false];
    };        
};

case "TEXT": {
    [[
        [toUpper(worldName) + ", ","align='left' valign='bottom' font='PuristaBold'",""],
        [_posPlayer call BIS_fnc_locationDescription,"align='left'","#fff"]
    ]] spawn BIS_fnc_typeText2;    
};

case "CINEMA": {
    _location = nearestLocation [ getPos player, "nameVillage"];
    _location = text _location;
    if (_location == "") then { _location = "Virtual Reality" };
    _minute = (date select 4); if ([str(_minute)] call CBA_fnc_strLen == 1) then { _minute = "0"+str(_minute) };

    _time = format ["%1:%2",(date select 3),_minute];

    [0,2,false,true] call BIS_fnc_cinemaBorder;

    [_location, _time] spawn BIS_fnc_infoText;

    sleep 3;
    [1,2,false,true] call BIS_fnc_cinemaBorder;

    enableSaving [false, false];
};

case "CUSTOM": {

};