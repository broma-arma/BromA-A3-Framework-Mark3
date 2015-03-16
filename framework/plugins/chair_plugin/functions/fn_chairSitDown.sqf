//////////////////////////////////////////////////////////////////////////
//                       Original Script Made By                        //
//                                MacRae                                //
//                                                                      //
//                     Further modifications by Nife                    //
//////////////////////////////////////////////////////////////////////////

MAC_fnc_switchMove = {
    private["_object","_anim"];
    _object = _this select 0;
    _anim = _this select 1;

    _object switchMove _anim;
};

_chair = _this select 0; 
_unit = _this select 1; 

_chair setVariable ["chair_occupied", true, true];
_unit setVariable ["unit_sitting", true, false];

_sitting = chair_sitting_positions call BIS_fnc_selectRandom;

[[_unit, _sitting select 0], "MAC_fnc_switchMove"] spawn BIS_fnc_MP; 
_unit setPos (getPos _chair); 
standChair = _unit addaction ["<t color='#0099FF'>Stand up</t>",{_this spawn BRM_ChairPlugin_fnc_chairStandUp},[_chair, _unit]];
_unit setpos [getpos _unit select 0, getpos _unit select 1,((getpos _unit select 2) + (_sitting select 1))];

sleep 1;
_unit setDir ((getDir _chair) - 180);
player enableSimulation false;