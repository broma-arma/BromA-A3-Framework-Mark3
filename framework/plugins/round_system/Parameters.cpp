class p_round_params
{
	title = "Amount of rounds needed to win";
	values[] = {0,1,2,3,4};
	texts[] = {"1","2","3","4","5"};
	default = 2;
	code = "param_round_sys_rounds = %1";
};
class p_round_time_limit
{
	title = "Time limit per round";
	values[] = {0,1,2,3,4,5};
	texts[] = {"1 minute","5 minutes","15 minutes","30 minutes","1 hour", "No limit"};
	default = 2;
	code = "param_round_sys_time_limit = %1";
};