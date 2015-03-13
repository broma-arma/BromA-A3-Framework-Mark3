class sync_status
{
	name = "Synchronize Status";
	version = 1;
	authors[] = {"Nife"};
	description = "Consantly sends your current position and over relevant data to the server, and synchronizes it every time you JIP back into the session.";
	conditions[] = {"mission_settings"};
	preinit = "preinit.sqf";
	postinit = "postinit.sqf";
	user = "all";
};