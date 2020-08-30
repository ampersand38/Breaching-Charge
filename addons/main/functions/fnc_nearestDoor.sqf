/*
 * Author: Ampers
 * Finds the selectionName of the nearest door on a house
 * Called by bcdw_main_fnc_breachObstacle
 *
 * Arguments:
 * 0: Position <OBJECT>
 * 1: House <OBJECT>
 * 2: Door max distance <NUMBER> optional, default 5
 *
 * Return Value:
 * selectionName <STRING>
 *
 * Example:
 * [_pos, _house] call bcdw_main_fnc_nearestDoor;
 * [getPos get3DENCamera, nearestObject [getPos get3DENCamera, "HOUSE"], 20] call bcdw_main_fnc_nearestDoor;
 */

params ["_p", "_h", ["_r", 5, [0]]];
private _arr = [];
_arr pushBack [_p, _h];
private _sn = "";
private _sns = selectionNames _h;

//check door selection name pattern
if (({_x == "door_1"} count _sns) > 0) then {
    {
        _snsplit = _x splitString "_";
        //check if selectionName is like "door_1"
        if (
            (count _snsplit == 2) &&
            ((_snsplit select 0) isEqualTo "door") && 
            (0 < parseNumber (_snsplit select 1))
        ) then {
            //check distance
            private _d = (_p distance (_t modelToWorld (_t selectionPosition _x)));
            _arr pushBack [_x, _d];
            if (_d > _r) exitWith {
                //systemChat format ["charge is too far from %1", _x];
            };
            _r = _d;
            _sn = _x;
        };
    } count _sns;
};
if (({_x == "door1"} count _sns) > 0) then {    //for mbg killhouse...
    {
        //check if selectionName is like "door1"
        if (
            (_x select [0, 4] == "door") &&
            (0 < parseNumber (_x select [4]))
        ) then {
            //check distance
            private _d = (_p distance (_t modelToWorld (_t selectionPosition _x)));
            _arr pushBack [_x, _d];
            if (_d > _r) exitWith {
                //systemChat format ["charge is too far from %1", _x];
            };
            _r = _d;
            _sn = _x;
        };
    } count _sns;
};
    
_sn
