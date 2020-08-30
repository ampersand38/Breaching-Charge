/*
 * Author: Ampersand
 * Remove the door wedge and unlock the door.
 *
 * Arguments:
 * 0: Door Wedge <OBJECT>
 * 1: unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [DoorWedgeObj, ACE_player] call bcdw_wedge_fnc_removeDoorWedge
 *
 * Public: No
 */


params ["_wedge", "_unit"];

//private _actualProgress = _wedge getVariable ["AMP_Door_Wedge_progress", 1];
//if(_actualProgress == 0) exitWith {_actualProgress};

// Mark wedge as being worked on
_wedge setVariable ["AMP_Door_Wedge_removing", true, true];

private _removeTime = getNumber (configFile >> "CfgVehicles" >> (typeof _wedge) >> "removalDuration");

// Double removal time if no E tool
if !("ACE_EntrenchingTool" in items _unit) then {_removeTime = _removeTime * 2;};

private _removeTimeLeft = _removeTime; // * _actualProgress;

// Create progress bar
private _fnc_onFinish = {
    (_this select 0) params ["_unit", "_wedge"];
	
	//unlock the door
	(_wedge getVariable "AMP_Door_Wedge_Info") params ["_house", "_door"];
	_house setVariable ["bis_disabled_" + _door, 0, true];
    // Remove wedge
    deleteVehicle _wedge;

    // Reset animation
    [_unit, "", 1] call ace_common_fnc_doAnimation;
};
private _fnc_onFailure = {
    (_this select 0) params ["_unit", "_wedge"];
    _wedge setVariable ["AMP_Door_Wedge_removing", false, true];

    // Save progress global
    //private _progress = _wedge getVariable ["AMP_Door_Wedge_progress", 0];
    //_wedge setVariable ["AMP_Door_Wedge_progress", _progress, true];

    // Reset animation
    [_unit, "", 1] call ace_common_fnc_doAnimation;
};
[(_removeTimeLeft + 0.5), [_unit, _wedge], _fnc_onFinish, _fnc_onFailure, "Removing wedge"] call ace_common_fnc_progressBar;

// Play animation
[_unit, "AinvPknlMstpSnonWnonDnon_medic4"] call ace_common_fnc_doAnimation;
