class loading_screen
{
	name = "Loading screen";
	version = 1.5;
	authors[] = {"Nife"};
	description = "Displays a short test screen to avoid players from shooting each other while loading the mission.";
	conditions[] = {"(isMultiplayer)"};
	postinit = "postinit.sqf";
	user = "client";
};