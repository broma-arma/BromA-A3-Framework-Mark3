/*
	Author: Cyrokrypto

	Description:
	- Hides (minimizes) or unhides (maximizes) the units controls.;

	Parameter(s):
	None

	Returns:
	NOTHING
*/

private ["_display", "_listBox", "_ctrlGroup", "_ctrlAddRemove", "_ctrlMinMaxGroup", "_ctrlMinMaxButton", "_controls", "_maximizedPositions", "_minimizedPositionsX", "_i"];


disableSerialization;

_display = findDisplay 7810;
_listBox = _display displayCtrl 79124;

_ctrlGroup = _display displayCtrl 7912;
_ctrlAddRemove = _display displayCtrl 79120;
_ctrlMinMaxGroup = _display displayCtrl 791200;
_ctrlMinMaxButton = _display displayCtrl 791201;

_controls = [_ctrlGroup,_ctrlAddRemove,_ctrlMinMaxGroup];

//Predefined maximize positions. Need to be changed when control changes.
_maximizedPositions = [
	[-0.000156274 * safezoneW + safezoneX,
	0.269 * safezoneH + safezoneY,
	0.13210367 * safezoneW,
	0.520 * safezoneH],
	[-0.000156274 * safezoneW + safezoneX,
	0.758 * safezoneH + safezoneY,
	0.13200 * safezoneW,
	0.03 * safezoneH],
	[0.131947396 * safezoneW + safezoneX,
	0.508 * safezoneH + safezoneY,
	0.0123125 * safezoneW,
	0.03 * safezoneH]
];

//Calculated minimize (X) position.
_minimizedPositionsX = [(((_maximizedPositions select 0) select 0)-((_maximizedPositions select 0) select 2)),
						(((_maximizedPositions select 1) select 0)-((_maximizedPositions select 1) select 2)),
						0 * safezoneW + safezoneX];

//If listbox is maximized, minimize it.
if (ctrlEnabled 79124) then {

	ctrlEnable [79124,false];
	_ctrlMinMaxButton ctrlSetText ">";

	for "_i" from 0 to (count _controls-1) step 1  do {
		(_controls select _i) ctrlSetPosition [
			(_minimizedPositionsX select _i),		  //X
			(_maximizedPositions select _i) select 1, //Y
			(_maximizedPositions select _i) select 2, //W
			(_maximizedPositions select _i) select 3  //H
		];
	};
//Else maximize it.
} else {

	ctrlEnable [79124,true];
	_ctrlMinMaxButton ctrlSetText "<";

	for "_i" from 0 to (count _controls-1) step 1  do {
		(_controls select _i) ctrlSetPosition [
			(_maximizedPositions select _i) select 0, //X
			(_maximizedPositions select _i) select 1, //Y
			(_maximizedPositions select _i) select 2, //W
			(_maximizedPositions select _i) select 3  //H
		];
	};
};

//Commit changed controls.
{_x ctrlCommit 0.3} count _controls;