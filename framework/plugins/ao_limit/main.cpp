class ao_limit
{
	name = "AO Limit";
	version = 1;
	authors[] = {"Nife"};
	description = "Displays a message(or anything nastier) to players who leave the designated Area of Operations.";
	conditions[] = {"(time > 5)"};
	postinit = "postinit.sqf";
	user = "client";
};