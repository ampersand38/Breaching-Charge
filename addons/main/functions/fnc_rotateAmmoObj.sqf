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
 * _mainCharge call bcdw_main_fnc_rotateAmmoObj;
 *
 */

if !(local _this) exitWith {}; //systemChat "Not local!"};

0 = [(getPosATL _this)] spawn {
    params ["_p"];
    //systemChat "bcdw_main_fnc_rotateAmmoObj";
    if (isDedicated) exitWith {}; //systemChat "Server!"};

    //createVehicle ["Sign_Sphere25cm_F", _p, [], 0, "CAN_COLLIDE"];    //testing

    private ["_ammo"];
    _ammo = [];
    waitUntil {
        sleep 0.1;
        _ammo = _p nearObjects ["AMP_Breaching_Charge_Ammo",0.5];
        count _ammo > 0
    };
    if !(local (_ammo # 0)) exitWith {}; //systemChat "Not local!"};

    //systemChat "Found AMP_Breaching_Charge_Ammo!";
    (_ammo # 0) setVectorUp [0,-1,0];
};

true
