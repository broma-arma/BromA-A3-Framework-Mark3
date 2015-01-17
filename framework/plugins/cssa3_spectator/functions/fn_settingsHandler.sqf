/*
	Author: Cyrokrypto

	Description:
	- Handler for CSSA3 settings menu. (WIP)
	- Functional, but needs a re-write.

	Parameter(s):
	None

	Returns:
	NOTHING
*/

private ["_action", "_params", "_strToBool", "_display", "_settingsControl", "_cbUnitNames", "_cbUnitTags", "_cbClickToInteract", "_cbPreloadCamera", "_ctrlViewDistanceSlider", "_newDistance", "_state"];



disableSerialization;

#define CSSA3_settingsControlIDC		7914
#define CSSA3_cbUnitNamesIDC			79142
#define CSSA3_cbUnitTagsIDC				79143
#define CSSA3_cbClickToInteractIDC		79144
#define CSSA3_viewDistanceSliderIDC		79145
#define CSSA3_viewdistanceTextIDC		791451
#define CSSA3_drawDistanceSliderIDC		79146
#define CSSA3_drawDistanceTextIDC		791461
#define CSSA3_cbpreloadCameraIDC		79147
_action = _this select 0;
_params = _this select 1;

_strToBool = false;
_display = uiNameSpace getVariable 'CSSA3_mainHUD';
//Unit names, unit tags, projectile lines, viewdistance.

switch (_action) do {
	case 'openSettings' : {
		_strToBool = false;
		CSSA3_settings = profileNameSpace getVariable ['CSSA3_savedSettings',[1,1,0,0]];

		_settingsControl = _display displayCtrl CSSA3_settingsControlIDC;
		_settingsControl ctrlShow true;
		CSSA3_settings_shown = true;

		_cbUnitNames = _display displayCtrl CSSA3_cbUnitNamesIDC;
		if (CSSA3_settings select 0 == 1) then {_strToBool = true} else {_strToBool = false};
		_cbUnitNames cbSetChecked _strToBool;

		_cbUnitTags = _display displayCtrl CSSA3_cbUnitTagsIDC;
		if (CSSA3_settings select 1 == 1) then {_strToBool = true} else {_strToBool = false};
		_cbUnitTags cbSetChecked _strToBool;

		_cbClickToInteract = _display displayCtrl CSSA3_cbClickToInteractIDC;
		if (CSSA3_settings select 2 == 1) then {_strToBool = true} else {_strToBool = false};
		_cbClickToInteract cbSetChecked _strToBool;

		_cbPreloadCamera = _display displayCtrl CSSA3_cbpreloadCameraIDC;
		if (CSSA3_settings select 3 == 1) then {_strToBool = true} else {_strToBool = false};
		_cbPreloadCamera cbSetChecked _strToBool;

		_ctrlViewDistanceSlider = _display displayCtrl CSSA3_viewDistanceSliderIDC;
		_ctrlViewDistanceSlider sliderSetPosition ceil ((viewDistance) / 1000);
		ctrlSetText [CSSA3_viewdistanceTextIDC, format ["%1 %2m", "View distance: ",round viewDistance]];

		_settingsControl ctrlCommit 0;
		ctrlEnable [CSSA3_settingsControlIDC, true];
	};
	case 'closeSettings' : {
		_settingsControl = _display displayCtrl CSSA3_settingsControlIDC;
		_settingsControl ctrlShow false;

		ctrlEnable [CSSA3_settingsControlIDC, false];
		_settingsControl ctrlCommit 0;

		if (_params != 'initial') then
		{
			profileNameSpace setVariable ["CSSA3_savedSettings",CSSA3_settings];
			saveProfileNamespace;
		};
		CSSA3_settings_shown = false;
	};
	case 'distanceSliderChanged' : {
		if (_params select 1 > 0) then {
			_newDistance = ceil ((_params select 1) * 1000);
			setViewDistance _newDistance;
			ctrlSetText [CSSA3_viewdistanceTextIDC, format ["%1 %2m", "View distance: ", viewDistance]];
		};
	};

	case 'showUnitNames' : {
		_state = _params select 1;
		CSSA3_settings set [0, _state];
	};
	case 'showUnitTags' : {
		_state = _params select 1;
		CSSA3_settings set [1, _state];
	};
	case 'enableClickToInteract' : {
		_state = _params select 1;
		CSSA3_settings set [2, _state];
	};
	case 'preloadCamera' : {
		_state = _params select 1;
		CSSA3_settings set [3, _state];
	};

	default { diag_log text "CSSA3: Error - 'Default' in 'fn_settingsHander.sqf'" };
};