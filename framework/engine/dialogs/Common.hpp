//by Bon_Inf*
// version 1.19 - always replace my Common.hpp with the latest version, if no version specified, consider it as version 1.0
//                 however, never include two Common.hpp at the same time in the Description.ext

// Control types
#define CT_STATIC 0
#define CT_BUTTON 1
#define CT_EDIT 2
#define CT_SLIDER 3
#define CT_COMBO 4
#define CT_LISTBOX 5
#define CT_TOOLBOX 6
#define CT_CHECKBOXES 7
#define CT_PROGRESS 8
#define CT_HTML 9
#define CT_STATIC_SKEW 10
#define CT_ACTIVETEXT 11
#define CT_TREE 12
#define CT_STRUCTURED_TEXT 13
#define CT_CONTEXT_MENU 14
#define CT_CONTROLS_GROUP 15
#define CT_XKEYDESC 40
#define CT_XBUTTON 41
#define CT_XLISTBOX 42
#define CT_XSLIDER 43
#define CT_XCOMBO 44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT 80
#define CT_OBJECT_ZOOM 81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK 98
#define CT_USER 99
#define CT_MAP 100
#define CT_MAP_MAIN 101 // Static styles
#define ST_POS 0x0F
#define ST_HPOS 0x03
#define ST_VPOS 0x0C
#define ST_LEFT 0x00
#define ST_RIGHT 0x01
#define ST_CENTER 0x02
#define ST_DOWN 0x04
#define ST_UP 0x08
#define ST_VCENTER 0x0c
#define ST_TYPE 0xF0
#define ST_SINGLE 0
#define ST_MULTI 16
#define ST_TITLE_BAR 32
#define ST_PICTURE 48
#define ST_FRAME 64
#define ST_BACKGROUND 80
#define ST_GROUP_BOX 96

#define ST_GROUP_BOX2 112
#define ST_HUD_BACKGROUND 128
#define ST_TILE_PICTURE 144
#define ST_WITH_RECT 160
#define ST_LINE 176
#define FontM "Zeppelin32"
#define Size_Main_Small 0.027
#define Size_Main_Normal 0.04
#define Size_Text_Default Size_Main_Normal
#define Size_Text_Small Size_Main_Small
#define Color_White {1, 1, 1, 1}
#define Color_Main_Foreground1 Color_White
#define Color_Text_Default Color_Main_Foreground1

#define LB_TEXTURES 0x10
#define LB_MULTI 0x20 

#define SL_DIR 0x400
#define SL_VERT 0
#define SL_HORZ 0x400

#define true 1
#define false 0


class HW_RscText {
	idc = -1;
	type = CT_STATIC;
	style = ST_CENTER;
	text = "";
	font = FontM;
	sizeEx = 0.023;
	colorBackground[] = { 1, 1, 1, 0.3 };
	colorText[] = { 0, 0, 0, 1 };
	x = 0.8;
	y = 0.1;
	w = 0.2;
	h = 0.05;
};

class HW_RscStructuredText {
	idc = -1;
	type = CT_STRUCTURED_TEXT;
	style = ST_LEFT;
	colorBackground[] = { 1, 1, 1, 1 };
	x = 0.1; y = 0.1;
	w = 0.3; h = 0.1;	
	size = 0.018;
	text = "";
	class Attributes {
		font = FontM;
		color = "#FFFFFF";
		align = "left";
		valign = "middle";
		shadow = true;
		shadowColor = "#000000";
		size = "2.25";
	};
};

class HW_RscButton {
	idc = -1;
	type = CT_BUTTON;
	style = ST_CENTER;
	default = false;
	font = FontM;
	sizeEx = 0.05;
	colorText[] = { 0, 0, 0, 1 };
	colorFocused[] = { 0.2, 0.5, 1, 1 }; // border color for focused state
	colorDisabled[] = { 1, 0, 0, 0.7 }; // text color for disabled state
	colorBackground[] = { 0.8, 0.8, 0.8, 0.8 };
	colorBackgroundDisabled[] = { 1, 1, 1, 0.5 }; // background color for disabled state
	colorBackgroundActive[] = { 0.9, 0.9, 0.9, 1 }; // background color for active state
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	colorShadow[] = { 0, 0, 0, 0.5 };
	colorBorder[] = { 0, 0, 0, 1 };
	borderSize = 0;
	soundEnter[] = { "", 0, 1 }; // no sound
	soundPush[] = { "buttonpushed.ogg", 0.1, 1 };
	soundClick[] = { "", 0, 1 }; // no sound
	soundEscape[] = { "", 0, 1 }; // no sound 
	x = 0.4;
	y = 0.475;
	w = 0.2;
	h = 0.05;
	text = "Empty";
	action = "";
};


