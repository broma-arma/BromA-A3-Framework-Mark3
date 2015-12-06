switch(_x) do
{
    case "medical":
    {
        [[_object,"magazine",
            [_bchemlight,25],
            [_rchemlight,25],
            [_gchemlight,25],
            [_wsmoke,25],
            [_rsmoke,25],
            [_gsmoke,25]
        ]] spawn _addtoCargo;
        [[_object,"item",
            [_bandage, _countBandageCARGO],
            [_morphine, _countMorphineCARGO],
            [_epi, _countEpiCARGO],
            [_bloodbag, _countBloodbagCARGO]
        ]] spawn _addtoCargo;
    };
    case "medical_adv":
    {
        if (mission_ACE3_enabled) then {
            [[_object,"item",
                [_fieldDressing, _countBandageCARGO],
                [_packingBandage, _countBandageCARGO],
                [_elasticBandage, _countBandageCARGO],
                [_personalAidKit, _countBandageCARGO],
                [_quickClot, _countBandageCARGO],
                [_tourniquet, _countBandageCARGO],
                [_morphine, _countMorphineCARGO],
                [_atrophine, _countMorphineCARGO],
                [_epi, _countEpiCARGO],
                [_saline1000, _countBloodbagCARGO],
                [_blood1000, _countBloodbagCARGO],
                [_plasma1000, _countBloodbagCARGO],
                [_surgKit, _countBloodbagCARGO],
                [_bodyBag, _countBloodbagCARGO]
            ]] spawn _addtoCargo;
        };
    };
    case "ammo":
    {
        [[_object,"magazine",
            [_commonRIFLE select 1,_countRifleCARGO],
            [_commonMG select 1, _countMGCARGO],
            [_commonMARKSMAN select 1,_countRifleCARGO],
            [_commonSNIPER select 1,_countSNIPERCARGO],
            [_commonSMG select 1,_countRifleCARGO],
            [_specAT select 1, _countATCARGO],
            [_commonRIFLEGL select 2, _count40mmCARGO],
            [_grenade, _countGRENADESCARGO],
            [_wsmoke,25],
            [_rsmoke,25],
            [_gsmoke,25]
        ]] spawn _addtoCargo;
        [[_object,"item",
            [_earBuds, 25]
        ]] spawn _addtoCargo;
    };

    case "ammo_big":
    {
        [[_object,"magazine",
            [_commonRIFLE select 1,_countRifleCARGO * 3],
            [_commonMG select 1, _countMGCARGO * 3],
            [_commonMARKSMAN select 1,_countRifleCARGO * 3],
            [_commonSNIPER select 1,_countSNIPERCARGO * 3],
            [_commonSMG select 1,_countRifleCARGO * 3],
            [_specAT select 1, _countATCARGO * 3],
            [_commonRIFLEGL select 2, _count40mmCARGO * 3],
            [_grenade, _countGRENADESCARGO * 3],
            [_wsmoke,25 * 3],
            [_rsmoke,25 * 3],
            [_gsmoke,25 * 3]
        ]] spawn _addtoCargo;
    };

    case "at":
    {
        [[_object,"magazine",
            [_specAT select 1,_countATCARGO]
        ]] spawn _addtoCargo;
        [[_object,"weapon",
            [_specAT select 0, 3]
        ]] spawn _addtoCargo;
    };

    case "radio": {
        [_object, "SR", _factionSide, 50] spawn _addRadioToCargo;
        [_object, "LR", _factionSide, 20] spawn _addRadioToCargo;
        [_object, "BP", _factionSide, 5] spawn _addRadioToCargo;
    };

    case "parachutes": {
        [[_object,"backpack",
            [_parachute , 15]
        ]] spawn _addtoCargo;
    };
};
