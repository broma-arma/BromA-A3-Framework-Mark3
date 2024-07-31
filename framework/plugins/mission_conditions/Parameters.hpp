class p_time_of_day {
	title = "Time";
	values[] = {     2,       3,       4,       5,       6,       7,       8,       9,      10,      11,      12,      13,      14,      15,      16,      17,      18,      19,      20,      21,      22,      23,      24,      25,            27,     29,              30,        31,     32,          33,        34,     35,      36,            38,       40,                 41};
	texts[] = {"00:00", "01:00", "02:00", "03:00", "04:00", "05:00", "06:00", "07:00", "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00", "23:00", "===========", "Dawn", "Early morning", "Morning", "Noon", "Afternoon", "Evening", "Dusk", "Night", "===========", "Random", "Mission Settings"};
	default = 41;
};

class p_weather {
	title = "Weather";
	values[] = {     2,          3,         4,       5,             7,        9,                 10};
	texts[] = {"Clear", "Overcast", "Raining", "Storm", "===========", "Random", "Mission Settings"};
	default = 10;
};

class p_fog {
	title = "Fog";
	values[] = {     2,      3,          4,           5,             6,              7,           8,            9,        10,            12,       14,                 15};
	texts[] = {"Clear", "Mist", "Low/Thin", "Low/Thick", "Medium/Thin", "Medium/Thick", "High/Thin", "High/Thick", "Extreme", "===========", "Random", "Mission Settings"};
	default = 15;
};

class p_wind {
	title = "Wind";
	values[] = {    2,       3,        4,        5,         6,             8,       10,                 11};
	texts[] = {"None", "Light", "Medium", "Strong", "Extreme", "===========", "Random", "Mission Settings"};
	default = 11;
};
