class block_tp
{
	name = "Block third-person";
	version = 1;
	authors[] = {"Nife"};	
	description = "Simple script meant to stop players who do not meet certain conditions (being a driver/commander) from using third person mode.";
	conditions[] = {"mission_settings","mission_params_read"};
	postinit = "postinit.sqf";
	user = "client";
};