/*

Modular Gear Script made by Nife and Royal for BromA

*/

private
["_isLeader","_bandage","_morphine","_epi","_bloodbag","_radio","_medkit","_wsmoke","_gsmoke","_rsmoke",
"_backpack","_addBinocs","_addRadio","_addAmmo","_addWeapon","_wep","_ammoamount","_isMan",
"_fieldDressing", "_packingBandage", "_elasticBandage","_quickClot", "_personalAidKit",
"_tourniquet", "_atrophine", "_saline1000", "_saline500", "_saline250","_blood1000",
"_blood500", "_blood250", "_plasma1000", "_plasma500", "_plasma250", "_surgKit", "_bodyBag",
"_wFLARE", "_rFLARE", "_gFLARE", "_yFLARE", "_cableTie", "_uavBattery", "_mapTools", "_flashlight",
"_spareBarrel", "_kestrel", "_IRStrobe", "_clacker", "_M26clacker", "_defusalKit","_defib",
"_deadManSwitch", "_earBuds", "_cellphone", "_microDAGR", "_NVGEN1", "_NVGEN2",
"_NVGEN4", "_NVWIDE", "_suppliesMEDIC", "_suppliesNORMAL", "_countBANDAGE",
"_countMORPHINE", "_countEPI", "_countBLOODBAG", "_countBandageCARGO",
"_countMorphineCARGO", "_countEpiCARGO", "_countBloodbagCARGO", "_countBANDAGEPACKING"
];

_isLeader = false;
_isMan = _unit isKindOf "Man";
if (_isMan) then {
    _isLeader = isFormationLeader _unit;
};

// Some nifty functions to save time -------------------------------------------
_addOptics = {
    _kind = _this select 0;
    if _isMan then {
        switch(_kind) do {
            case "binoc": { _unit addWeapon (_optics select 0)};
            case "rangefinder": {
                switch (true) do {
                    case (mission_AGM_enabled): { _unit addWeapon "AGM_Vector" };
                    case (mission_ACE3_enabled): { _unit addWeapon "ACE_Vector" };
                    default { _unit addWeapon (_optics select 1) };
                };
            };
            case "laserdesignator": { _unit addWeapon (_optics select 2); _unit addMagazine (_battery select 0)};
        };
    } else {
        switch(_kind) do {
            case "binoc": { _unit addWeaponCargoGlobal (_optics select 0)};
            case "rangefinder": {
                switch (true) do {
                    case (mission_AGM_enabled): { _unit addWeaponCargoGlobal "AGM_Vector" };
                    case (mission_ACE3_enabled): { _unit addWeaponCargoGlobal "ACE_Vector" };
                    default { _unit addWeaponCargoGlobal (_optics select 1) };
                };
            };
            case "laserdesignator": { _unit addWeaponCargoGlobal (_optics select 2); _unit addMagazineCargoGlobal (_battery select 0)};
        };
    };
};

_attachToWeapon = {
    _type = _this select 0;
    _kind = _this select 1;
    switch (_type) do {
        case "primary": { _unit addPrimaryWeaponItem _kind };
        case "secondary": { _unit addHandgunItem _kind };
    };
};

_addRadio = {
    _kind = _this select 0;

    switch (true) do {
        case (mission_TFAR_enabled): {
            _side = side _unit;
            switch(_side) do {
                case WEST: {
                    switch(_kind) do {
                        case "SR": { _unit linkItem "tf_rf7800str" };
                        case "LR": { _unit addItem "tf_anprc152" };
                        case "BP": { removeBackpack _unit; _unit addBackPack "tf_rt1523g" };
                    };
                };
                case EAST: {
                    switch(_kind) do {
                        case "SR": { _unit linkItem "tf_pnr1000a" };
                        case "LR": { _unit addItem "tf_fadak" };
                        case "BP": { removeBackpack _unit; _unit addBackPack "tf_mr3000" };
                    };
                };
                case RESISTANCE: {
                    switch(_kind) do {
                        case "SR": { _unit linkItem "tf_anprc154" };
                        case "LR": { _unit addItem "tf_anprc148jem" };
                        case "BP": { removeBackpack _unit; _unit addBackPack "tf_anprc155" };
                    };
                };
            };
        };

        case (mission_ACRE2_enabled): {
            switch(_kind) do {
                case "SR": { _unit addItem "ACRE_PRC343" };
                case "LR": { _unit addItem "ACRE_PRC148" };
                case "BP": { [_commonBACKPACK] call _addEmptyBackpack; _unit addItemToBackpack "ACRE_PRC117F" };
            };
        };
    };
};

