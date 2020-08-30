/*
 * Author: Ampersand
 * Deploy a door wedge.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_player] call bcdw_wedge_fnc_DeployDoorWedge
 *
 * Public: No
 */

params ["_unit"];

//find door


private _position0 = eyePos _unit;
private _position1 = _position0 vectorAdd (eyeDirection _unit vectorMultiply 1);

private _intersections = lineIntersectsSurfaces [_position0, _position1, _unit, objNull, true, 1, "GEOM"];

if (_intersections isEqualTo []) exitWith {[objNull, ""]};

private _intersectPosASL = _intersections select 0 select 0;
private _surfaceNormal = _intersections select 0 select 1;
private _house = _intersections select 0 select 2;

// shithouse is bugged
if (typeOf _house == "") exitWith {[objNull, ""]};

_intersections = [_house, "GEOM"] intersect [ASLToAGL _position0, ASLToAGL _position1];

private _door = toLower (_intersections select 0 select 0);

if (isNil "_door") exitWith {[_house, ""]};

//Check if door is glass because then we need to find the proper location of the door so we can use it
if ((_door find "glass") != -1) then {
    _door = [_distance, _house, _door] call ace_interaction_fnc_getGlassDoor;
};

if (isNil "_door") exitWith {[_house, ""]};

//find door bottom
_intersections = lineIntersectsSurfaces [_intersectPosASL vectorAdd (_surfaceNormal vectorMultiply 0.01),_intersectPosASL vectorAdd [0,0,-2], objNull, objNull, true, 1, "VIEW"];

_intersectPosASL = _intersections select 0 select 0;

// Play animation
[_unit, "AinvPknlMstpSnonWnonDnon_Putdown_AmovPknlMstpSnonWnonDnon"] call ace_common_fnc_doAnimation;

//create wedge
_unit removeItem "AMP_Door_Wedge";
_wedge = createVehicle ["AMP_Door_Wedge_Place", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_wedge setPosASL ((_intersectPosASL vectorAdd [0,0,0.05]) vectorAdd (_surfaceNormal vectorMultiply -0.01));
_wedge setDir ([0,0,0] getDir _surfaceNormal); // + 90;
_wedge setVariable ["AMP_Door_Wedge_Info", [_house, _door], true];

_house setVariable ["bis_disabled_" + _door, 1, true];

[_wedge, _intersectPosASL]