class HW_RscBackground {
	idc = -1; 
	type = CT_STATIC; 
	style = ST_LEFT;
	colorBackground[] = { 0, 0, 0, 0.9 };
	colorText[] = { 0, 0, 0, 1 };
	font = FontM;
	sizeEx = 0.023;
	x = -1; y = -1;
	w = 3; h = 3;
	text = "";
}; 


class HW_RscPicture {
	idc = -1; 
	type = CT_STATIC;
	style = ST_PICTURE;
	colorBackground[] = { };
	colorText[] = { };
	font = FontM;
	sizeEx = 0.023;
	x = 0.0; y = 0.2;
	w = 0.2; h = 0.2;
	text = "";
}; 


class HW_RscSlider {
	type = CT_SLIDER;
	style = 1024;
	w = 0.24;
	h = 0.03;
	color[] = Color_White;
	//colorActive[] = Color_White;
};


class HW_RscXSlider {
	type = CT_XSLIDER;
	style = 0x400  + 0x10;
	x = 0; y = 0; w = 1; h = 1;
	color[] = {1, 1, 1, 0.4};
	colorActive[] = {1, 1, 1, 1};
	colorDisabled[] = {1, 1, 1, 0.2};
	arrowEmpty = "\ca\ui\data\ui_arrow_left_ca.paa";
	arrowFull = "\ca\ui\data\ui_arrow_left_active_ca.paa";
	border = "\ca\ui\data\ui_border_frame_ca.paa";
	thumb = "\ca\ui\data\ui_slider_bar_ca.paa";
};


class HW_RscListBox {
	type = 5;
	style = 0 + 0x10;
	font = "Zeppelin32";
	sizeEx = 0.03921;
	color[] = {1, 1, 1, 1};
	colorText[] = {0.95, 0.95, 0.95, 1};
	colorScrollbar[] = {0.95, 0.95, 0.95, 1};
	colorSelect[] = {0.023529, 0, 0.0313725, 1};
	colorSelect2[] = {0.023529, 0, 0.0313725, 1};
	colorSelectBackground[] = {0.58, 0.1147, 0.1108, 1};
	colorSelectBackground2[] = {0.58, 0.1147, 0.1108, 1};
	period = 1;
	colorBackground[] = {0, 0, 0, 1};
	maxHistoryDelay = 1.0;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	
	class ScrollBar {
		color[] = {1, 1, 1, 0.6};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
		border = "\ca\ui\data\ui_border_scroll_ca.paa";
	};
};


class HW_RscGUIListBox : HW_RscListBox {
	color[] = {1, 1, 1, 1};
	colorText[] = {1, 1, 1, 0.75};
	colorScrollbar[] = {0.95, 0.95, 0.95, 1};
	colorSelect[] = {0.95, 0.95, 0.95, 1};
	colorSelect2[] = {0.95, 0.95, 0.95, 1};
	colorSelectBackground[] = {0.6, 0.839, 0.47, 0.3};
	colorSelectBackground2[] = {0.6, 0.839, 0.47, 1};
	period = 0;
	colorBackground[] = {0, 0, 0, 1};
	sizeEx = 0.035;
	class ScrollBar {
		color[] = {1, 1, 1, 0.6};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "\ca\ui\data\igui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\igui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\igui_arrow_top_ca.paa";
		border = "\ca\ui\data\igui_border_scroll_ca.paa";
	};
};


class HW_RscComboBox : HW_RscText {
		type = CT_COMBO;
		style = ST_LEFT;
		rowHeight = 0.028;
		wholeHeight = 13 * 0.028;
		color[] = {1,1,1,1};
		colorSelect[] = {0.70, 0.99, 0.65, 1};
		colorBackground[] = {0.28, 0.36, 0.26, 1};
		colorSelectBackground[] = {0.36, 0.46, 0.36, 1};
		soundSelect[] = {"", 0.0, 1};
		soundExpand[] = {"", 0.0, 1};
		soundCollapse[] = {"", 0.0, 1};
		arrowEmpty = "\ca\ui\data\ui_arrow_combo_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_combo_active_ca.paa";
		maxHistoryDelay = 1;
		class ScrollBar
		{
			color[] = {1, 1, 1, 0.6};
			colorActive[] = {1, 1, 1, 1};
			colorDisabled[] = {1, 1, 1, 0.3};
			thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
			arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
			arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
			border = "\ca\ui\data\ui_border_scroll_ca.paa";
		};
	};


