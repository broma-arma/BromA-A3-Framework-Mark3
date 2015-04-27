class p_agm_revive_time
{
	title = "(AGM) Bleedout time in seconds";
	values[] = {0,1,2,3,4};
	texts[] = {"Insta-kill","120","300","600","Infinite"};
	default = 3;
	code = "param_agm_revive_time = %1";
};

class p_agm_single_bandage
{
	title = "(AGM) Enable Single-bandage";
	values[] = {0,1};
	texts[] = {"Enabled","Disabled"};
	default = 1;
	code = "param_agm_single_bandage = %1";
}; 

class p_agm_insta_death
{
	title = "(AGM) Prevent Instant-death";
	values[] = {0,1};
	texts[] = {"Enabled","Disabled"};
	default = 0;
	code = "param_agm_insta_death = %1";
}; 

class p_agm_bar1 {title = ""; values[] = {0}; texts[] = {""}; default = 0; };