_stripUnit = {
    removeVest (_this select 0);
    removeHeadgear (_this select 0);
    removeBackpack (_this select 0);
    removeGoggles (_this select 0);
    removeUniform (_this select 0);
};

_addEmptyBackpack = {
    _unit addBackpack (_this select 0);
    clearAllItemsFromBackpack _unit;
};

_useUniform = {
    _headgear = (_this select 0);
    _uniform = (_this select 1);
    _vest = (_this select 2);
    _backpack = (_this select 3);

    switch(_headgear) do {
        case ("keep"): {};
        case ("empty"): { removeHeadgear _unit };
        default {removeHeadgear _unit; _unit addHeadgear _headgear };
    };
    switch(_uniform) do {
        case ("keep"): {};
        case ("empty"): { removeUniform _unit };
        default { removeUniform _unit; [[{}, _unit forceaddUniform _uniform], "BIS_fnc_spawn", true] call BIS_fnc_MP }
    };
    switch(_vest) do {
        case ("keep"): {};
        case ("empty"): { removeVest _unit };
        default { removeVest _unit; _unit addVest _vest};
    };
    switch(_backpack) do {
        case ("keep"): {};
        case ("empty"): { removeBackpack _unit };
        default { removeBackpack _unit; [_backpack] call _addEmptyBackpack };
    };

};

_addAmmo = {
    _kind = _this select 0;
    _amount = _this select 1;
    if _isMan then {
        if (typeName _kind == "ARRAY") then {
            for "_i" from 1 to _amount do {
                if ((vest _unit) == "") then {
                    _unit addMagazine (_kind select 1);
                } else {
                    if (_unit canAddItemToVest (_kind select 1)) exitWith { _unit addItemToVest (_kind select 1) };
                    if (_unit canAddItemToBackpack (_kind select 1)) exitWith { _unit addItemToBackpack (_kind select 1) };
                    if (_unit canAddItemToUniform (_kind select 1)) exitWith { _unit addItemToUniform (_kind select 1) };
                };
            };
        } else {
            for "_i" from 1 to _amount do {
                if ((vest _unit) == "") then {
                    _unit addMagazine _kind;
                } else {
                    if (_unit canAddItemToVest (_kind)) exitWith { _unit addItemToVest (_kind) };
                    if (_unit canAddItemToBackpack (_kind)) exitWith { _unit addItemToBackpack (_kind) };
                    if (_unit canAddItemToUniform (_kind)) exitWith { _unit addItemToUniform (_kind) };
                };
            };
        };
    } else {
        if (typeName _kind == "ARRAY") then { _unit addMagazineCargoGlobal [(_kind select 1),_amount];
        } else { _unit addMagazineCargoGlobal [_kind,_amount] };
    };
};

_addItem = {
    _kind = _this select 0;
    _amount = _this select 1;
    if (_isMan) then {
        if (typeName _kind == "ARRAY") then { for "_i" from 1 to _amount do { if ((vest _unit)=="") then {_unit addItem (_kind select 1)} else {_unit addItemToVest (_kind select 1)}};
        } else { for "_i" from 1 to _amount do {if ((vest _unit)=="") then {_unit addItem _kind} else {_unit addItemToVest _kind}}};
    } else {
        if (typeName _kind == "ARRAY") then { _unit addItemCargoGlobal [(_kind select 1),_amount];
        } else { _unit addItemCargoGlobal [_kind,_amount] };
    };
};

