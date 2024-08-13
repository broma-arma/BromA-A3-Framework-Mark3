class p_time_limit {
	title = "Time limit";
	values[] = {       -1,         60,         300,          600,          900,         1800,         2700,     3600,      7200,     10800};
	texts[] = {"No limit", "1 minute", "5 minutes", "10 minutes", "15 minutes", "30 minutes", "45 minutes", "1 hour", "2 hours", "3 hours"};
	default = -1;
};

class p_time_added {
	title = "Time added per objective";
	values[] = {        0,          1,           5,           10,           15,           30,           45,       60};
	texts[] = {"Disabled", "1 minute", "5 minutes", "10 minutes", "15 minutes", "30 minutes", "45 minutes", "1 hour"};
	default = 0;
};
