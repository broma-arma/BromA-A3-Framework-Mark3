class p_time_limit {
	title = "Time limit";
	values[] = {       -1,         60,          600,          900,         1800,         2700,     3600,      7200,     10800};
	texts[] = {"No limit", "1 minute", "10 minutes", "15 minutes", "30 minutes", "45 minutes", "1 hour", "2 hours", "3 hours"};
	default = -1;
};

class p_time_added {
	title = "Time added per objective";
	values[] = {        0,           5,           15,           30,       60};
	texts[] = {"Disabled", "5 minutes", "15 minutes", "30 minutes", "1 hour"};
	default = 0;
};
