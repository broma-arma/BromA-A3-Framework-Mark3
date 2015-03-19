sleep 2;
_logic =  _this select 0;
_radius = _this select 1;
_time =   _this select 2;
_side =   _this select 3;

_pos = getMarkerPos _logic;
_dir = 0;
_startedVarName = "sandi_setup_done_" + (str _side);

if (isServer) then { // server
  [_time, _side, _startedVarName] spawn {
    _time = _this select 0;
    _side = _this select 1;
    _startedVarName = _this select 2;
    
    if ("commander_lock" in usedPlugins) then {
        if (co_lock_tvt_mode) then {
            waitUntil{(co_lock_allSidesReady)};
        };
    } else {    
        sleep _time; // wait for setup to end
    };
    
    missionNamespace setVariable [_startedVarName, true];
    publicVariable _startedVarName;
  };
};

if (!isDedicated) then { // player 

  waitUntil {!isNull player};
  
  if (side player == _side) then {
  
    if (isNil _startedVarName) then { // setup
    
      _name = "setup_" + str _side;
      createMarkerLocal [_name, _pos];
      _name setMarkerDirLocal _dir;
      _name setMarkerShapeLocal "RECTANGLE"; 
      _name setMarkerSizeLocal [_radius, _radius];
      _name setMarkerBrushLocal "Border";
      
      if (_side == side_a_side) then { _name setMarkerColorLocal "color"+side_a_color };
      if (_side == side_b_side) then { _name setMarkerColorLocal "color"+side_b_color };
      if (_side == side_c_side) then { _name setMarkerColorLocal "color"+side_c_color };

      // make barrier
      _barrierHandle = [_pos, _radius, _radius, _dir, "rectangle", "You cannot leave the setup area until the time is over."] call BRM_SetupZone_fnc_registerZone;
      
      sleep 5;
      _timetype = "";
      if !("commander_lock" in usedPlugins) then {
              if (_time < 60) then { _timetype = "seconds" } else { _timetype = "minutes" };
              ["MissionBegins",[(str _time)+" "+_timetype]] call bis_fnc_showNotification;
      } else {
        if (co_lock_tvt_mode) then {
            ["Alert",["The mission will begin when all teams are ready."]] call bis_fnc_showNotification;
        };
      };
      
      [_startedVarName, _barrierHandle, _name] spawn {
        _startedVarName = _this select 0;
        _barrierHandle = _this select 1;
        _markerName = _this select 2;
        
        waitUntil {!isNil _startedVarName};

        sandi_barrier_barriers set [_barrierHandle, 0];
        deleteMarkerLocal _markerName;
        if !("commander_lock" in usedPlugins) then {
            if (co_lock_tvt_mode) then {
                ["Alert",["Mission is starting!"]] call bis_fnc_showNotification;  
            };            
        };        
      };
    };
  };
};