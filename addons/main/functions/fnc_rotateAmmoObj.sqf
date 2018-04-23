/*
 * Author: Ampers
 * Rotates the AMP_Breaching_Charge_Ammo. 
 * Called by AMP_Breaching_Charge_Place >> EventHandlers >> Deleted
 *
 * Arguments:
 * 0: AMP_Breaching_Charge_Place <OBJECT>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [_breachingCharge] call AMP_fnc_rotateAmmoObj;
 *
 */

params ["_bc"];
if !(local _bc) exitWith {}; //systemChat "Not local!"};

0 = [(getPosATL _bc)] spawn {
	params ["_p"];
	//systemChat "AMP_fnc_rotateAmmoObj";
	if (isDedicated) exitWith {}; //systemChat "Server!"};
	
	//createVehicle ["Sign_Sphere25cm_F", _p, [], 0, "CAN_COLLIDE"];	//testing
	
	private ["_ammo"];
	_ammo = [];
	waitUntil {
		_ammo = _p nearObjects ["AMP_Breaching_Charge_Ammo",0.5];
		count _ammo > 0
	};
	if !(local (_ammo select 0)) exitWith {}; //systemChat "Not local!"};
	
	//systemChat "Found AMP_Breaching_Charge_Ammo!";
	(_ammo select 0) setVectorUp [0,-1,0];
};

true