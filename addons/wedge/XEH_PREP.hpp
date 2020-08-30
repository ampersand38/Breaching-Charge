// testing, update fncs on the fly
//#define PREP(var1) TRIPLES(ADDON,fnc,var1) = { call compile preProcessFileLineNumbers '\MAINPREFIX\PREFIX\SUBPREFIX\COMPONENT_F\functions\DOUBLES(fnc,var1).sqf' }

PREP(canDeployDoorWedge);
PREP(canRemoveDoorWedge);
PREP(deployDoorWedge);
PREP(removeDoorWedge);
