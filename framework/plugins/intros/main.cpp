class intros
{
	name = "Intro cutscenes";
	version = 1;
	authors[] = {"Nife"};	
	description = "Plays a pre-made intro cutscene to set the mood for the mission.";
	conditions[] = {"(isMultiplayer)"};
	postinit = "postinit.sqf";
	user = "client";
};