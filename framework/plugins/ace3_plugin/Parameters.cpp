class p_ace3_medical_level
{
	title = "(ACE3) Medical Simulation Level";
	values[] = {0,1};
	texts[] = {"Basic", "Advanced"};
	default = 1;
	code = "param_ace3_medical_level = %1";
};

class p_ace3_revive_time
{
	title = "(ACE3) Bleedout time in seconds";
	values[] = {0,1,2,3,4};
	texts[] = {"Insta-kill","120","300","600","Infinite"};
	default = 3;
	code = "param_ace3_revive_time = %1";
}; 

class p_ace3_revive_lives
{
	title = "(ACE3) Revive system lives";
	values[] = {0,1,2,3,4};
	texts[] = {"Disabled","1","3","5","Infinite"};
	default = 1;
	code = "param_ace3_revive_lives = %1";
};

class p_ace3_everyone_medic
{
	title = "(ACE3) Everyone as a medic";
	values[] = {0,1};
	texts[] = {"Disabled","Enabled"};
	default = 1;
	code = "param_ace3_everyone_medic = %1";
};


class p_ace3_bar1 {title = ""; values[] = {0}; texts[] = {""}; default = 0; };
