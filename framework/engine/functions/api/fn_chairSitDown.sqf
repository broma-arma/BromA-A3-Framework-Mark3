//////////////////////////////////////////////////////////////////////////
//                            Script Made By                            //
//                                MacRae                                //
//                                                                      //
//                                                                      //
//1.Place a Camping Chair on the map.                                   //
//                                                                      //
//2.Add this to the Camping chair Init:                                 //
//this addAction ["<t color='#0099FF'>Sit Down</t>","Chair\sitdown.sqf"]//
//                              4D6163526165                            //
//////////////////////////////////////////////////////////////////////////

MAC_fnc_switchMove = {
    private["_object","_anim"];
    _object = _this select 0;
    _anim = _this select 1;

    _object switchMove _anim;
};

_chair = _this select 0; 
_unit = _this select 1; 

[[_unit, "Crew"], "MAC_fnc_switchMove"] spawn BIS_fnc_MP; 
_unit setPos (getPos _chair); 
standup = _unit addaction ["<t color='#0099FF'>Stand up</t>",{
    player enableSimulation true;
    player switchMove "";  
    player removeaction standup;
}];
_unit setpos [getpos _unit select 0, getpos _unit select 1,((getpos _unit select 2) +1)];

sleep 0.5;
_unit setDir ((getDir _chair) - 180);
player enableSimulation false;