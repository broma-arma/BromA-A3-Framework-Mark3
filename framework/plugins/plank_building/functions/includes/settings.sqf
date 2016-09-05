
// =============================================================================

/*
    Declare the objects that will serve as the construction anchors.

    [["object", "min distance"]]

    Example: plank_objects_side_a = [["MobileHQ", "10]];
*/

plank_objects_side_a = [];
plank_objects_side_b = [];
plank_objects_side_c = [];

// =============================================================================

/*
    ["Small bunker"],["Bunker"],["Wide Sandbag fence"],["H-Barrier watch tower"],
    ["Short Sandbag fence"],["Razor Wire"],["Concrete wall long"],["Bunker Tower"]
*/

PLANK_Player_Objects = [1,0,10,0,15,5,0,0];
PLANK_Officer_Objects = [5,3,20,5,20,10,0,5];
PLANK_FTL_Objects = [3,1,20,1,15,10,0,1];
PLANK_SL_Objects = [5,2,20,3,15,10,0,2];
PLANK_Specialist_Objects = [25,15,100,25,100,50,0,25];

PLANK_FMK_buildSpeed = 1;

// =============================================================================

/*
    These are the available fortifications. Add or take as you wish.

    Action text      - The text displayed by the action.
    Classname        - The classname of the object to be placed.
    Distance         - Minimum distance of the object from the player, in metres.
    Direction        - Direction the object will be rotated initially, in degrees (minimum 0, maximum 360).
    Direction range  - The range you can turn the object, in degrees (minimum 0, maximum 360).
                       This means that the player will be able to set the direction of the object between `direction - direction_range / 2` and `direction + direction_range / 2` degrees.
                       For example given 180 direction and 60 direction range, player will be able turn the object between 150 and 210 degrees.
    Code             - A piece of code that will be executed when the object placement is confirmed.
                       Set it to {}, if you don't want to use it. The unit who confirmed the placement and the object placed, are passed as arguments to the code.
                       An example code that hints the players name could look like {hint str (_this select 0);}.
*/

plank_deploy_fortData = [

// Action text                      |   Classname                           |  Distance     |  Direction     |  Direction Range  |  Code | Delay in seconds to place
//------------------------------------------------------------------------------------------------------------------------------------------------------
["Small bunker",                        "Land_BagBunker_Small_F",               3,              180,                360,            {},             20],
["Bunker",                              "Land_BagBunker_Large_F",               8,              180,                60,             {},             35],
["Wide Sandbag fence",                  "Land_BagFence_Long_F",                 2,              0,                  360,            {},             8],
["H-Barrier watch tower",               "Land_HBarrierTower_F",                 7,              180,                360,            {},             100],
["Short Sandbag fence",                 "Land_BagFence_Short_F",                2,              0,                  360,            {},             4],
["Razor Wire",                          "Land_Razorwire_F",                     4,              0,                  360,            {},             10],
["Concrete wall long",                  "Land_CncWall4_F",                      8,              0,                  360,            {},             60],
["Bunker Tower",                        "Land_BagBunker_Tower_F",               7,              90,                 360,            {},             60]

];

// =============================================================================