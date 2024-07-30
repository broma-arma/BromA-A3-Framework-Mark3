class p_time_of_day {
	title = "Time";
	values[] = {           0,   1,       2,       3,       4,       5,       6,       7,       8,       9,      10,      11,      12,      13,      14,      15,      16,      17,      18,      19,      20,      21,      22,      23,      24,      25,  26,            27,  28,     29,              30,        31,     32,          33,        34,     35,      36,  37,            38,  39,       40,       41,  42,            43};
	texts[] = {"===========", " ", "00:00", "01:00", "02:00", "03:00", "04:00", "05:00", "06:00", "07:00", "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00", "23:00", " ", "===========", " ", "Dawn", "Early morning", "Morning", "Noon", "Afternoon", "Evening", "Dusk", "Night", " ", "===========", " ", "Random", "Custom", " ", "==========="};
	default = 32;
};

class p_weather {
	title = "Weather";
	values[] = {           0,   1,       2,          3,         4,       5,   6,             7,   8,        9,                 10,  11,            12};
	texts[] = {"===========", " ", "Clear", "Overcast", "Raining", "Storm", " ", "===========", " ", "Random", "Mission Settings", " ", "==========="};
	default = 2;
};

class p_fog {
	title = "Fog";
	values[] = {           0,   1,       2,      3,          4,           5,             6,              7,           8,            9,        10,  11,            12,  13,       14,                 15,  16,            17};
	texts[] = {"===========", " ", "Clear", "Mist", "Low/Thin", "Low/Thick", "Medium/Thin", "Medium/Thick", "High/Thin", "High/Thick", "Extreme", " ", "===========", " ", "Random", "Mission Settings", " ", "==========="};
	default = 2;
};

class p_wind {
	title = "Wind";
	values[] = {           0,   1,      2,       3,        4,        5,         6,   7,             8,   9,       10,                 11,  12,            13};
	texts[] = {"===========", " ", "None", "Light", "Medium", "Strong", "Extreme", " ", "===========", " ", "Random", "Mission Settings", " ", "==========="};
	default = 2;
};
