class setup_zone
{
	name = "Setup zone";
	version = 1;
	authors[] = {"Sandiford","Nife"};	
	description = "Whenever a TvT mission is starting, players are forced to wait a set amount of time before being able to leave their start zones.";
	conditions[] = {"mission_settings","mission_params_read"};
	postinit = "postinit.sqf";
	user = "client";
};