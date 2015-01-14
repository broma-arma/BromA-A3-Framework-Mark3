if (mission_dead_civies == -1) exitWith {};

if (isNil "hostile_civilians") then { hostile_civilians = [] };
if ( isnil "dead_civilians" ) then { dead_civilians = 0 };

fnc_deadHostileCivilian = {
    _killed = _this select 0;
    _killed removeAllEventHandlers "mpkilled";
};

fnc_CivFiredWeapon = {
    _unit = _this select 0;
    _unit addMPEventHandler ["mpkilled", fnc_deadHostileCivilian];
    
    if !(_unit in hostile_civilians) then {
        hostile_civilians pushBack _unit; 
        publicVariable "hostile_civilians";
        _unit addRating -10000;
        diag_log format ["== SERVER: %1 IS NOW CONSIDERED HOSTILE ==========================",_unit];
    };
};
  
// Function to update death counter.
fnc_countCivDeaths = {
    _killed = _this select 0;
    _killer = _this select 1;

    if !(_killed in hostile_civilians) then {
        if ((isPlayer _killer)&&(side _killer in [side_a_side])) then {
            dead_civilians = dead_civilians + 1; publicvariable "dead_civilians";
            diag_log format ["== SERVER: %2 HAS KILLED CIVILIAN %1 =============================", name _killed, name _killer];
            [-1, {
                hint format ["CIVILIAN CASUALTIES: %1 out of %2", _this select 0, _this select 1];
            }, [dead_civilians, mission_dead_civies]] call CBA_fnc_globalExecute;
        };
    };

// Checks if the max number of civies is beyond the limit
    if (dead_civilians >= mission_dead_civies) then {
        ["defeat"] call BRM_fnc_callEnding;
    };
};

publicVariable "fnc_CivFiredWeapon";

// Add killed -eventhandler to all civilians.
{
    if (side _x == civilian) then {
      _x addEventHandler ["fired", fnc_CivFiredWeapon];
      _x addMPEventHandler ["mpkilled", fnc_countCivDeaths];
    };
} foreach allUnits;