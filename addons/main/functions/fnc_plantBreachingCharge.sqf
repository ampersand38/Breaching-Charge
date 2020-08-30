#include "script_component.hpp"
/*
 * Author: Ampers
 * Prepares the things to breach on explosion.
 * Called by AMP_Breaching_Charge_Place >> EventHandlers >> Init
 *
 * Arguments:
 * 0: AMP_Breaching_Charge_Place <OBJECT>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * _mainCharge call bcdw_main_fnc_plantBreachingCharge;
 *
 */

0 = [_this] spawn {
    params ["_bc"];
    //systemChat "bcdw_main_fnc_plantBreachingCharge";
    if !(local _bc) exitWith {}; //systemChat "Not local!"};
    if (isDedicated) exitWith {}; //systemChat "Server!"};
    private ["_bcp","_wl","_tl"];

    _bcp = getPosASL _bc;
    _tl = lineIntersectsSurfaces [_bcp, _bcp vectorDiff (vectorDir _bc), _bc, objNull];
    if (_tl isEqualTo []) exitWith {}; //systemChat "No intersections!";};
    if (_tl select 0 select 3 isEqualTo objNull) exitWith {}; //systemChat "Nothing to stick to!"};
    _tl select 0 params ["_ip","_nv","_io","_t"];

    // wire loop
    _wl = createVehicle ["Land_MetalWire_F", ASLToAGL _ip vectorAdd (_nv vectorMultiply 0.08), [], 0, "CAN_COLLIDE"];
    _wl setVectorDirAndUp [[0,0,-1], [0,0,0] vectorDiff _nv];

    //attach
    _bc attachTo [_wl,[0,0,0.00]];
    _bc setVectorDirAndUp [vectorDir _wl,[0,-1,0]];

    _wl setVariable ["bcdw_bc_target", _t];
    _wl addEventHandler ["Explosion",{
        params ["_c"];
        [_c, _c getVariable ["bcdw_bc_target", objNull]] call bcdw_main_fnc_breachObstacle;

        //clean up
        _c removeAllEventHandlers "Explosion";
        deleteVehicle _c;
    }];
};

true
