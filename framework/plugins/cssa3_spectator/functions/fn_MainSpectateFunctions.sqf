/*
	Author: Karel Moricky
	Modified: Cyrokrypto

	Description:
	Credit goes to Karel Moricky for the original version of this script.
	- Main keypress event handlers and update loop inits.
	- This script is spawned by the onLoad of the CSSA3 dialog.
	- This could probably be sped up by creating individual functions for each 'case'.

	Parameter(s):
	None

	Returns:
	NOTHING
*/

#define DIK_ESCAPE          0x01
#define DIK_1               0x02
#define DIK_2               0x03
#define DIK_3               0x04
#define DIK_4               0x05
#define DIK_5               0x06
#define DIK_6               0x07
#define DIK_7               0x08
#define DIK_8               0x09
#define DIK_9               0x0A
#define DIK_0               0x0B
#define DIK_MINUS           0x0C    /* - on main keyboard */
#define DIK_EQUALS          0x0D
#define DIK_BACK            0x0E    /* backspace */
#define DIK_TAB             0x0F
#define DIK_Q               0x10
#define DIK_W               0x11
#define DIK_E               0x12
#define DIK_R               0x13
#define DIK_T               0x14
#define DIK_Y               0x15
#define DIK_U               0x16
#define DIK_I               0x17
#define DIK_O               0x18
#define DIK_P               0x19
#define DIK_LBRACKET        0x1A
#define DIK_RBRACKET        0x1B
#define DIK_RETURN          0x1C    /* Enter on main keyboard */
#define DIK_LCONTROL        0x1D
#define DIK_A               0x1E
#define DIK_S               0x1F
#define DIK_D               0x20
#define DIK_F               0x21
#define DIK_G               0x22
#define DIK_H               0x23
#define DIK_J               0x24
#define DIK_K               0x25
#define DIK_L               0x26
#define DIK_SEMICOLON       0x27
#define DIK_APOSTROPHE      0x28
#define DIK_GRAVE           0x29    /* accent grave */
#define DIK_LSHIFT          0x2A
#define DIK_BACKSLASH       0x2B
#define DIK_Z               0x2C
#define DIK_X               0x2D
#define DIK_C               0x2E
#define DIK_V               0x2F
#define DIK_B               0x30
#define DIK_N               0x31
#define DIK_M               0x32
#define DIK_COMMA           0x33
#define DIK_PERIOD          0x34    /* . on main keyboard */
#define DIK_SLASH           0x35    /* / on main keyboard */
#define DIK_RSHIFT          0x36
#define DIK_MULTIPLY        0x37    /* * on numeric keypad */
#define DIK_LMENU           0x38    /* left Alt */
#define DIK_SPACE           0x39
#define DIK_CAPITAL         0x3A
#define DIK_F1              0x3B
#define DIK_F2              0x3C
#define DIK_F3              0x3D
#define DIK_F4              0x3E
#define DIK_F5              0x3F
#define DIK_F6              0x40
#define DIK_F7              0x41
#define DIK_F8              0x42
#define DIK_F9              0x43
#define DIK_F10             0x44
#define DIK_NUMLOCK         0x45
#define DIK_SCROLL          0x46    /* Scroll Lock */
#define DIK_NUMPAD7         0x47
#define DIK_NUMPAD8         0x48
#define DIK_NUMPAD9         0x49
#define DIK_SUBTRACT        0x4A    /* - on numeric keypad */
#define DIK_NUMPAD4         0x4B
#define DIK_NUMPAD5         0x4C
#define DIK_NUMPAD6         0x4D
#define DIK_ADD             0x4E    /* + on numeric keypad */
#define DIK_NUMPAD1         0x4F
#define DIK_NUMPAD2         0x50
#define DIK_NUMPAD3         0x51
#define DIK_NUMPAD0         0x52
#define DIK_DECIMAL         0x53    /* . on numeric keypad */
#define DIK_OEM_102         0x56    /* < > | on UK/Germany keyboards */
#define DIK_F11             0x57
#define DIK_NUMPADENTER     0x9C    /* Enter on numeric keypad */

