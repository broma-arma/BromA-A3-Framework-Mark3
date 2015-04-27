
if (!hasInterface) exitWith {};

if (mission_spawn_protection_time <= 1) exitWith {};

0 spawn {

waitUntil {!isNull player};

#include "includes\settings.sqf"

private["_side_a_marker","_side_b_marker","_side_c_marker","_tvtEnabled"];

_areasize = spawn_protection_area;
_tvtEnabled = !(mission_game_mode == "coop");

switch(side_a_side) do {
    case WEST: { _side_a_marker = "respawn_west" };
    case EAST: { _side_a_marker = "respawn_east" };
    case RESISTANCE: { _side_a_marker = "respawn_resistance" };
    case CIVILIAN: { _side_a_marker = "respawn_civilian" };
};

switch(side_b_side) do {
    case WEST: { _side_b_marker = "respawn_west" };
    case EAST: { _side_b_marker = "respawn_east" };
    case RESISTANCE: { _side_b_marker = "respawn_resistance" };
    case CIVILIAN: { _side_b_marker = "respawn_civilian" };
};

switch(side_c_side) do {
    case WEST: { _side_c_marker = "respawn_west" };
    case EAST: { _side_c_marker = "respawn_east" };
    case RESISTANCE: { _side_c_marker = "respawn_resistance" };
    case CIVILIAN: { _side_c_marker = "respawn_civilian" };
};

_PlayerInAreas		= [];
_OldPlayerInAreas 	= [];

_PlayerInAreas2		= [];
_OldPlayerInAreas2 	= [];

_PlayerInAreas3		= [];
_OldPlayerInAreas3 	= [];

_TriggerList 	 	= [];
_TriggerList2 	 	= [];
_TriggerList3 	 	= [];

_Debug 			= false;

// =============================================================================

// SIDE_A ZONE

_Pos			= getMarkerPos _side_a_marker;
_SpawnProtection        = createTrigger ["EmptyDetector",_Pos]; 
_SpawnProtection setTriggerArea [_areasize,_areasize,0,true]; 
_SpawnProtection setTriggerActivation ["ANY","PRESENT",true];
_SpawnProtection setTriggerStatements ["","",""];
_TriggerList set [count _TriggerList, [_SpawnProtection, side_a_side]];

side_a_spawn_marker = createMarkerLocal [str(random(100)), getPos _SpawnProtection];
side_a_spawn_marker setMarkerShapeLocal "ELLIPSE";
side_a_spawn_marker setMarkerColorLocal "color"+side_a_color;
side_a_spawn_marker setMarkerPosLocal (position _SpawnProtection );
side_a_spawn_marker setMarkerBrushLocal "SolidBorder";
side_a_spawn_marker setMarkerAlphaLocal 0.2;
side_a_spawn_marker setMarkerDirLocal (triggerArea _SpawnProtection select 2 );    
side_a_spawn_marker setMarkerSizeLocal [( triggerArea _SpawnProtection select 0),(triggerArea _SpawnProtection select 1)]; 
// =============================================================================

// =============================================================================
if (_tvtEnabled) then {
    
// SIDE_B ZONE

_Pos			= getMarkerPos _side_b_marker;
_SpawnProtection2       = createTrigger ["EmptyDetector",_Pos];
_SpawnProtection2 setTriggerArea [_areasize, _areasize,0,true]; 
_SpawnProtection2 setTriggerActivation ["ANY","PRESENT",true];
_SpawnProtection2 setTriggerStatements ["","",""];
_TriggerList2 set [count _TriggerList2, [_SpawnProtection2, side_b_side]];

side_b_spawn_marker = createMarkerLocal [str(random(100)), getPos _SpawnProtection2];
side_b_spawn_marker setMarkerShapeLocal "ELLIPSE";
side_b_spawn_marker setMarkerColorLocal "color"+side_b_color;
side_b_spawn_marker setMarkerPosLocal (position _SpawnProtection2);
side_b_spawn_marker setMarkerBrushLocal "SolidBorder";
side_b_spawn_marker setMarkerAlphaLocal 0.2;
side_b_spawn_marker setMarkerDirLocal (triggerArea _SpawnProtection2 select 2);    
side_b_spawn_marker setMarkerSizeLocal  [( triggerArea _SpawnProtection2 select 0),(triggerArea _SpawnProtection2 select 1)]; 
};
// =============================================================================

if (mission_enable_side_c) then {
// =============================================================================

// SIDE_C ZONE

_Pos			= getMarkerPos _side_a_marker;
_SpawnProtection3        = createTrigger ["EmptyDetector",_Pos]; 
_SpawnProtection3 setTriggerArea [_areasize, _areasize,0,true]; 
_SpawnProtection3 setTriggerActivation ["ANY","PRESENT",true];
_SpawnProtection3 setTriggerStatements ["","",""];
_TriggerList3 set [count _TriggerList3, [_SpawnProtection3, side_c_side]];

side_c_spawn_marker = createMarkerLocal [str(random(100)), getPos _SpawnProtection3];
side_c_spawn_marker setMarkerShapeLocal "ELLIPSE";
side_c_spawn_marker setMarkerColorLocal "color"+side_c_color;
side_c_spawn_marker setMarkerPosLocal (position _SpawnProtection3 );
side_c_spawn_marker setMarkerBrushLocal "SolidBorder";
side_c_spawn_marker setMarkerAlphaLocal 0.2;
side_c_spawn_marker setMarkerDirLocal (triggerArea _SpawnProtection3 select 2 );    
side_c_spawn_marker setMarkerSizeLocal  [( triggerArea _SpawnProtection3 select 0),(triggerArea _SpawnProtection3 select 1)]; 

// =============================================================================    
};

sleep 1;

_InZoneArea = [];
    
while {(mission_spawn_protection_time > time)} do {

    {
        _InZoneArea = _x select 0;
        _InZoneArea = list _InZoneArea;
        _SideZone 	= _x select 1;
        
        if (isNil "_InZoneArea") then { _InZoneArea = [] };
        
        if (count(_InZoneArea) > 0) then {
        {
            // For infantry
            if (side _x == _SideZone) then {
                _x allowDamage false;
                _PlayerInAreas set [count _PlayerInAreas, _x];
            };	
            
            // For vehicles
                if(((_x isKindOf  "Air") ||(_x isKindOf  "Car")||(_x isKindOf  "Ship") ||(_x isKindOf  "Tank")||(_x isKindOf  "Helicopter")))then {
                    if (count crew _x > 0) then {
                        _PlayerInAreas set [count _PlayerInAreas, _x];
                        _x allowDamage false;
                        _friendlies = false;
                        {
                            if(side _x == _SideZone)then{ _x allowDamage false;_PlayerInAreas set [count _PlayerInAreas, _x];};
                        } forEach (crew _x);
                    } else { _x allowDamage false; _PlayerInAreas set [count _PlayerInAreas, _x];};
                };
        } forEach _InZoneArea;

                // Find the player who left the area and setDamage true
                {
                        if (!(_x in _PlayerInAreas)) then {
                            
                                _x allowDamage true;
                                
                                if (_Debug) then { hint format ["left the area %1", _x];};
                        } else { if(_Debug) then { hint format  ["in the area %1", _x];};};
                } forEach _OldPlayerInAreas;
         };       
    } forEach _TriggerList;
    
    // Refresh the Index
    _OldPlayerInAreas = _PlayerInAreas;
    _PlayerInAreas = [];      
    
// =============================================================================    
    
    {
        _InZoneArea = _x select 0;
        _InZoneArea = list _InZoneArea;
        _SideZone 	= _x select 1;
        
        if (isNil "_InZoneArea") then { _InZoneArea = [] };
        
        if (count(_InZoneArea) > 0) then {
        {          
            // For infantry
            if (side _x == _SideZone) then {
                _x allowDamage false;
                _PlayerInAreas2 set [count _PlayerInAreas2, _x];                
            };	
            
            // For vehicles
                if(((_x isKindOf  "Air") ||(_x isKindOf  "Car")||(_x isKindOf  "Ship") ||(_x isKindOf  "Tank")||(_x isKindOf  "Helicopter")))then {
                    if (count crew _x > 0) then {
                        _PlayerInAreas2 set [count _PlayerInAreas2, _x];
                        _x allowDamage false;
                        _friendlies = false;
                        {
                            if(side _x == _SideZone)then{ _x allowDamage false;_PlayerInAreas2 set [count _PlayerInAreas2, _x];};
                        } forEach (crew _x);
                    } else { _x allowDamage false; _PlayerInAreas2 set [count _PlayerInAreas2, _x];};
                };
        } forEach _InZoneArea;

                // Find the player who left the area and setDamage true
                {
                        if (!(_x in _PlayerInAreas2)) then {
                            
                                _x allowDamage true;
                                
                                if (_Debug) then { hint format ["left the area %1", _x];};
                        } else { if(_Debug) then { hint format  ["in the area %1", _x];};};
                } forEach _OldPlayerInAreas2;
        };
    } forEach _TriggerList2;    

    // Refresh the Index
    _OldPlayerInAreas2 = _PlayerInAreas2;
    _PlayerInAreas2 = []; 
    
// =============================================================================    
    
    {
        _InZoneArea = _x select 0;
        _InZoneArea = list _InZoneArea;
        _SideZone 	= _x select 1;
        
        if (isNil "_InZoneArea") then { _InZoneArea = [] };
        
        if (count(_InZoneArea) > 0) then {
        {          
            // For infantry
            if (side _x == _SideZone) then {
                _x allowDamage false;
                _PlayerInAreas3 set [count _PlayerInAreas3, _x];                
            };	
            
            // For vehicles
                if(((_x isKindOf  "Air") ||(_x isKindOf  "Car")||(_x isKindOf  "Ship") ||(_x isKindOf  "Tank")||(_x isKindOf  "Helicopter")))then {
                    if (count crew _x > 0) then {
                        _PlayerInAreas3 set [count _PlayerInAreas3, _x];
                        _x allowDamage false;
                        _friendlies = false;
                        {
                            if(side _x == _SideZone)then{ _x allowDamage false;_PlayerInAreas3 set [count _PlayerInAreas3, _x];};
                        } forEach (crew _x);
                    } else { _x allowDamage false; _PlayerInAreas3 set [count _PlayerInAreas3, _x];};
                };
        } forEach _InZoneArea;

                // Find the player who left the area and setDamage true
                {
                        if (!(_x in _PlayerInAreas3)) then {
                            
                                _x allowDamage true;
                                
                                if (_Debug) then { hint format ["left the area %1", _x];};
                        } else { if(_Debug) then { hint format  ["in the area %1", _x];};};
                } forEach _OldPlayerInAreas3;
        };
    } forEach _TriggerList3;    

    // Refresh the Index
    _OldPlayerInAreas3 = _PlayerInAreas3;
    _PlayerInAreas3 = [];     
    
    sleep 1;
};

fnc_removeProtection = {
    {
        _InZoneArea = _x select 0;
        _InZoneArea = list _InZoneArea;

        if (isNil "_InZoneArea") then { _InZoneArea = [] };

        if (count(_InZoneArea) > 0) then {
            {
                _x allowDamage true;

                if(((_x isKindOf  "Air") ||(_x isKindOf  "Car")||(_x isKindOf  "Ship") ||(_x isKindOf  "Tank")||(_x isKindOf  "Helicopter")))then {
                    if (count crew _x > 0) then {
                        _x allowDamage true;
                        { _x allowDamage true } forEach (crew _x);
                    } else { _x allowDamage true };
                };
            } forEach _InZoneArea;
        };
    } forEach _this;
};

["Alert",["Spawn protection is disabled!"]] call BIS_fnc_showNotification;

deleteMarker side_a_spawn_marker;
_TriggerList call fnc_removeProtection;

if (_tvtEnabled) then { deleteMarker side_b_spawn_marker; _TriggerList2 call fnc_removeProtection };
if (mission_enable_side_c) then { deleteMarker side_c_spawn_marker; _TriggerList3 call fnc_removeProtection };

};