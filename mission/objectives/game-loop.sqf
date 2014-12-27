if (!isServer) exitWith {};

[] spawn {
    sleep 1;
        
    #include "templates.h"    
    
    while {true} do {
        
        if ( OBJECT_DESTROYED(thisguy) ) then {
            ["newTask1","succeeded", true] call BRM_fnc_setTask;
        };
        
        if ( OBJECT_DESTROYED(thisguy2) ) then {
            ["newTask1","failed", true] call BRM_fnc_setTask;
        };
        
        if ( TASKS_STATE(mandatoryObjectivesA) == "succeeded") exitWith {
            END_MISSION("victory");
        };        
        
        if ( TASKS_STATE(mandatoryObjectivesA) == "failed") exitWith {
            END_MISSION("defeat");
        };

    sleep 3;
    };
};