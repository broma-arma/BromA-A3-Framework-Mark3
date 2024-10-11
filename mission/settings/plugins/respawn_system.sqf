// Respawn System
#ifndef PARAMS
	// Number of lives each player on a side will have. -1 to use the mission parameter.
	_livesSideA = -1;
	_livesSideB = -1;
	_livesSideC = -1;
#else
	// Instant respawn - 0: Disabled, 1: Enabled
	//#define RESPAWNSYS_PARAM_INSTANT 0
	// Instant respawn lives - 1: 1, 3: 3, 5: 5, 10: 10
	//#define RESPAWNSYS_PARAM_LIVES 3
	// Respawns per completed objective - 0: 0, 3: 3, 5: 5, 10: 10, -1: Everyone
	//#define RESPAWNSYS_PARAM_OBJECTIVE -1
#endif
