if (!isServer) exitWith {};

_center = createCenter sideLogic;
_group = createGroup _center;

_module = _group createUnit ["DAC_Source_Extern", [0,0,0],[],0.5,"NONE"];