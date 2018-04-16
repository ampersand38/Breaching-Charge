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
 * [_breachingCharge] call AMP_fnc_plantBreachingCharge;
 *
 */

params ["_bc"];

0 = [_bc] spawn {
	params ["_bc"];
	//systemChat "AMP_fnc_plantBreachingCharge";
	if !(local _bc) exitWith {}; //systemChat "Not local!"};
	if (isDedicated) exitWith {}; //systemChat "Server!"};
	private ["_bcp","_wl","_tl"];
	
	_bcp = getPosASL _bc;
	_tl = lineIntersectsSurfaces [_bcp, _bcp vectorDiff (vectorDir _bc), _bc, objNull];
	if (_tl isEqualTo []) exitWith {}; //systemChat "No intersections!";};
	if (_tl select 0 select 3 isEqualTo objNull) exitWith {}; //systemChat "Nothing to stick to!"};
	_tl select 0 params ["_ip","_nv","","_t"];

	// wire loop
	_wl = createVehicle ["Land_MetalWire_F", ASLToAGL _ip vectorAdd (_nv vectorMultiply 0.02), [], 0, "CAN_COLLIDE"]; 
	_wl setVectorDirAndUp [[0,0,-1], [0,0,0] vectorDiff _nv];

	//attach
	_bc attachTo [_wl,[0,0,-0.06]];
	_bc setVectorDirAndUp [vectorDir _wl,[0,-1,0]];

	_wl addEventHandler ["Explosion",{
		
		private ["_r","_c","_p","_ts","_t","_snsplit","_an"];
		_r = 2;
		_c = (_this select 0);
		_p = (getPosASL _c) vectorAdd [0,0,0.5];
		_ts = lineIntersectsObjs [
			_p, 
			_p vectorAdd (vectorUp _c), 
			objNull, objNull, false, 48
		];
		if (_ts isEqualTo []) exitWith {//systemChat "Target list is empty!";	//testing
			deleteVehicle _c;
		};
		_t = _ts select 0;
		if (_t isKindOf "HOUSE") then {	//door
			if (typeOf _t select [0,15] == "Land_jbad_wall_") then {
				_t setDamage 1;
			} else {
				{
					_snsplit = _x splitString "_";
					if (
						(count _snsplit == 2) &&
						((_snsplit select 0) isEqualTo "door") && 
						(0 < parseNumber (_snsplit select 1))
					) then {
						if ((_c distance (_t modelToWorld (_t selectionPosition _x))) < _r) then {
							//_t hideSelection [_x, true];	//hide, doesn't work
							_an = _x+"_rot";
							_t animate [_an, 1, true];	//open
						};
					};
				} count selectionNames _t;
			};
		} else {	//wall
			if (_t in nearestTerrainObjects [_t,["WALL","FENCE"],0.1]) then {_t setDamage 1;} else {
				if (
					(_t isKindOf "WALL") || 
					(_t isKindOf "FENCE")
				) then {_t setDamage 1;};
			};
		};
		//clean up
		_c removeAllEventHandlers "Explosion";
		deleteVehicle _c;
	}];
};

true