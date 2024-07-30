class p_round_params {
	title = "Amount of rounds needed to win";
	values[] = { 1,   2,   3,   4,   5};
	texts[] = {"1", "2", "3", "4", "5"};
	default = 3;
};

class p_round_time_limit {
	title = "Time limit per round";
	values[] = {        1,           5,           15,           30,       60,   99999999};
	texts[] = {"1 minute", "5 minutes", "15 minutes", "30 minutes", "1 hour", "No limit"};
	default = 15;
};
