
private ["_seats"];

_vehicle = _this select 0;
_vehicleSeat = _this select 1;

if (_vehicle emptyPositions toLower(_vehicleSeat) <= 0) then { 
_seats = ["cargo", "gunner", "driver", "commander"] } else { _seats = [_vehicleSeat] };

{ call compile format [
"if (_vehicle emptyPositions '%1' > 0) then { 
[-1, { (_this select 0) enableSimulation (_this select 1) }, [_vehicle, false]] call CBA_fnc_globalExecute;
_vehicle allowDamage false;
player moveIn%1 _vehicle;
sleep 3;
_vehicle allowDamage true;
[-1, { (_this select 0) enableSimulation (_this select 1) }, [_vehicle, true]] call CBA_fnc_globalExecute;
}"
, _x] } forEach _seats;