class HW_RscShortcutButton {
	type = 16;
	idc = -1;
	style = 0;
	default = 0;
	w = 0.183825;
	h = 0.104575;
	color[] = {0.95, 0.95, 0.95, 1};
	color2[] = {1, 1, 1, 0.4};
	colorBackground[] = {1, 1, 1, 1};
	colorbackground2[] = {1, 1, 1, 0.4};
	colorDisabled[] = {1, 1, 1, 0.25};
	periodFocus = 1.2;
	periodOver = 0.8;
	
	class HitZone {
		left = 0.004;
		top = 0.029;
		right = 0.004;
		bottom = 0.029;
	};
	
	class ShortcutPos {
		left = 0.004;
		top = 0.026;
		w = 0.0392157;
		h = 0.0522876;
	};
	
	class TextPos {
		left = 0.05;
		top = 0.034;
		right = 0.005;
		bottom = 0.005;
	};
	animTextureNormal = "\ca\ui\data\ui_button_normal_ca.paa";
	animTextureDisabled = "\ca\ui\data\ui_button_disabled_ca.paa";
	animTextureOver = "\ca\ui\data\ui_button_over_ca.paa";
	animTextureFocused = "\ca\ui\data\ui_button_focus_ca.01.paa";
	animTexturePressed = "\ca\ui\data\ui_button_down_ca.paa";
	animTextureDefault = "\ca\ui\data\ui_button_default_ca.paa";
	textureNoShortcut = "";
	period = 0.4;
	font = "Zeppelin32";
	size = 0.03521;
	sizeEx = 0.03521;
	text = "";
	soundEnter[] = {"\ca\ui\data\sound\mouse2", 0.09, 1};
	soundPush[] = {"\ca\ui\data\sound\new1", 0.09, 1};
	soundClick[] = {"\ca\ui\data\sound\mouse3", 0.07, 1};
	soundEscape[] = {"\ca\ui\data\sound\mouse1", 0.09, 1};
	action = "";
	
	class Attributes {
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";
		shadow = "true";
	};
	
	class AttributesImage {
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";
	};
};

class HW_RscGUIShortcutButton : HW_RscShortcutButton {
	w = 0.183825;
	h = 0.0522876;
	style = 2;
	color[] = {1, 1, 1, 1};
	color2[] = {1, 1, 1, 0.85};
	colorBackground[] = {1, 1, 1, 1};
	colorbackground2[] = {1, 1, 1, 0.85};
	colorDisabled[] = {1, 1, 1, 0.4};
	
	class HitZone {
		left = 0.002;
		top = 0.003;
		right = 0.002;
		bottom = 0.016;
	};
	
	class ShortcutPos {
		left = -0.006;
		top = -0.007;
		w = 0.0392157;
		h = 0.0522876;
	};
	
	class TextPos {
		left = 0.002;
		top = 0.0;
		right = 0.002;
		bottom = 0.016;
	};
	animTextureNormal = "\ca\ui\data\igui_button_normal_ca.paa";
	animTextureDisabled = "\ca\ui\data\igui_button_disabled_ca.paa";
	animTextureOver = "\ca\ui\data\igui_button_over_ca.paa";
	animTextureFocused = "\ca\ui\data\igui_button_focus_ca.paa";
	animTexturePressed = "\ca\ui\data\igui_button_down_ca.paa";
	animTextureDefault = "\ca\ui\data\igui_button_normal_ca.paa";
	animTextureNoShortcut = "\ca\ui\data\igui_button_normal_ca.paa";
	
	class Attributes {
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "center";
		shadow = "true";
	};
};


class RscMap {

	idc = -1;
	type=101;
	style=48;

	x = 0; y = 0;
	w = 1; h = 1;
	
	colorBackground[] = {1.00, 1.00, 1.00, 0};
	colorText[] = {0.00, 0.00, 0.00, 1.00};
	colorSea[] = {0.56, 0.80, 0.98, 0.50};
	colorForest[] = {0.60, 0.80, 0.20, 0.50};
	colorRocks[] = {0.50, 0.50, 0.50, 0.50};
	colorCountlines[] = {0.65, 0.45, 0.27, 0.50};
	colorMainCountlines[] = {0.65, 0.45, 0.27, 1.00};
	colorCountlinesWater[] = {0.00, 0.53, 1.00, 0.50};
	colorMainCountlinesWater[] = {0.00, 0.53, 1.00, 1.00};
	colorForestBorder[] = {0.40, 0.80, 0.00, 1.00};
	colorRocksBorder[] = {0.50, 0.50, 0.50, 1.00};
	colorPowerLines[] = {0.00, 0.00, 0.00, 1.00};
	colorNames[] = {0.00, 0.00, 0.00, 1.00};
	colorInactive[] = {1.00, 1.00, 1.00, 0.50};
	colorLevels[] = {0.00, 0.00, 0.00, 1.00};
	colorRailWay[] = {0.00, 0.00, 0.00, 1.00};
	colorOutside[] = {0.00, 0.00, 0.00, 1.00};

