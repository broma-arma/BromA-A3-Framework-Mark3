switch (true) do {
	case (vehicle player isKindOf "Man"): {
		setTerrainGrid CHVD_footTerrain;
	};
	case (vehicle player isKindOf "LandVehicle"): {
		setTerrainGrid CHVD_carTerrain;
	};
	case (vehicle player isKindOf "Air"): {
		setTerrainGrid CHVD_airTerrain;
	};
};