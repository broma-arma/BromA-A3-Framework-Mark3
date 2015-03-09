_updateType = [_this, 0, 0, [0]] call BIS_fnc_param;

switch (true) do {
	case (vehicle player isKindOf "Man"): {
		if (_updateType == 1 || _updateType == 0 || _updateType == 3) then {
			setViewDistance CHVD_foot;
		};
		if (_updateType == 2 || _updateType == 0 || _updateType == 3) then {
			setObjectViewDistance [CHVD_footObj,100];
		};
	};
	case (vehicle player isKindOf "LandVehicle"): {
		if (_updateType == 1 || _updateType == 0 || _updateType == 3) then {
			setViewDistance CHVD_car;
		};
		if (_updateType == 2 || _updateType == 0 || _updateType == 3) then {
			setObjectViewDistance [CHVD_carObj,100];
		};
	};
	case (vehicle player isKindOf "Air"): {
		if (_updateType == 1 || _updateType == 0 || _updateType == 3) then {
			setViewDistance CHVD_air;
		};
		if (_updateType == 2 || _updateType == 0 || _updateType == 3) then {
			setObjectViewDistance [CHVD_airObj,100];
		};
	};
};
if (_updateType == 0) then {
	[] call CHVD_fnc_updateTerrain;
};