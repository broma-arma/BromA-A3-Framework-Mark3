class headless_client
{
	name = "Headless Client";
	version = 1;
	authors[] = {"Naught","Nife"};	
	description = "Suite of functions made to facilitate the usage of the Headless Client and its environment variables.";
	conditions[] = {"mission_settings","mission_params_read"};
	postinit = "postinit.sqf";
	user = "all";
};