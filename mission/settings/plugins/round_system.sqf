// Round System
#ifndef PARAMS
	// Delay, in seconds, before a round starts.
	_startDelay = 10;

	// Delay, in seconds, between rounds.
	_roundDelay = 15;

	// When players will get a reminder of the remaining time, in seconds, in the round.
	_remainderAlert = [60, 300, 900, 1800];

	// Victory conditions. Code that returns boolean.
	_victoryA = { sideAcondition };
	_victoryB = { sideBcondition };
	_victoryC = { sideCcondition };

	// Timeout winner.
	//   "SCORE" - Fewest deaths.
	//   "DRAW" - No winner.
	//   Side - Specified side wins. E.g. side_a_side or WEST
	_timeoutScoring = "SCORE";

	// Text to show when a round is won. %1 is replaced with the winner's name. A random one will be choosen.
	_victoryMessageA = ["%1 victory!", "%1 have won the round!"];
	_victoryMessageB = ["%1 victory!", "%1 have won the round!"];
	_victoryMessageC = ["%1 victory!", "%1 have won the round!"];

	// Text to show when a round ends in a draw. A random one will be choosen.
	_drawMessage = ["The round has ended in a draw!", "Draw!", "Nobody wins!"];

	// "NOTIFICATION" or "HINT"
	_roundEndAlertType = "NOTIFICATION";

	// Display scores after each round.
	_displayScore = true;

	// Setup zone radius, in meters.
	_setupRadius = 10;

	// Markers in which players will respawn. Each player will respawn at a randomly choosen one.
	_respawnMarkersA = [format ["respawn_%1", toLower str side_a_side]];
	_respawnMarkersB = [format ["respawn_%1", toLower str side_b_side]];
	_respawnMarkersC = [format ["respawn_%1", toLower str side_c_side]];
#else
	// Amount of rounds needed to win - 1: 1, 2: 2, 3: 3, 4: 4, 5: 5
	//#define ROUNDSYS_PARAM_ROUNDS 3
	// Time limit per round - 1: 1 minute, 5: 5 minutes, 15: 15 minutes, 30: 30 minutes, 60: 1 hour, -1: No limit
	//#define ROUNDSYS_PARAM_TIME 15
#endif
