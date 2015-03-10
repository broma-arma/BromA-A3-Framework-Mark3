private["_ret"];

#include "dictionary.sqf"

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
            default { _ret = 1 };
        };
    };      
};

_ret