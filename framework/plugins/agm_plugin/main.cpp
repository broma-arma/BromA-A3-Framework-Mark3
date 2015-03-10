class agm_plugin
{
	name = "AGM Plugin";
	version = 1;
	authors[] = {"Nife"};	
	description = "Based on parameters and mission settings, configures whatever desired AGM modules, including Medical and respawning system.";
	conditions[] = {"mission_settings","mission_params_read"};
	postinit = "postinit.sqf";
	user = "server";
};