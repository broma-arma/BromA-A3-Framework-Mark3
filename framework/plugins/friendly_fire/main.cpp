class friendly_fire
{
	name = "Friendly fire";
	version = 1;
	authors[] = {"Nife"};	
	description = "Alerts both the perpetrator and the victim whenever a friendly fire incident takes place.";
	conditions[] = {"mission_settings"};
	postinit = "postinit.sqf";
	user = "client";
};