	font = "TahomaB";
	sizeEx = 0.040000;

	stickX[] = {0.20, {"Gamma", 1.00, 1.50} };
	stickY[] = {0.20, {"Gamma", 1.00, 1.50} };
	ptsPerSquareSea = 6;
	ptsPerSquareTxt = 8;
	ptsPerSquareCLn = 8;
	ptsPerSquareExp = 8;
	ptsPerSquareCost = 8;
	ptsPerSquareFor = "4.0f";
	ptsPerSquareForEdge = "10.0f";
	ptsPerSquareRoad = 2;
	ptsPerSquareObj = 10;

	fontLabel = "Zeppelin32";
	sizeExLabel = 0.034000;
	fontGrid = "Zeppelin32";
	sizeExGrid = 0.034000;
	fontUnits = "Zeppelin32";
	sizeExUnits = 0.034000;
	fontNames = "Zeppelin32";
	sizeExNames = 0.056000;
	fontInfo = "Zeppelin32";
	sizeExInfo = 0.034000;
	fontLevel = "Zeppelin32";
	sizeExLevel = 0.034000;
    
	maxSatelliteAlpha = 0;     // Alpha to 0 by default
	alphaFadeStartScale = 1.0; 
	alphaFadeEndScale = 1.1;   // Prevent div/0

	showCountourInterval=2;
	scaleDefault = 0.1;
	onMouseButtonClick = "";
	onMouseButtonDblClick = "";
	
	text = "\ca\ui\data\map_background2_co.paa";

	class CustomMark {
		icon = "\ca\ui\data\map_waypoint_ca.paa";
		color[] = {0, 0, 1, 1};
		size = 18;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};

	class Legend {
		x = -1;
		y = -1;
		w = 0.340000;
		h = 0.152000;
		font = "Zeppelin32";
		sizeEx = 0.039210;
		colorBackground[] = {0.906000, 0.901000, 0.880000, 0.800000};
		color[] = {0, 0, 0, 1};
	};

	class Bunker {
		icon = "\ca\ui\data\map_bunker_ca.paa";
        color[] = {0, 0.900000, 0, 1};
		size = 14;
		importance = "1.5 * 14 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Bush {
		icon = "\ca\ui\data\map_bush_ca.paa";
		color[] = {0.550000, 0.640000, 0.430000, 1};
		size = 14;
		importance = "0.2 * 14 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class BusStop {
		icon = "\ca\ui\data\map_busstop_ca.paa";
		color[] = {0, 0, 1, 1};
		size = 10;
		importance = "1 * 10 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Command {
		icon = "\ca\ui\data\map_waypoint_ca.paa";
		color[] = {0, 0.900000, 0, 1};
		size = 18;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};

	class Cross {
		icon = "\ca\ui\data\map_cross_ca.paa";
        color[] = {0, 0.900000, 0, 1};
		size = 16;
		importance = "0.7 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Fortress {
		icon = "\ca\ui\data\map_bunker_ca.paa";
        color[] = {0, 0.900000, 0, 1};
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Fuelstation {
		icon = "\ca\ui\data\map_fuelstation_ca.paa";
        color[] = {0, 0.900000, 0, 1};
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.750000;
		coefMax = 4;
	};

	class Fountain {
		icon = "\ca\ui\data\map_fountain_ca.paa";
		color[] = {0, 0.350000, 0.700000, 1};
		size = 12;
		importance = "1 * 12 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Hospital {
		icon = "\ca\ui\data\map_hospital_ca.paa";
		color[] = {0.780000, 0, 0.050000, 1};
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.500000;
		coefMax = 4;
	};

	class Chapel {
		icon = "\ca\ui\data\map_chapel_ca.paa";
        color[] = {0, 0.900000, 0, 1};
		size = 16;
		importance = "1 * 16 * 0.05";
		coefMin = 0.900000;
		coefMax = 4;
	};

