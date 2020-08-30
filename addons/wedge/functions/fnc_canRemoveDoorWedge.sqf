/*
 * Author: Ampersand
 * Checks if a unit can deploy a door wedge.
 *
 * Arguments:
 * 0: Door Wedge <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * Can deploy <BOOL>
 *
 * Example:
 * [DoorWedgeObj, ACE_player] call bcdw_wedge_fnc_canRemoveDoorWedge
 *
 * Public: No
 */

params ["_wedge", "_unit"];

if !("ACE_EntrenchingTool" in items _unit) exitWith {false};

// Prevent removing wedge by more than one person
if (_wedge getVariable ["AMP_Door_Wedge_removing", false]) exitWith {false};

true;
