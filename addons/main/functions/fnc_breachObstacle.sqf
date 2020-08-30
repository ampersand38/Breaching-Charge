/*
 * Author: Ampers
 * Checks the obstacle and destroys it or opens the door
 * Called by bcdw_main_fnc_plantBreachingCharge
 *
 * Arguments:
 * 0: Breaching Charge <OBJECT>
 * 1: Obstacle <OBJECT>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [player, cursorObject] call bcdw_main_fnc_breachObstacle;
 */

params ["_c", "_t"];
//editor wall
if ((_t isKindOf "WALL") || (_t isKindOf "FENCE")) then {

    //some objs don't die >_> MBG shoothouses so gotta move it out of the way
    0 = _t spawn {
        //get height
        private _box = boundingBox _this;
        private _bw0 = _this modelToWorld _box # 0;
        private _bw1 = _this modelToWorld _box # 1;
        private _h = _bw1 # 2 - _bw0 # 2;
        private _p = getPos _this;
        //drop it
        private _d = 0;
        while {_d < _h} do {
            _d = _d + 0.1;
            _this setPos [_p # 0, _p # 1, _p # 2 - _d];
            sleep 0.04;
        };
        _this setDamage 1;
        deleteVehicle _this;
    };
};
//terrain wall
if (_t in (nearestTerrainObjects [position _c, ["WALL", "FENCE"], 10])) then {

    //some objs don't die >_> MBG shoothouses so gotta move it out of the way
    0 = _t spawn {
        _this setDamage 1;
        sleep 1;
        hideObjectGlobal _this;
    };
};
//house
if (_t isKindOf "HOUSE") then {
    //systemChat "It's a house. Try to open the door";

    private _position0 = [];
    private _position1 = [];
    if (typeOf _c == "Land_MetalWire_F") then {
        _position0 = (getPosASL _c) vectorAdd [0,0,0];
        _position1 = _position0 vectorAdd (vectorUp _c);
    };
    if (_c isEqualTo player) then {
        //systemChat "player test";
        _position0 = positionCameraToWorld [0, 0, 0];
        _position1 = positionCameraToWorld [0, 0, 10];
    };

    _intersections = [_t, "GEOM"] intersect [ASLtoAGL _position0, ASLtoAGL _position1];

    private _door = toLower (_intersections select 0 select 0);

    if (isNil "_door") exitWith {[_t, ""]};

    //Check if door is glass because then we need to find the proper location of the door so we can use it
    if ((_door find "glass") != -1) then {
        _door = [10, _t, _door] call ace_interaction_fnc_getGlassDoor;
    };

    private _an = "";
    //check pattern of door animationNames
    private _ans = animationNames _t;
    if (({_x == _door} count _ans) > 0) then {
        _an = _door + "";
    };
    if (({_x == (_door + "_rot")} count _ans) > 0) then {
        _an = _door + "_rot";
    };
    if (_an == "") exitWith {
        //systemChat "Could not find a matching animationName";
    };
    _t animate [_an, 1, true];    //open
};
_an
