if !(hasInterface) exitWith {};
if !(player_is_jip) exitWith {};

0 spawn {
    
if ("prevent_reslot" in usedPlugins) then {
    waitUntil{(player getVariable ["unit_valid_slot", false])};
};

Revive_TelepSquad = {
	Private["_revive_Keypressed"];
	if (alive player) then {
		_revive_Keypressed = (findDisplay 46) displayAddEventHandler ["KeyUp","_this call Revive_Keypressedcode"];
                cutText ["Press the SPACE BAR within the next 5 minutes to teleport with your squad/allies.","PLAIN DOWN",2];
		Sleep 400;
		(findDisplay 46) displayRemoveEventHandler ["KeyUp",_revive_Keypressed]
	};
};

Revive_Keypressedcode = {
	Private["_target","_Escuadra","_Lider","_tmpos","_tmposALT","_tmposX","_tmposY","_tmposZ","_done"];
	if ((_this select 1) == 57) then{
		_Lider = (leader player);
		_target= objnull; // Not valid leader
		if (_Lider == player) then
		{
			_Escuadra = units (group player);
			{
				if ((alive _x)&&(_x!=player)) then {
                                    _target= _x;
				};
			} foreach _Escuadra;
			if (isnull _target) then
			{
				_Escuadra = allunits;
				{
					if ((alive _x) && (isplayer _x)&&(_x!=player)) then {
						if ((side _x) == playerside) then {
							_target = _x;
						};
					};
				} foreach _Escuadra;
			};
		} else { _target= _Lider};
		if (!isnull _target) then
		{
			_tmpos= getPosATL _target;
			_tmposX=_tmpos select 0; _tmposY=_tmpos select 1; _tmposZ=_tmpos select 2;
			_tmpos set[0,(_tmposX+ (random 2) -1)];
			_tmpos set[1,(_tmposY+ (random 2) -1)];
			
			if (_tmposZ > 1) then {
			
				//Detect buildings
				_tmposALT=_tmpos findEmptyPosition [1,30, typeof player];
				if ((count _tmposALT) > 1) then {_tmpos=_tmposALT};
			};
			
                        _vehtg = (vehicle _target);

                        if (_vehtg == _target) then { player setPosATL _tmpos; _done = true } else {
                            _vehtg engineOn true;
                            switch(true) do {
                                case (_vehtg emptyPositions "driver" > 0) : { player moveinDriver _vehtg; _done = true };
                                case (_vehtg emptyPositions "commander" > 0) : { player moveinCommander _vehtg; _done = true };
                                case (_vehtg emptyPositions "gunner" > 0) : { player moveinGunner _vehtg; _done = true };
                                case (_vehtg emptyPositions "cargo" > 0) : { player moveinCargo _vehtg; _done = true };
                                case (_vehtg emptyPositions "cargo" == 0) : { 
                                    cutText ["You squad leader is in a full vehicle - wait for an empty seat.","PLAIN DOWN",2];
                                    _done = false; 
                                };
                            };
                        };
                        if (_done) then {
                        cutText [" ","PLAIN DOWN",2];
			Revive_Keypressedcode = {false};
                        };
		};
	};
	false;
};

    [] spawn Revive_TelepSquad;
};