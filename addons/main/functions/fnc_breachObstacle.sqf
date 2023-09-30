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

#define LOD_GEOMETRY 1e13

//systemChat str _this;

params ["_c", "_t"];
//editor wall
if ((_t isKindOf "WALL") || (_t isKindOf "FENCE")) exitWith {

    _t setDamage [1, true, _c];
    //some objs don't die >_> MBG shoothouses so gotta move it out of the way
    0 = _this spawn {
        params ["_c", "_t"];
        //get height
        private _box = boundingBox _t;
        private _bw0 = _t modelToWorld _box # 0;
        private _bw1 = _t modelToWorld _box # 1;
        private _h = _bw1 # 2 - _bw0 # 2;
        private _p = getPos _t;
        //drop it
        private _d = 0;
        while {_d < _h} do {
            _d = _d + 0.1;
            _t setPos [_p # 0, _p # 1, _p # 2 - _d];
            sleep 0.04;
        };
        deleteVehicle _t;
    };
};
//terrain wall
if (tolower ((_t namedProperties [LOD_GEOMETRY]) get "map") in ["wall", "fence"]) exitWith {

    //some objs don't die >_> MBG shoothouses so gotta move it out of the way
    _t setDamage [1, true, _c];
    0 = _this spawn {
        params ["_c", "_t"];
        sleep 1;
        hideObjectGlobal _t;
    };
};
//house
if (_t isKindOf "HOUSE") exitWith {
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
//tree
if (
    tolower ((_t namedProperties [LOD_GEOMETRY]) get "map") in ["tree", "small tree"]
    || {_t isKindOf "Base_CUP_Tree"}
) exitWith {
    _t setDamage [1, true, _c];
};
_an
