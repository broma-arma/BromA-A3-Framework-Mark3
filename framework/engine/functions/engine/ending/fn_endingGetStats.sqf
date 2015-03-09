//  Starts the variables up.
//private["_finalPercent", "_reason"];
//_reason = _this select 0;
//_time = countdown;
// =============================================================================    

// =============================================================================
//  Counts all the units in the game and assigns them into variables.
//
//if (isServer) then {
//    numWEST = count f_var_units_BLU; publicvariable "numWEST";
//    numEAST = count f_var_units_OPF; publicvariable "numEAST";
//    numGUER = count f_var_units_RES; publicvariable "numGUER";
//    numCIV = count f_var_units_CIV; publicvariable "numCIV";
//    
//    countUnitsPlayer = count f_var_units_PLAYERSIDE; publicVariable "countUnitsPlayer";
//    countUnitsEnemy = count f_var_units_ENEMYSIDE; publicVariable "countUnitsEnemy";
//};
// =============================================================================

//  Receives the original ending number.

//victoryReason = _reason; publicvariable "victoryReason";

//[] execVM (CUSTOM_FILES_PATH+"endings.sqf");
// =============================================================================
/* 
    Now here we calculate the number of deaths in the mission in a percentage:
    depending on how many players died for each side, the "margin" variable
    will be change accordingly to reflect the winner, and for how much.
*/
//    percentPlayer = floor ((100/countUnitsEnemy) * pointsPlayerSide);
//    percentEnemy = floor ((100/countUnitsPlayer) * pointsEnemySide);
//
//    _finalPercent = percentPlayer - percentEnemy;

// =============================================================================   
// Declare the margin for victory
// -- you don't really need to worry about this --
//
//if (isNil "margin") then {
//    
//    switch(true) do {
//        
//        case (_finalPercent > 0 && _finalPercent < 20):  {
//            margin = format["PYRRHIC %1 VICTORY", playerFactionName]; publicVariable "margin";
//            color = colorPlayerSide;
//        };
//
//        case (_finalPercent > 20 && _finalPercent < 90): {
//            margin = format["MARGINAL %1 VICTORY", playerFactionName]; publicVariable "margin";
//            color = colorPlayerSide;
//        };
//
//        case (_finalPercent >= 90): {
//            margin = format["ABSOLUTE %1 VICTORY", playerFactionName]; publicVariable "margin";
//            color = colorPlayerSide;
//        };
//
//        case (_finalPercent < 0 && _finalPercent > -20): {
//            margin = format["PYRRHIC %1 VICTORY", enemyFactionName]; publicVariable "margin";
//            color = colorEnemySide;
//        };
//
//        case (_finalPercent < -20 && _finalPercent > -90): {
//            margin = format["MARGINAL %1 VICTORY", enemyFactionName]; publicVariable "margin";
//            color = colorEnemySide;
//        };
//        
//        case (_finalPercent <= -90): {
//            margin = format["ABSOLUTE %1 VICTORY", enemyFactionName]; publicVariable "margin";
//            color = colorEnemySide;
//        };    
//
//        case (_finalPercent == 0): {
//            margin = "STALEMATE"; publicVariable "margin";
//            color = "yellow";
//        };    
//        
//        default {
//            margin = "CASUALTIES:"; publicVariable "margin";
//        };
//    };
//
//};
// =============================================================================
//  Lets the server calculate mission time so there is no desync between players.

_hours = time / 3600;
_remainder = time % 3600;
_minutes = _remainder / 60;
_seconds = _remainder % 60;

_hours = round(_hours);
_minutes = round(_minutes);
_seconds = round(_seconds);
// =============================================================================

mission_ending_stats = [_hours,_minutes,_seconds];
publicVariable "mission_ending_stats";