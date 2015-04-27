
// ============================================================================
//                                                                             |
//                   Includes all notifications and alerts.                    |
//                                                                             |
// ============================================================================

#define COLOR_MIN 0.2
#define COLOR_MAX 0.6
#define COLOR_OPC 1

class Alert {
    title = "ALERT";
    description = "%1";
    iconPicture="\A3\ui_f\data\map\markers\military\warning_ca.paa";
    duration = 3;
    priority = 9;
};

class AlertBLU {
    title = "ALERT";
    description = "%1";
    color[] = {COLOR_MIN,COLOR_MIN,COLOR_MAX,COLOR_OPC};
    iconPicture="\A3\ui_f\data\map\markers\military\warning_ca.paa";
    duration = 3;
    priority = 9;
};

class AlertOP {
    title = "ALERT";
    description = "%1";
    color[] = {COLOR_MAX,COLOR_MIN,COLOR_MIN,COLOR_OPC};
    iconPicture="\A3\ui_f\data\map\markers\military\warning_ca.paa";
    duration = 3;
    priority = 9;
};

class AlertIND {
    title = "ALERT";
    description = "%1";
    color[] = {COLOR_MIN,COLOR_MAX,COLOR_MIN,COLOR_OPC};
    iconPicture="\A3\ui_f\data\map\markers\military\warning_ca.paa";
    duration = 3;
    priority = 9;
};

class Timer {
    title = "ALERT";
    description = "%1";
    iconPicture="\A3\UI_F\data\IGUI\Cfg\Actions\settimer_ca.paa";
    duration = 3;
    priority = 9;
};

class MissionBegins {
    title = "MISSION";
    description = "Mission begins in %1.";
    iconPicture="\A3\UI_F\data\IGUI\Cfg\Actions\settimer_ca.paa";
    duration = 3;
    priority = 1;
};