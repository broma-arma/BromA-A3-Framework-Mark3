class Alert {
	title = "ALERT";
	description = "%1";
	iconPicture = "\A3\ui_f\data\map\markers\military\warning_ca.paa";
	priority = 9;
};

class AlertBLU: Alert {
	colorIconPicture[] = {"(profilenamespace getVariable ['Map_BLUFOR_R', 0])", "(profilenamespace getVariable ['Map_BLUFOR_G', 1])", "(profilenamespace getVariable ['Map_BLUFOR_B', 1])", "(profilenamespace getVariable ['Map_BLUFOR_A', 0.8])"};
};

class AlertOP: Alert {
	colorIconPicture[] = {"(profilenamespace getVariable ['Map_OPFOR_R', 0])", "(profilenamespace getVariable ['Map_OPFOR_G', 1])", "(profilenamespace getVariable ['Map_OPFOR_B', 1])", "(profilenamespace getVariable ['Map_OPFOR_A', 0.8])"};
};

class AlertIND: Alert {
	colorIconPicture[] = {"(profilenamespace getVariable ['Map_Independent_R', 0])", "(profilenamespace getVariable ['Map_Independent_G', 1])", "(profilenamespace getVariable ['Map_Independent_B', 1])", "(profilenamespace getVariable ['Map_Independent_A', 0.8])"};
};

class AlertCIV: Alert {
	colorIconPicture[] = {"(profilenamespace getVariable ['Map_Civilian_R', 0])", "(profilenamespace getVariable ['Map_Civilian_G', 1])", "(profilenamespace getVariable ['Map_Civilian_B', 1])", "(profilenamespace getVariable ['Map_Civilian_A', 0.8])"};
};

class AlertUNK: Alert {
	colorIconPicture[] = {"(profilenamespace getVariable ['Map_Unknown_R', 0])", "(profilenamespace getVariable ['Map_Unknown_G', 1])", "(profilenamespace getVariable ['Map_Unknown_B', 1])", "(profilenamespace getVariable ['Map_Unknown_A', 0.8])"};
};

class Timer: Alert {
	iconPicture = "\A3\UI_F\data\IGUI\Cfg\Actions\settimer_ca.paa";
};

class MissionBegins: Timer {
	title = "MISSION";
	description = "Mission begins in %1.";
	priority = 1;
};
