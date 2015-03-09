class mission_maker_tools
{
	name = "Mission maker tools";
	version = 1;
	authors[] = {"Nife"};
	description = "Handy scripts like Teleporting and opening the Arsenal script available to the mission maker while in the editor.";
	conditions[] = {"!(isMultiplayer)"};
	preinit = "preinit.sqf";
	user = "client";
};