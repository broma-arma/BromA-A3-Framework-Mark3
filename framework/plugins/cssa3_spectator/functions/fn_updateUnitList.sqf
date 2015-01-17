/*
	Author: Cyrokrypto

	Description:
	- Updates the units listbox (called every second).
	- Listbox is updated based on what option (sorting tab) is selected.
	- Can be called at any time to instantly update lisbox.
	- Consider re-doing this. (Add/delete instead of complete refresh every second in order to reduce overhead)
	Parameter(s):
	None

	Returns:
	NOTHING
*/

if (isNil {CSSA3_selectedTab} || {isNil {CSSA3_validGroupsDataArray}}) exitWith {};

private ["_unitColour", "_spacing", "_selectedGroup", "_workingArray", "_unitsArray", "_side", "_colour", "_index", "_updateSide"];

disableserialization;

#define CSSA3_unitsListBoxIDC 79124
//Define variables.
_unitColour = [0.251,0.251,0.251,1];
_spacing = "";

//Runs if 'All' is selected.
if (CSSA3_selectedTab == "All") exitWith {

	//Clear listbox.
	lbClear CSSA3_unitsListBoxIDC;

	{
		_selectedGroup = _x;
		_workingArray = CSSA3_validGroupsDataArray select _forEachIndex;
		_unitsArray = _workingArray select 0;
		_side = _workingArray select 1;
		_colour = _workingArray select 2;

		_index = lbAdd [CSSA3_unitsListBoxIDC, str _selectedGroup];
		lbSetColor [CSSA3_unitsListBoxIDC, _index, _colour];

		{
                        _isDead = _x getVariable ["isDead",false];
			if (alive _x && !_isDead) then {
				if (_x in CSSA3_favourites) then {_spacing = ""} else {_spacing = "   "};
				_index = lbAdd [CSSA3_unitsListBoxIDC, _spacing + name _x];
				lbSetData [CSSA3_unitsListBoxIDC, _index, str _x];
				lbSetColor [CSSA3_unitsListBoxIDC, _index, _colour];
				if (_x in CSSA3_favourites) then {lbSetPicture [CSSA3_unitsListBoxIDC, _index, "framework\plugins\cssa3_spectator\images\star.paa"];};
			};
		} forEach _unitsArray;
	} forEach CSSA3_validGroupsArray;

};

//If Players tab is selected.
if (CSSA3_selectedTab == "Players") exitWith {

	//Clear listbox.
	lbClear CSSA3_unitsListBoxIDC;

	{
                _isDead = _x getVariable ["isDead",false];
		if ((alive _x)&&{(isPlayer _x)&&(!_isDead)}) then {
			_colour = call {
				if (side _x == WEST) exitWith {_unitColour = [0.098,0.361,0.62,1]};
				if (side _x == EAST) exitWith {_unitColour = [0.502,0,0,1]};
				if (side _x == civilian) exitWith {_unitColour = [0.373,0.016,0.706,0.7]};
				if (side _x == resistance) exitWith {_unitColour = [0,1,0,0.7]};
				_unitColour = [0.251,0.251,0.251,1];
		    };

			if (_x in CSSA3_favourites) then {_spacing = ""} else {_spacing = "   "};
			_index = lbAdd [CSSA3_unitsListBoxIDC, _spacing + name _x];
			lbSetData [CSSA3_unitsListBoxIDC, _index, str _x];
			lbSetColor [CSSA3_unitsListBoxIDC, _index, _unitColour];
			if (_x in CSSA3_favourites) then {lbSetPicture [CSSA3_unitsListBoxIDC, _index, "framework\plugins\cssa3_spectator\images\star.paa"];};
		};
	} forEach CSSA3_spectatableUnits;
};

//If Favourites tab is selected.
if (CSSA3_selectedTab == "Favourites") exitWith {

	//Clear listbox.
	lbClear CSSA3_unitsListBoxIDC;
	{
                _isDead = _x getVariable ["isDead",false];
		if (alive _x && !_isDead) then {
			_colour = call {
				if (side _x == WEST) exitWith {_unitColour = [0.098,0.361,0.62,1]};
				if (side _x == EAST) exitWith {_unitColour = [0.502,0,0,1]};
				if (side _x == civilian) exitWith {_unitColour = [0.373,0.016,0.706,0.7]};
				if (side _x == resistance) exitWith {_unitColour = [0,1,0,0.7]};
		      _unitColour = [0.251,0.251,0.251,1];
		    };

			_index = lbAdd [CSSA3_unitsListBoxIDC, name _x];
			lbSetData [CSSA3_unitsListBoxIDC, _index, str _x];
			lbSetColor [CSSA3_unitsListBoxIDC, _index, _unitColour];
			lbSetPicture [CSSA3_unitsListBoxIDC, _index, "CSSA3\images\star.paa"];

//			if (CSSA3_spectatedUnit == _x) then {[_index] spawn CSSA3_fnc_setListboxIndex};
		};
	} forEach CSSA3_favourites;
};

//Function used to update listbox if specific side is chosen.
_updateSide = {
	private ["_unitColour","_spectateableGroups","_spacing","_currentGroup","_index"];
	disableserialization;

	//Clear listbox.
	lbClear CSSA3_unitsListBoxIDC;

	{
		_selectedGroup = _x;
		_workingArray = CSSA3_validGroupsDataArray select _forEachIndex;
		_unitsArray = _workingArray select 0;
		_side = _workingArray select 1;
		_colour = _workingArray select 2;

		if (_side == _this select 0) then {
		_index = lbAdd [CSSA3_unitsListBoxIDC, str _selectedGroup];
		lbSetColor [CSSA3_unitsListBoxIDC, _index, _colour];

			{
                                _isDead = _x getVariable ["isDead",false];
				if (alive _x && !_isDead) then {
					if (_x in CSSA3_favourites) then {_spacing = ""} else {_spacing = "   "};
					_index = lbAdd [CSSA3_unitsListBoxIDC, _spacing + name _x];
					if (_x in CSSA3_favourites) then {lbSetPicture [CSSA3_unitsListBoxIDC, _index, "framework\plugins\cssa3_spectator\images\star.paa"];};
					lbSetData [CSSA3_unitsListBoxIDC, _index, str _x];
					lbSetColor [CSSA3_unitsListBoxIDC, _index, _colour];

//					if (CSSA3_spectatedUnit == _x) then {[_index] spawn CSSA3_fnc_setListboxIndex};
				};
			} forEach _unitsArray;
		};
	} forEach CSSA3_validGroupsArray;
};

//If the Blufor tab is selected.
if (CSSA3_selectedTab == "Blufor") exitWith {[west] spawn _updateSide};
if (CSSA3_selectedTab == "Opfor") exitWith {[east] spawn _updateSide};
if (CSSA3_selectedTab == "Independent") exitWith {[resistance] spawn _updateSide};
if (CSSA3_selectedTab == "Civilians") exitWith {[civilian] spawn _updateSide};

//If a non-existing string is selected for CSSA3_selectedTab, debug.
diag_log text "[CSSA3 Notice]: Non existing tab selected. (fn_updateUnitList)";