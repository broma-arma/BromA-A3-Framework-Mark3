/*
================================================================================

NAME:
    BRM_fnc_readExtraction
    
AUTHOR(s):
    Nife

DESCRIPTION:
    Reads all the extraction points in the map and marks them properly.

PARAMETERS:
    None.
    
USAGE:
    [] call BRM_fnc_readExtraction
    
RETURNS:
    Nothing.

================================================================================
*/

if (!isServer) exitWith {};

extraction_points_all = nearestObjects [[0,0,0], ["LocationEvacPoint_F"], 300000];

extraction_points_blu = [];
extraction_points_op = [];
extraction_points_ind = [];
extraction_points_civ = [];

switch (side_a_side) do {
    case WEST: { extraction_points_blu = extraction_points_blu + mission_extraction_points_a };
    case EAST: { extraction_points_op = extraction_points_op + mission_extraction_points_a };
    case RESISTANCE: { extraction_points_ind = extraction_points_ind + mission_extraction_points_a };
    case CIVILIAN: { extraction_points_civ = extraction_points_civ + mission_extraction_points_a };
};

switch (side_b_side) do {
    case WEST: { extraction_points_blu = extraction_points_blu + mission_extraction_points_b };
    case EAST: { extraction_points_op = extraction_points_op + mission_extraction_points_b };
    case RESISTANCE: { extraction_points_ind = extraction_points_ind + mission_extraction_points_b };
    case CIVILIAN: { extraction_points_civ = extraction_points_civ + mission_extraction_points_b };
};

switch (side_c_side) do {
    case WEST: { extraction_points_blu = extraction_points_blu + mission_extraction_points_c };
    case EAST: { extraction_points_op = extraction_points_op + mission_extraction_points_c };
    case RESISTANCE: { extraction_points_ind = extraction_points_ind + mission_extraction_points_c };
    case CIVILIAN: { extraction_points_civ = extraction_points_civ + mission_extraction_points_c };
};

extraction_a = [];
extraction_b = [];
extraction_c = [];

{
    _extName = [str(_x), "_"] call CBA_fnc_split;
    _name = (_extName select 0);
    _number = (_extName select 2);
    _rot = (getDir _x) + 180;
    _color = "ColorBlack";
    
    switch (_name) do {
        case "blu": { _color = "ColorBLUFOR"; extraction_points_blu pushBack _x };
        case "op": { _color = "ColorOPFOR"; extraction_points_op pushBack _x };
        case "ind": { _color = "ColorIndependent"; extraction_points_ind pushBack _x };
        case "civ": { _color = "ColorCivilian"; extraction_points_civ pushBack _x };
    };
    _mynewMarker = ["global", (getPos _x), "mil_end", _color, "Extraction #"+_number, [1,1], _rot, 1] call BRM_fnc_newMarkerIcon;
    
} forEach extraction_points_all;

switch (side_a_side) do {
    case WEST: { extraction_a pushBack mission_extraction_BLU; extraction_a pushBack extraction_points_blu };
    case EAST: { extraction_a pushBack mission_extraction_OP; extraction_a pushBack extraction_points_op };
    case RESISTANCE: { extraction_a pushBack mission_extraction_IND; extraction_a pushBack extraction_points_ind };
};

switch (side_b_side) do {
    case WEST: { extraction_b pushBack mission_extraction_BLU; extraction_b pushBack extraction_points_blu };
    case EAST: { extraction_b pushBack mission_extraction_OP; extraction_b pushBack extraction_points_op };
    case RESISTANCE: { extraction_b pushBack mission_extraction_IND; extraction_b pushBack extraction_points_ind };
};

switch (side_c_side) do {
    case WEST: { extraction_c pushBack mission_extraction_BLU; extraction_c pushBack extraction_points_blu };
    case EAST: { extraction_c pushBack mission_extraction_OP; extraction_c pushBack extraction_points_op };
    case RESISTANCE: { extraction_c pushBack mission_extraction_IND; extraction_c pushBack extraction_points_ind };
};
