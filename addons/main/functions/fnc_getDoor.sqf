/*
 * Author: commy2, Phyma, Ampers
 * Find door.
 *
 * Arguments:
 * 0: Position ASL 0 <ARRAY>
 * 1: Position ASL 1 <ARRAY>
 *
 * Return Value:
 * House objects and door <ARRAY>
 * 0: House <OBJECT>
 * 1: Door Name <STRING>
 *
 * Example:
 * [player, target] call bcdw_main_fnc_getDoor
 *
 */

params ["_position0", "_position1"];

private _intersections = lineIntersectsSurfaces [AGLToASL _position0, AGLToASL _position1, cameraOn, objNull, true, 1, "GEOM"];

if (_intersections isEqualTo []) exitWith {[objNull, ""]};

private _house = _intersections select 0 select 2;

// shithouse is bugged
if (typeOf _house == "") exitWith {[objNull, ""]};

_intersections = [_house, "GEOM"] intersect [_position0, _position1];

private _door = toLower (_intersections select 0 select 0);

if (isNil "_door") exitWith {[_house, ""]};

//Check if door is glass because then we need to find the proper location of the door so we can use it
if ((_door find "glass") != -1) then {
    _door = [_distance, _house, _door] call ace_interaction_fnc_getGlassDoor;
};

if (isNil "_door") exitWith {[_house, ""]};

[_house, _door]
