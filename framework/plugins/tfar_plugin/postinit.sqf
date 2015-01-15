tf_same_sw_frequencies_for_side = true;

tf_same_lr_frequencies_for_side = true;

tf_no_auto_long_range_radio = true;

TF_give_personal_radio_to_regular_soldier = false;

TF_give_microdagr_to_soldier = false;

if (!isDedicated) then {
    [] execVM ((_this select 0)+"init_aiHearsTFAR.sqf");
};