class tfar_plugin
{
	name = "TFAR Plugin";
	version = 1;
	authors[] = {"Nife"};	
	description = "Sets up environment variables and functions necessary to work with the Task Force Radio Alpha radio system.";
	conditions[] = {"mission_settings","mission_params_read"};
	postinit = "postinit.sqf";
	user = "client";
};