	class Church {
		icon = "\ca\ui\data\map_church_ca.paa";
        color[] = {0, 0.900000, 0, 1};
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.900000;
		coefMax = 4;
	};

	class Lighthouse {
		icon = "\ca\ui\data\map_lighthouse_ca.paa";
		color[] = {0.780000, 0, 0.050000, 1};
		size = 20;
		importance = "3 * 16 * 0.05";
		coefMin = 0.900000;
		coefMax = 4;
	};

	class Quay {
		icon = "\ca\ui\data\map_quay_ca.paa";
        color[] = {0, 0.900000, 0, 1};
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.500000;
		coefMax = 4;
	};

	class Rock {
		icon = "\ca\ui\data\map_rock_ca.paa";
        color[] = {0, 0.900000, 0, 1};
		size = 12;
		importance = "0.5 * 12 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Ruin {
		icon = "\ca\ui\data\map_ruin_ca.paa";
		color[] = {0.780000, 0, 0.050000, 1};
		size = 16;
		importance = "1.2 * 16 * 0.05";
		coefMin = 1;
		coefMax = 4;
	};

	class SmallTree {
		icon = "\ca\ui\data\map_smalltree_ca.paa";
		color[] = {0.550000, 0.640000, 0.430000, 1};
		size = 12;
		importance = "0.6 * 12 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Stack {
		icon = "\ca\ui\data\map_stack_ca.paa";
        color[] = {0, 0.900000, 0, 1};
		size = 20;
		importance = "2 * 16 * 0.05";
		coefMin = 0.900000;
		coefMax = 4;
	};

	class Tree {
		icon = "\ca\ui\data\map_tree_ca.paa";
		color[] = {0.550000, 0.640000, 0.430000, 1};
		size = 12;
		importance = "0.9 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Tourism {
		icon = "\ca\ui\data\map_tourism_ca.paa";
		color[] = {0.780000, 0, 0.050000, 1};
		size = 16;
		importance = "1 * 16 * 0.05";
		coefMin = 0.700000;
		coefMax = 4;
	};

	class Transmitter {
		icon = "\ca\ui\data\map_transmitter_ca.paa";
        color[] = {0, 0.900000, 0, 1};
		size = 20;
		importance = "2 * 16 * 0.05";
		coefMin = 0.900000;
		coefMax = 4;
	};

	class ViewTower {
		icon = "\ca\ui\data\map_viewtower_ca.paa";
        color[] = {0, 0.900000, 0, 1};
		size = 16;
		importance = "2.5 * 16 * 0.05";
		coefMin = 0.500000;
		coefMax = 4;
	};

	class Watertower {
		icon = "\ca\ui\data\map_watertower_ca.paa";
		color[] = {0, 0.350000, 0.700000, 1};
		size = 32;
		importance = "1.2 * 16 * 0.05";
		coefMin = 0.900000;
		coefMax = 4;
	};

	class Waypoint {
		icon = "\ca\ui\data\map_waypoint_ca.paa";
        size = 20;
        color[] = {0, 0.900000, 0, 1};
		importance = "1.2 * 16 * 0.05";
		coefMin = 0.900000;
		coefMax = 4;
	};

	class Task {
		icon = "\ca\ui\data\map_waypoint_ca.paa";
		iconCreated = "#(argb,8,8,3)color(1,1,1,1)";
		iconCanceled = "#(argb,8,8,3)color(0,0,1,1)";
		iconDone = "#(argb,8,8,3)color(0,0,0,1)";
		iconFailed = "#(argb,8,8,3)color(1,0,0,1)";
		colorCreated[] = {1,1,1,1};
		colorCanceled[] = {1,1,1,1};
		colorDone[] = {1,1,1,1};
		colorFailed[] = {1,1,1,1};
        size = 20;
        color[] = {0, 0.900000, 0, 1};
		importance = "1.2 * 16 * 0.05";
		coefMin = 0.900000;
		coefMax = 4;
	};

	class WaypointCompleted {
		icon = "\ca\ui\data\map_waypoint_completed_ca.paa";
        size = 20;
        color[] = {0, 0.900000, 0, 1};
		importance = "1.2 * 16 * 0.05";
		coefMin = 0.900000;
		coefMax = 4;
	};

	class ActiveMarker {
		icon = "\ca\ui\data\map_waypoint_completed_ca.paa";
        size = 20;
        color[] = {0, 0.900000, 0, 1};
		importance = "1.2 * 16 * 0.05";
		coefMin = 0.900000;
		coefMax = 4;
	};		
};