private ["_mode", "_cam", "_CSSA3_defaultSettings", "_i", "_DIKcodes", "_DIKlast", "_k", "_display", "_ctrlMouseArea", "_ctrlMap", "_ctrlInteractbutton", "_displayMission", "_control", "_layers", "_l", "_null", "_pitchbank", "_pitch", "_bank", "_mX", "_mY", "_defX", "_defY", "_camZ", "_dX", "_dY", "_camPos", "_coef", "_button", "_ctrl", "_unitToAdd", "_camVector", "_dZ", "_vX", "_vY", "_vZ", "_key", "_return", "_result", "_camDir", "_ctrlMapPos", "_ctrlOverlays", "_vision", "_message", "_posX", "_posY", "_worldPos", "_nearestUnits"];

disableserialization;
_mode = [_this,0,"",[displaynull,""]] call bis_fnc_param;
_this = [_this,1,[]] call bis_fnc_param;

switch _mode do {
	///////////////////////////////////////////////////////////////////////////////////////////
	case "Init": {
		diag_log text "[CSSA3 Notice]: CSSA3 Initialising.";

		//Define IDD and IDC's of dialogs and controls.
		#define CSSA3_dialogIDD					7810
		#define CSSA3_mouseAreaIDC				7910
		#define CSSA3_mapIDC					7911
		#define CSSA3_unitsListBoxIDC			79124
		#define CSSA3_mainDialogControlIDC		7913
		#define CSSA3_settingsControlIDC		7914
		#define CSSA3_cbUnitNamesIDC			79142
		#define CSSA3_cbUnitTagsIDC				79143
		#define CSSA3_cbClickToInteractIDC		79144
		#define CSSA3_viewDistanceSliderIDC		79145
		#define CSSA3_interactMenuGroupIDC		7915
		#define CSSA3_unitListGroupIDC			7912
		BIS_fnc_camera_draw3D = addmissioneventhandler ["draw3d","[] call CSSA3_fnc_draw3DHUD;"];

		[
			"CfgPatches",
			"AGM_Core",
			"player setVariable ['AGM_Bleeding', false];
			player setVariable ['AGM_Unconscious', false];
			player setVariable ['AGM_InPain', false];
			'chromAberration' ppEffectEnable false;
			[false] call AGM_Core_fnc_disableUserInput;"
		] spawn CSSA3_fnc_classExists;

		[
			"CfgPatches",
			"acre_main",
			"[true] call acre_api_fnc_setSpectator;"
		] spawn CSSA3_fnc_classExists;

		[
			"CfgPatches",
			"ALiVE_main",
			""
		] spawn CSSA3_fnc_classExists;

		//---Creates temporary camera.
		_cam = "camera" camcreate [0,0,0];

		//--- Declare variables
		CSSA3_LMB = false;
		CSSA3_RMB = false;
		CSSA3_lmbDown = false;
		CSSA3_fromRose = false;
		CSSA3_canChangeUnit = true;
		CSSA3_isDraggingLB = [];
		CSSA3_favourites = [];
		CSSA3_oldUnitList = [];
		CSSA3_perspective = CSSA3_allowedModes select 0;
		CSSA3_selectedTab = "All";
		CSSA3_keys = [];
		CSSA3_LMBclick = [0,0];
		CSSA3_RMBclick = [0,0];
		CSSA3_pitchbank = [0,0];
		CSSA3_fov = 0.7;
		CSSA3_iconCamera = gettext (configfile >> "RscDisplayCamera" >> "iconCamera");
		CSSA3_vision = 0;
		CSSA3_visibleHUD = true;
		CSSA3_settings_shown = false;
		uinamespace setVariable ["BIS_fnc_guiMessage_status",false];
		uiNameSpace setVariable ["CSSA3_mainHUD",(findDisplay 7810)];
		missionnamespace setvariable ["CSSA3_mainCamera",_cam];

		//Create invisible helipad.
		CSSA3_placeHolder = "Land_HelipadEmpty_F" createVehicleLocal [0,0,0];

		//Unit names, unit tags, click to interact, preload camera.
		_CSSA3_defaultSettings = [1,1,0,0];
		CSSA3_settings = profileNameSpace getVariable ['CSSA3_savedSettings',[1,1,0,0]];

		//Adds missing settings to CSSA3_settings, if for example new settings are added in an updated release.
		if ((count CSSA3_settings) < (count _CSSA3_defaultSettings)) then {

			for "_i" from (count CSSA3_settings) to (count _CSSA3_defaultSettings -1) step 1 do {
				CSSA3_settings set [_i,_CSSA3_defaultSettings select _i];
				saveProfilenamespace;
			};
		};

		['closeSettings','initial'] spawn CSSA3_fnc_settingsHandler;

		_DIKcodes = true call bis_fnc_keyCode;
		_DIKlast = _DIKcodes select (count _DIKcodes - 1);
		for "_k" from 0 to (_DIKlast - 1) do {
			CSSA3_keys set [_k,false];
		};

		_display = uiNameSpace getVariable 'CSSA3_mainHUD';

		_ctrlMouseArea = _display displayctrl CSSA3_mouseAreaIDC;
		ctrlsetfocus _ctrlMouseArea;

		_ctrlMap = _display displayctrl CSSA3_mapIDC;
		_ctrlMap ctrlenable false;
		_ctrlMap ctrladdeventhandler ["draw","['MapDraw',_this] call CSSA3_fnc_mainSpectateFunctions;"];
		_ctrlMap ctrladdeventhandler ["mousebuttonclick","['MapClick',_this] call CSSA3_fnc_mainSpectateFunctions;"];
		//If map is not faded, framerate drops.
		_ctrlMap ctrlSetFade 1;
		_ctrlMap ctrlcommit 0;

		_ctrlInteractbutton = _display displayctrl 791511;
		_ctrlInteractbutton ctrlSetTextColor  [0, 0, 0, 0.5];

		//Destroy underwater PP effects.
		ppEffectDestroy [BIS_SuffRadialBlur, BIS_SuffBlur, BIS_SuffCC];

		//--- Disable menu chromatic aberration
		[] call bis_fnc_guiEffectTiles;

		//--- Initiate CSSA3 main UI update loop.
		[] spawn CSSA3_fnc_mainUpdateLoop;

//---Debug keys
//		(findDisplay 46) displaySetEventHandler ["keydown",'hint format ["%1",_this]'];

		//--- Remove mission overlay.
		_displayMission = [] call (uinamespace getvariable "bis_fnc_displayMission");
		_control = _displayMission displayctrl 11400;
		_control ctrlsetfade 1;
		_control ctrlcommit 0;

		//--- Remove other overlays.
		cuttext ["","plain"];
		titletext ["","plain"];
		_layers = missionnamespace getvariable ["bis_fnc_rscLayer_list",[]];

		for "_l" from 1 to (count _layers - 1) step 2 do {
			(_layers select _l) cuttext ["","plain"];
		};
		clearradio;
		enableradio false;

		//Scheduled init.
		_null = [] spawn {

			waitUntil {!isNil "CSSA3_spectatableUnits"};

			//If there are no spectatable units.
			if (count CSSA3_spectatableUnits < 1) then {
				CSSA3_spectatedUnit = objNull;
			} else {
				CSSA3_spectatedUnit = CSSA3_spectatableUnits select 0;
			};

			CSSA3_CTIselectedUnit = CSSA3_spectatedUnit;

			//--- Create initial camera and set view mode.
			[] spawn CSSA3_fnc_changeView;

			cutText ["CSSA3 Initiated. Press 'F1' for more help. You can hide the HUD at any time by pressing 'H'","PLAIN DOWN",3,true];
			sleep 13;
			cuttext ["","plain",2];
		};
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "Mouse": {
		_display = ctrlparent (_this select 0);
		_cam = missionnamespace getvariable ["CSSA3_mainCamera",objnull];
		_pitchbank = CSSA3_pitchbank;
		_pitch = _pitchbank select 0;
		_bank = _pitchbank select 1;
		_mX = _this select 1;
		_mY = _this select 2;

		//--- Camera movement
		if (CSSA3_LMB || {CSSA3_RMB}) then {

			if (CSSA3_LMB && {CSSA3_RMB}) exitWith {

				_defX = CSSA3_LMBclick select 0;
				_defY = CSSA3_LMBclick select 1;

				_camZ = (getposatl _cam select 2) max 1 min 256;
				_dX = (_mX - _defX) * _camZ / 2;
				_dY = -(_mY - _defY) * _camZ / 2;

				_camPos = getposasl _cam;
				_camPos = [_camPos,_dY,direction _cam] call bis_fnc_relpos;
				_camPos = [_camPos,_dX,direction _cam + 90] call bis_fnc_relpos;
				_cam setposasl _camPos;
				CSSA3_lmbDown = false;
			};

			if (CSSA3_LMB) then {
				if ((!CSSA3_lmbDown)&&{CSSA3_settings select 2 == 1}) then {
					[_mX,_mY] spawn CSSA3_fnc_LMBhandler;
				};

			} else {

				_defX = CSSA3_RMBclick select 0;
				_defY = CSSA3_RMBclick select 1;

				_dX = (_mX - _defX) * 180;
				_dY = -(_mY - _defY) * 180;

				if (CSSA3_keys select DIK_LCONTROL) then {
					_bank = (_bank + _dX * 0.1) max -180 min +180;
					CSSA3_pitchbank set [1,_bank];
				} else {
					_cam setdir (direction _cam + _dX);
					_pitch = (_pitch + _dY) max -90 min +90;
				};
				[
					_cam,
					_pitch,
					_bank
				] call bis_fnc_setpitchbank;
				CSSA3_RMBclick = [_mX,_defY];
			};
		};


		_coef = 0.1;
		if (CSSA3_keys select DIK_LMENU) then {_coef = _coef * 100;};
		if (CSSA3_keys select DIK_LSHIFT) then {_coef = _coef * 10;};
		if (CSSA3_keys select DIK_RSHIFT) then {_coef = _coef / 10;};

		if (CSSA3_keys select DIK_W) then {[0,1,0,_coef] call CSSA3_fnc_camMove;};
		if (CSSA3_keys select DIK_S) then {[0,-1,0,_coef] call CSSA3_fnc_camMove;};
		if (CSSA3_keys select DIK_A) then {[-1,1,0,_coef] call CSSA3_fnc_camMove;};
		if (CSSA3_keys select DIK_D) then {[1,1,0,_coef] call CSSA3_fnc_camMove;};

		if (CSSA3_keys select DIK_Q) then {[0,0,1,_coef] call CSSA3_fnc_camMove;};
		if (CSSA3_keys select DIK_Z) then {[0,0,-1,_coef] call CSSA3_fnc_camMove;};

		if (CSSA3_keys select DIK_NUMPAD1) then {[-1,-1] call CSSA3_fnc_camRotate;};
		if (CSSA3_keys select DIK_NUMPAD1) then {[-1,-1] call CSSA3_fnc_camRotate;};
		if (CSSA3_keys select DIK_NUMPAD2) then {[+0,-1] call CSSA3_fnc_camRotate;};
		if (CSSA3_keys select DIK_NUMPAD3) then {[+1,-1] call CSSA3_fnc_camRotate;};
		if (CSSA3_keys select DIK_NUMPAD4) then {[-1,+0] call CSSA3_fnc_camRotate;};
		if (CSSA3_keys select DIK_NUMPAD6) then {[+1,+0] call CSSA3_fnc_camRotate;};
		if (CSSA3_keys select DIK_NUMPAD7) then {[-1,+1] call CSSA3_fnc_camRotate;};
		if (CSSA3_keys select DIK_NUMPAD8) then {[+0,+1] call CSSA3_fnc_camRotate;};
		if (CSSA3_keys select DIK_NUMPAD9) then {[+1,+1] call CSSA3_fnc_camRotate;};

		if (CSSA3_keys select DIK_ADD) then {
			CSSA3_fov = (CSSA3_fov - 0.01) max 0.01;
			_cam campreparefov CSSA3_fov;
			_cam camcommitprepared 0;
		};
		if (CSSA3_keys select DIK_SUBTRACT) then {
			CSSA3_fov = (CSSA3_fov + 0.01) min 1;
			_cam campreparefov CSSA3_fov;
			_cam camcommitprepared 0;
		};
	};


	///////////////////////////////////////////////////////////////////////////////////////////
	case "MouseButtonDown": {
		_cam = missionnamespace getvariable ["CSSA3_mainCamera",objnull];
		_button = _this select 1;
		_mX = _this select 2;
		_mY = _this select 3;
		_shift = _this select 4;
		_ctrl = _this select 5;
		_alt = _this select 6;

		if ((ctrlEnabled CSSA3_interactMenuGroupIDC) && {!([CSSA3_interactMenuGroupIDC,_mX,_mY] call CSSA3_fnc_ctrlActive)}) then {[] spawn CSSA3_fnc_closeInteractRose;};

		if (_button > 0) then {
			CSSA3_RMB = true;
			CSSA3_RMBclick = [_mX,_mY];
		} else {
			CSSA3_LMB = true;
			CSSA3_LMBclick = [_mX,_mY];
		};
		CSSA3_pitchbank = _cam call bis_fnc_getpitchbank;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "MouseButtonUp": {
		_cam = missionnamespace getvariable ["CSSA3_mainCamera",objnull];
		_button = _this select 1;
		_mX = _this select 2;
		_mY = _this select 3;

		if (count CSSA3_isDraggingLB > 0) then {

			_unitToAdd = [((CSSA3_isDraggingLB select 1) select 0) select 2] call CSSA3_fnc_strToUnit;
			if ([79120,_mX,_mY] call CSSA3_fnc_ctrlActive) then {
				[_unitToAdd] spawn CSSA3_fnc_addremoveFavourite;
			};
			CSSA3_isDraggingLB = [];
		};

		if (_button > 0) then {
			CSSA3_RMB = false;
			CSSA3_RMBclick = [0,0];
		} else {
			CSSA3_RMBclick = [_mX,_mY];
			CSSA3_LMB = false;
			CSSA3_lmbDown = false;
			CSSA3_LMBclick = [0,0];
		};

		CSSA3_pitchbank = _cam call bis_fnc_getpitchbank;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "MouseZChanged": {
		_display = uiNameSpace getVariable 'CSSA3_mainHUD';
		_ctrlMap = _display displayctrl CSSA3_mapIDC;

		//If map is not open.
		if !(ctrlenabled _ctrlMap) then {

			//If LMB and RMB is pressed.
			if (CSSA3_LMB && {CSSA3_RMB}) exitWith {
				[0,0,_this select 1,1] call CSSA3_fnc_camMove;
			};

			//If no mouse key is pressed.
			_cam = missionnamespace getvariable ["CSSA3_mainCamera",objnull];
			_camVector = vectordir _cam;

			_dZ = (_this select 1) * 4;
			_vX = (_camVector select 0) * _dZ;
			_vY = (_camVector select 1) * _dZ;
			_vZ = (_camVector select 2) * _dZ;

			_camPos = getposasl _cam;
			_camPos = [
				(_camPos select 0) + _vX,
				(_camPos select 1) + _vY,
				(_camPos select 2) + _vZ
			];
			_camPos set [2,(_camPos select 2) max (getterrainheightasl _camPos)];
			_cam setposasl _camPos;
		};
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "KeyDown": {
		//_this call bis_fnc_log;
		_display = _this select 0;
		_key = _this select 1;
		_shift = _this select 2;
		_ctrl = _this select 3;
		_alt = _this select 4;
		_return = false;

		CSSA3_keys set [_key,true];

		_cam = missionnamespace getvariable ["CSSA3_mainCamera",objnull];

		switch (_key) do {

			//Debug console.
/*			case (DIK_F5): {
				_display createdisplay "RscDisplayDebugPublic";
				_result = true;
			};*/

			case (DIK_NUMPAD5): {
				_cam = missionNameSpace getVariable "CSSA3_mainCamera";
				CSSA3_pitchbank = [0,0];
				[0,0] call CSSA3_fnc_camRotate;
				CSSA3_fov = 0.7;
				_camPos = position _cam;
				_camDir = direction _cam;
				_cam setdir _camDir;
				_cam campreparefov CSSA3_fov;
				_cam camcommitprepared 0;

			};

			case (DIK_M): {
				_ctrlMouseArea = _display displayctrl CSSA3_mouseAreaIDC;
				_ctrlMap = _display displayctrl CSSA3_mapIDC;
				if (ctrlenabled _ctrlMap) then {
					_ctrlMouseArea ctrlenable true;
					_ctrlMap ctrlenable false;
					ctrlsetfocus _ctrlMap;
					_ctrlMap ctrlsetposition [-10,-10,0.8 * safezoneW,0.8 * safezoneH];
					_ctrlMap ctrlSetFade 1;
					_ctrlMap ctrlcommit 0;
				} else {
					_ctrlMouseArea ctrlenable false;
					_ctrlMap ctrlenable true;
					ctrlsetfocus _ctrlMap;
					_ctrlMapPos = [
						safezoneX + 0.145 * safezoneW,
						safezoneY + 0.13 * safezoneH,
						0.75 * safezoneW,
						0.75 * safezoneH
					];
					_ctrlMap ctrlsetposition _ctrlMapPos;
					_ctrlMap ctrlSetFade 0;
					_ctrlMap ctrlcommit 0;
					_ctrlMap ctrlmapanimadd [0,0.1,position _cam];
					ctrlmapanimcommit _ctrlMap;
//					{player reveal [_x,4]} foreach CSSA3_spectatableUnits;
				};
			};

			case (DIK_H): {
				_ctrlOverlays = [
					_display displayctrl 3142,
					_display displayctrl 3143,
					_display displayctrl 79120,
					_display displayctrl 791200,
					_display displayctrl CSSA3_unitListGroupIDC,
					_display displayctrl CSSA3_mainDialogControlIDC
				];
				if (CSSA3_visibleHUD) then {
					{_x ctrlShow false} foreach _ctrlOverlays;
					(_display displayctrl 3142) ctrlenable false;
					cameraEffectEnableHUD false;
				} else {
					{_x ctrlShow true} foreach _ctrlOverlays;
					(_display displayctrl 3142) ctrlenable true;
					cameraEffectEnableHUD true;
				};
				CSSA3_visibleHUD = !CSSA3_visibleHUD;
			};

			case (DIK_N): {
				CSSA3_vision = CSSA3_vision + 1;
				_vision = CSSA3_vision % 4;
				switch (_vision) do {
					case 0: {
						camusenvg false;
						false SetCamUseTi 0;
					};
					case 1: {
						camusenvg true;
						false SetCamUseTi 0;
					};
					case 2: {
						camusenvg false;
						true SetCamUseTi 0;
					};
					case 3: {
						camusenvg false;
						true SetCamUseTi 1;
					};
				};
			};

			case (DIK_ESCAPE): {
				_return = true;
				_this spawn {
					disableserialization;
					_display = _this select 0;
					_message = [
						parseText "Do you really want to quit? <br/><br/>You will automatically be returned to the spectator script within 5 seconds, unless the escape menu is open.",
						"CSSA3",
						nil,
						true,
						_display
					] call bis_fnc_guimessage;
					if (_message) then {
						_display closedisplay 2;
					};
				};
			};

			case (DIK_TAB): {
				//If alt is pressed, exit (To avoid minimizing unit list when alt-tabbing.)
				if (_alt || _shift) exitWith {};
				[] spawn CSSA3_fnc_animateUnitList;
				ctrlsetfocus _ctrlMouseArea;
			};

			case (DIK_1): {
				CSSA3_perspective = "firstPerson";
				[objNull] spawn CSSA3_fnc_changeView;
			};

			case (DIK_2): {
				CSSA3_perspective = "freeCam";
				[objNull] spawn CSSA3_fnc_changeView;
			};

			case (DIK_3): {
				CSSA3_perspective = "thirdPerson";
				[objNull] spawn CSSA3_fnc_changeView;
			};

			case (DIK_F1): {
					if !(uinamespace getvariable "BIS_fnc_guiMessage_status") then {
					_return = true;
					_this spawn {
						disableserialization;
						_display = findDisplay 46;
						_message = [
							parseText 
                                                        "- Move Camera: W, A, S, D
                                                         - Camera Altitude: Q, Z
                                                         - Smooth Move: LMB + RMB
                                                         - Switch View Perspective: 1, 2, 3
                                                         - Object Interact: Hold LMB on object.
                                                         - Tilt Camera: Ctrl + RMB + Mouse Move
                                                         - Rotate Camera: RMB + Mouse Move
                                                         - Reset Camera: Num 5
                                                         - Toggle Optic Mode: N
                                                         - Hide units list: Tab
                                                         - Hide HUD: H
                                                         - Settings: F2
                                                         - Help: F1
                                                         - Map: M<br/>
                                                        Script by Cyrokrypto",
							"CSSA3 Help:",
							True,
							nil,
							_display,
							false,
							false
						] call bis_fnc_guimessage;
					};
				};
			};
			case (DIK_F2): {
				if !(CSSA3_settings_shown) then {

					['openSettings',objNull] spawn CSSA3_fnc_settingsHandler;
				} else {
					['closeSettings','save'] spawn CSSA3_fnc_settingsHandler;
				};
			};
			default {};
		};
		_return
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "KeyUp": {
		CSSA3_keys set [_this select 1,false];
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "MapDraw": {
		_cam = missionnamespace getvariable ["CSSA3_mainCamera",objnull];
		_ctrlMap = _this select 0;
		_ctrlMap drawIcon [
			CSSA3_iconCamera,
			[0,1,1,1],
			position _cam,
			32,
			32,
			direction _cam,
			"",
			1
		];
		//[texture, color, position, width, height, angle, text, shadow]
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "MapClick": {
		_ctrlMap = _this select 0;
		_button = _this select 1;
		_posX = _this select 2;
		_posY = _this select 3;
		if (_button == 0) then {
			_worldPos = _ctrlMap ctrlmapscreentoworld [_posX,_posY];
			_cam = missionnamespace getvariable ["CSSA3_mainCamera",objnull];

			if (CSSA3_perspective == "freeCam") exitWith {
				_cam setpos [
					_worldPos select 0,
					_worldPos select 1,
					getposatl _cam select 2];
			};

			if ((CSSA3_perspective == "firstPerson" || {CSSA3_perspective == "thirdPerson"})) exitWith {
				_nearestUnits = (nearestObjects [_worldPos, ["Man","AllVehicles"], 10]);
				if (count _nearestUnits > 0) then {CSSA3_spectatedUnit = _nearestUnits select 0; [objNull] spawn CSSA3_fnc_changeView;};
			};
		};
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "Exit": {

	//	if (!isNull (findDisplay 7810)) exitWith {};

		((findDisplay 49) displayCtrl 1010) ctrlEnable true;
		with missionnamespace do {
			_cam = missionnamespace getvariable ["CSSA3_mainCamera",objnull];
			_cam cameraeffect ["terminate","back"];
			player switchCamera "INTERNAL";
			camdestroy _cam;

			CSSA3_mainCamera = nil;
			BIS_fnc_camera_target = nil;
		};

		//If task force radio is enabled, turn off spectator mode.
		[
			"CfgPatches",
			"task_force_radio",
			"[player, false] call TFAR_fnc_forceSpectator;"
		] spawn CSSA3_fnc_classExists;

		//If ACRE2 is enabled, turn off spectator mode.
		[
			"CfgPatches",
			"acre_main",
			"[false] call acre_api_fnc_setSpectator;"
		] spawn CSSA3_fnc_classExists;

		//Destroy variables. With fire... and pitchforks.
		uiNameSpace setVariable ['CSSA3_mainHUD',nil];

		CSSA3_LMB = nil;
		CSSA3_RMB = nil;
		CSSA3_lmbDown = nil;
		CSSA3_fromRose = nil;
		CSSA3_canChangeUnit = nil;
		CSSA3_isDraggingLB = nil;
		CSSA3_favourites = nil;
		CSSA3_perspective = nil;
		CSSA3_selectedTab = nil;
		CSSA3_keys = nil;
		CSSA3_LMBclick = nil;
		CSSA3_RMBclick = nil;
		CSSA3_pitchbank = nil;
		CSSA3_fov = nil;
		CSSA3_iconCamera = nil;
		CSSA3_vision = nil;
		CSSA3_visibleHUD = nil;
		CSSA3_settings_shown = nil;
		CSSA3_settings = nil;
		CSSA_fnc_DrawLine3D = nil;

		removemissioneventhandler ["draw3d",BIS_fnc_camera_draw3D];
		BIS_fnc_camera_draw3D = nil;

		if !(isNil {CSSA3_fnc_DrawLine3D}) then
		{
			removemissioneventhandler ["draw3d",CSSA3_fnc_DrawLine3D];
			CSSA3_fnc_DrawLine3D = nil;
		};

		camusenvg false;
		false SetCamUseTi 0;

		//Reapply underwater PP effects.
		_null = [] spawn {
			//suffocating
			BIS_SuffCC = ppEffectCreate ["ColorCorrections", 1610];

			// init PP to avoid artefacts after going under water.
			BIS_SuffCC ppEffectAdjust [1,1,0,[0, 0, 0, 0 ],[1, 1, 1, 1],[0,0,0,0], [-1, -1, 0, 0, 0, 0.001, 0.5]];

			BIS_SuffRadialBlur = ppEffectCreate ["RadialBlur", 270];
			BIS_SuffBlur = ppEffectCreate ["DynamicBlur", 170];
		};

		cuttext ["","plain"];
		deleteVehicle CSSA3_placeHolder;

		enableradio true;

		//Ensure that camera is set to player.
		if (alive player && {cameraon != player}) then {
			player switchCamera "INTERNAL";
		};


		[] spawn CSSA3_fnc_forceReopen;

		diag_log text "[CSSA3 Notice]: CSSA3 Exited. (fn_CSSA3_mainFunctions)";
	};
};