class p_spawn_protection_time
{
	title = "Spawn protection duration";
	values[] = {0,1,2,3,4};
	texts[] = {"Disabled", "1 minute", "15 minutes", "30 minutes", "Infinite"};
	default = 4;
	code = "param_spawn_protection_time = %1";
};