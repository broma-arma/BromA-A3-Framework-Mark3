class CSSA3RscMapControl : RscMapControl {
    access = ReadAndWrite;
    type = 101;
    idc = 51;
    style = 48;
    colorBackground[] = {1, 1, 1, 1};
    colorText[] = {0, 0, 0, 1};
    font = "TahomaB";
    sizeEx = 0.04;

};

class RscCSSA3XSliderH {
    arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
    arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
    border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
    color[] = {1,1,1,0.6};
    colorActive[] = {1,1,1,1};
    colorDisable[] = {1,1,1,0.4};
    colorDisabled[] = {1,1,1,0.2};
    deletable = 0;
    fade = 0;
    h = 0.029412;
    shadow = 0;
    style = "0x400  + 0x10";
    thumb = "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
    tooltipColorBox[] = {1,1,1,1};
    tooltipColorShade[] = {0,0,0,0.65};
    tooltipColorText[] = {1,1,1,1};
    type = 43;
    w = 0.4;
    x = 0;
    y = 0;
};

class CSSA3RscTransparentBack
{
   type = CT_STATIC;
    idc = -1;
    style = ST_CENTER;
    shadow = 2;
    colorText[] = {1,1,1,1};
    font = "puristaMedium";
    sizeEx = 0.02;
    colorBackground[] = { 0.2,0.23,0.2, 0.4 };
    text = "";

};

class CSSA3RscTransparentBack1
{
    type = CT_STATIC;
    idc = -1;
    style = ST_CENTER;
    shadow = 2;
    colorText[] = {1,1,1,1};
    font = "puristaMedium";
    sizeEx = 0.02;
    colorBackground[] = { 0.2,0.23,0.2, 0.7 };
    text = "";
};

class RscCSSA3InvisibleButton
{
    idc = -1;
    access = 0;
    type = CT_BUTTON;
    text = "";
    colorText[] = {1,1,1,.9};
    colorDisabled[] = {0.75,0.75,0.75,0};
    colorBackground[] = {0.75,0.75,0.75,0};
    colorBackgroundDisabled[] = {0.75,0.75,0.75,0};
    colorBackgroundActive[] = {1,1,1,0};
    colorFocused[] = {0.75,0.75,0.75,0};
    colorShadow[] = {0.023529,0,0.0313725,0};
    colorBorder[] = {0.023529,0,0.0313725,0};
    soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
    soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
    soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
    soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
    style = 2;
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    shadow = 2;
    font = "puristaMedium";
    sizeEx = (((((2.42424 / 1.81818) min 1.2) / 1.2) / 25) * 0.7876);
    offsetX = 0;
    offsetY = 0;
    offsetPressedX = 0.001;
    offsetPressedY = 0.001;
    borderSize = 0;
    moving = 1;
};

class RscCSSA3HeaderText
{
    access = 0;
    type = CT_STATIC;
    linespacing = 1;
    idc = -1;
    style = ST_LEFT;
    colorBackground[] = {0.071,0.278,0.071,0.7};
    colorText[] = {1,1,1,1};
    text = "";
    fixedWidth = 0;
    x = 0;
    y = 0;
    h = 0;
    w = 0;
    shadow = 2;
    font = "puristaMedium";
    sizeEx = (((((2.42424 / 1.81818) min 1.2) / 1.2) / 25) * 0.7876);
};

class RscCSSA3Text
{
    access = 0;
    type = CT_STATIC;
    linespacing = 1;
    idc = -1;
    style = ST_CENTER;
    colorBackground[] = {0,0,0,-1};
    colorText[] = {1,1,1,0.7};
    text = "";
    fixedWidth = 0;
    shadow = 2;
    font = "puristaMedium";
    sizeEx = (((((2.42424 / 1.81818) min 1.2) / 1.2) / 25) * 0.8);
};

class RscCSSA3Button : RscButton {
    colorText[] = {1,1,1,1};
    colorDisabled[] = {0.75,0.75,0.75,0};
    colorBackground[] = {0,0,0,0.3};
    colorBackgroundDisabled[] = {0.75,0.75,0.75,0};
    colorBackgroundActive[] = {1,1,1,0};
    colorFocused[] = {0.75,0.75,0.75,0};
    colorShadow[] = {0.023529,0,0.0313725,0};
    font = "puristaMedium";
    sizeEx = (((((2.42424 / 1.81818) min 1.2) / 1.2) / 25) * 0.878);
    offsetX = 0;
    offsetY = 0;
    moving = 0;
};

class RscCSSA3IGUIListBox : RscIGUIListBox
{
    color[] = {1,1,1,1};
    colorBackground[] = {0.2,0.23,0.2,0.65};
    colorSelect2[] = {1,1,1,1};
    colorSelect[] = {1,1,1,1};
    colorSelectBackground2[] = {1,1,1,1};
    colorSelectBackground[] = {1,1,1,1};
    shadow = 1;

    class ListScrollBar
    {
        color[] = {1,1,1,0.6};
        colorActive[] = {1,1,1,1};
        colorDisabled[] = {1,1,1,0.3};
        shadow = 0;
        thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
        arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
        arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
        border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
    };
};

class CSSA3RscYellowButton: RscButton {
    colorBackground[] = {0.902,0.902,0,0.6};
    colorBackgroundActive[] = {0.902,0.902,0,1};
};
class CSSA3RscBluButton: RscButton {
    colorBackground[] = {0,0.2,0.4,0.6};
    colorBackgroundActive[] = {0,0.2,0.4,1};
};
class CSSA3RscRedButton: RscButton {
    colorBackground[] = {0.502,0,0,0.6};
    colorBackgroundActive[] = {0.502,0,0,1};
};
class CSSA3RscGreenButton: RscButton {
    colorBackground[] = {0.071,0.278,0.071,0.6};
    colorBackgroundActive[] = {0.071,0.278,0.071,1};
};
class CSSA3RscPurpleButton: RscButton {
    colorBackground[] = {0.373,0.016,0.706,0.6};
    colorBackgroundActive[] = {0.373,0.016,0.706,1};
};
class CSSA3RscPlayersButton: RscButton {
    colorBackground[] = {0.682,0.447,0.216,0.6};
    colorBackgroundActive[] = {0.682,0.447,0.216,1};
};
class CSSA3RscFavButton: RscButton {
    colorBackground[] = {0,0,0,0.1};
    colorBackgroundActive[] = {0,0,0,0.2};
    colorText[] = {0.902,0.902,0,0.9};
};
class CSSA3favouritesBoxText: RscText {
    colorBackground[] = {0.2,0.23,0.2,0.65};
    colorText[] = {0,0,0,0.4};
    SizeEx = 0.04000;
    style = ST_CENTER;
};