_linkItem = {
    { _unit linkItem _x } forEach _this;
};

_addWeapon = {
    _kind = _this select 0;
    if _isMan then {
        if (typeName _kind == "ARRAY") then { _unit addWeapon (_kind select 0); }
        else { _unit addWeapon _kind; };
    } else {
        _amount = _this select 1;
        if (typeName _kind == "ARRAY") then { _unit addWeaponCargoGlobal [_kind select 0,_amount]; }
        else { _unit addWeaponCargoGlobal [_kind,_amount] };
    };
};

_addtoUniform = {
    _array = _this select 0;
    _unit = _array select 0;

    for "_i" from 1 to (count _array) do {
        for "_j" from 1 to ((_array select _i)select 1) do {
            _unit addItemToUniform ((_array select _i)select 0);
        };
    };
};

_addtoVest = {
    _array = _this select 0;
    _unit = _array select 0;

    for "_i" from 1 to (count _array) do {
        for "_j" from 1 to ((_array select _i)select 1) do {
            _unit addItemToVest ((_array select _i)select 0);
        };
    };
};

_addtoBackpack = {
    _array = _this select 0;
    _unit = _array select 0;

    for "_i" from 1 to (count _array) do {
        for "_j" from 1 to ((_array select _i)select 1) do {
            _unit addItemToBackpack ((_array select _i)select 0);
        };
    };
};

_addWeaponKit = {
    [_this select 0, _this select 1] call _addAmmo;
    [_this select 0] call _addWeapon;
};

_addMedicBasics = {
    _basics = _this select 0;
    [[_unit,[_bandage, _basics select 0],[_morphine, _basics select 1],[_epi, _basics select 2]]] call _addToUniform;
};

_addtoCargo = {
    _array = _this select 0;
    _unit = _array select 0;
    _type = _array select 1;

    for "_i" from 2 to (count _array) do {
        switch(_type) do {
            case("weapon"): { _unit addWeaponCargoGlobal [((_array select _i)select 0),((_array select _i)select 1)]};
            case("magazine"): { _unit addMagazineCargoGlobal [((_array select _i)select 0),((_array select _i)select 1)]};
            case("item"): { _unit addItemCargoGlobal [((_array select _i)select 0),((_array select _i)select 1)]};
            case("backpack"): { _unit addBackpackCargoGlobal [((_array select _i)select 0),((_array select _i)select 1)]};
        };
    };
};

_addRadioToCargo = {
    _unit = _this select 0;
    _kind = _this select 1;
    _side = _this select 2;
    _amount = _this select 3;

    _isBP = false;

    private ["_radio"];

    switch (true) do {
        case (mission_TFAR_enabled): {
            switch(_side) do {
                case WEST: {
                    switch(_kind) do {
                        case "SR": { _radio = "tf_rf7800str" };
                        case "LR": { _radio = "tf_anprc152" };
                        case "BP": { _radio = "tf_rt1523g"; _isBP = true };
                    };
                };
                case EAST: {
                    switch(_kind) do {
                        case "SR": { _radio = "tf_pnr1000a" };
                        case "LR": { _radio = "tf_fadak" };
                        case "BP": { _radio = "tf_mr3000"; _isBP = true };
                    };
                };
                case RESISTANCE: {
                    switch(_kind) do {
                        case "SR": { _radio = "tf_anprc154" };
                        case "LR": { _radio = "tf_anprc148jem" };
                        case "BP": { _radio = "tf_anprc155"; _isBP = true };
                    };
                };
            };
        };

        case (mission_ACRE2_enabled): {
            switch(_kind) do {
                case "SR": { _radio = "ACRE_PRC343" };
                case "LR": { _radio = "ACRE_PRC148" };
                case "BP": { _radio = "ACRE_PRC117F" };
            };
        };
    };

    if (_isBP) then { _unit addBackpackCargoGlobal [_radio, _amount];
    } else { _unit addItemCargoGlobal [_radio, _amount] };
};
