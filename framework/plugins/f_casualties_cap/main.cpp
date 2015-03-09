class f_casualties_cap
{
	name = "Casualty cap";
	version = 1;
	authors[] = {"Fer", "Head", "Xiathorn", "Headspace", "Wolfenswan"};
	description = "Ends the mission after a certain parameter determined percentage of mission set groups have died.";
	conditions[] = {"mission_settings","mission_params_read"};
	postinit = "postinit.sqf";
	user = "server";
};