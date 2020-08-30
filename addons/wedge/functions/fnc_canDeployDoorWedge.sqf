/*
 * Author: Ampersand
 * Checks if a unit can deploy a door wedge.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Can deploy <BOOL>
 *
 * Example:
 * [ACE_player] call bcdw_wedge_fnc_canDeployDoorWedge
 *
 * Public: No
 */

params ["_unit"];

if !("AMP_Door_Wedge" in items _unit) exitWith {false};

true;
