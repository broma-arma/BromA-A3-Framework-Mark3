// Time Limit
#ifndef PARAMS
	// When players will get a reminder of the remaining time, in seconds, in the mission.
	_remainderAlert = [60, 900, 3600, 7200];
#else
	// Time limit - -1: No limit, 60: 1 minute, 300: 5 minutes, 600: 10 minutes, 900: 15 minutes, 1800: 30 minutes, 2700: 45 minutes, 3600: 1 hour, 7200: 2 hours, 10800: 3 hours
	//#define TIMELIMIT_PARAM_LIMIT -1
	// Time added per objective - 0: Disabled, 1: 1 minute, 5: 5 minutes, 10: 10 minutes, 15: 15 minutes, 30: 30 minutes, 45: 45 minutes, 60: 1 hour
	//#define TIMELIMIT_PARAM_OBJECTIVE 0
#endif
