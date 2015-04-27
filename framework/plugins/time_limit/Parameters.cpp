class p_time_limit
{
	title = "Time Limit";
	values[] = {0,1,2,3,4,5,6,7,8};
	texts[] = {"No limit","3 hours","2 hours","1 hour","45 minutes", "30 minutes", "15 minutes", "10 minutes", "1 minute"};
	default = 0;
	code = "param_time_limit = %1";
};

class p_time_added
{
	title = "Time added per objective";
	values[] = {0,1,2,3,4};
	texts[] = {"Disabled","5 minutes","15 minutes","30 minutes","1 hour"};
	default = 0;
	code = "param_time_added = %1";
};