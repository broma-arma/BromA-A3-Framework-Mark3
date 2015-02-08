mission_valid_groups = [];
mission_valid_groups_BLU = [];
mission_valid_groups_OP = [];
mission_valid_groups_IND = [];
mission_valid_groups_CIV = [];
if (isServer) then {
    _validSides = [west, east, resistance, civilian];
    {
        _leader = objNull;
        { if (isFormationLeader _x) then { _leader = _x } } forEach (units _x);
        _side = (side _leader);
        _groupID = groupID _x;
        _push = [_groupID, _side];
        if ( (!(_push in mission_valid_groups)) && (_side in _validSides) && (isPlayer _leader)) then {
            mission_valid_groups pushBack _push;
            publicVariable "mission_valid_groups";
            
            switch (true) do {
                case(_side == WEST): { mission_valid_groups_BLU pushBack (_push + [(count mission_valid_groups_BLU) + 1]); publicVariable "mission_valid_groups_BLU" };
                case(_side == EAST): { mission_valid_groups_OP pushBack (_push + [(count mission_valid_groups_OP) + 1]); publicVariable "mission_valid_groups_OP" };
                case(_side == RESISTANCE): { mission_valid_groups_IND pushBack (_push + [(count mission_valid_groups_IND) + 1]); publicVariable "mission_valid_groups_IND" };
                case(_side == CIVILIAN): { mission_valid_groups_CIV pushBack (_push + [(count mission_valid_groups_CIV) + 1]); publicVariable "mission_valid_groups_CIV" };
            };
        };
    } forEach allGroups;
    
    _formatFreqs = {
        _groups = _this;
        _ret = "";
        {
            _add = format ["%1 - ch. %2 SR<br/>",(_x select 0),(_x select 2)];
            _ret = _ret + _add;
        } forEach _groups;
        _ret
    };
    
    mission_radiochannels_BLU = mission_valid_groups_BLU call _formatFreqs; publicVariable "mission_radiochannels_BLU";
    mission_radiochannels_OP = mission_valid_groups_OP call _formatFreqs; publicVariable "mission_radiochannels_OP";
    mission_radiochannels_IND = mission_valid_groups_IND call _formatFreqs; publicVariable "mission_radiochannels_IND";
    mission_radiochannels_CIV = mission_valid_groups_CIV call _formatFreqs; publicVariable "mission_radiochannels_CIV";
    
};