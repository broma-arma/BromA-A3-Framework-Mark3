private["_ret"];

#include "includes\dictionary.sqf"

switch (_this select 0) do {
    
    case "SIDE": {
        switch (_this select 1) do {
            case west: { _ret = 1 };
            case east: { _ret = 0 };
            case resistance: { _ret = 2 };
            case civilian: { _ret = 3 };
        };
    };
    
    case "SKILL": {
        _skill = (_this select 1);
        switch (true) do {
            case (_skill in _aliasSkillEASY): { _ret = 0 };            
            case (_skill in _aliasSkillNORMAL): { _ret = 1 };
            case (_skill in _aliasSkillSTEALTH): { _ret = 2 };
            case (_skill in _aliasSkillHARD): { _ret = 3 };
        };
    };    
    
    case "FACTION": {
        switch (toUpper(_this select 1)) do {
            case "RACS": { _ret = 3 };
            case "SLA": { _ret = 4 };
            case "MUJAHIDEEN": { _ret = 5 };
            case "ANA": { _ret = 6 };
            case "AHKMA-PMC": { _ret = 7 };
            case "CHEDAKI": { _ret = 8 };
            case "MARINES": { _ret = 9 };
            case "IONPMC": { _ret = 10 };
            case "TKMILITIA": { _ret = 11 };
            case "FINNS": { _ret = 12 };
            case "CSAT": { _ret = 13 };
            case "NATO": { _ret = 14 };
            case "AAF": { _ret = 15 };
            case "FIA": { _ret = 16 };
            case "VDV": { _ret = 17 };
            
            default { _ret = 1 };
        };
    };      
};

_ret