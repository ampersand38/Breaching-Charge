class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class AMP_DeployDoorWedge {
                    displayName = "Deploy Door Wedge";
                    condition = "[_player] call bcdw_wedge_fnc_canDeployDoorWedge";
                    //wait a frame to handle "Do When releasing action menu key" option
                    //statement = "[{_this call bcdw_wedge_fnc_deployDoorWedge}, [_this select 0]] call CBA_fnc_execNextFrame";
					statement = "[_player] call bcdw_wedge_fnc_deployDoorWedge";
                    exceptions[] = {};
                    showDisabled = 0;
                    icon = "\a3\modules_f\data\EditTerrainObject\textureDoor_locked_ca.paa";
                };
            };
        };
    };

	class Land_WheelChock_01_F;
    class AMP_Door_Wedge_Place: Land_WheelChock_01_F {
        removalDuration = 15;
        author = "Ampersand";
		//mapSize = 0.26;
		editorPreview = "\A3\EditorPreviews_F\Data\CfgVehicles\Land_WheelChock_01_F.jpg";
		_generalMacro = "AMP_Door_Wedge_Place";
        scope = 2;
        displayName = "Door Wedge";
        descriptionShort = "A door wedge is used to quickly block a door from moving.";
		//model = "\A3\Structures_F_Heli\Items\Tools\WheelChock_01_F.p3d";
		DLC = "";
		icon = "iconObject_2x1";
		editorCategory = "EdCat_Fences";
		editorSubcategory = "EdSubcat_Military";
		vehicleClass = "Fortifications";
		picture = "pictureThing";
        simulation = "house";

		class ACE_Actions {
			class ACE_MainActions {
				displayName = "Door Wedge";
				position = "[0,0,0]";
				selection = "";
				distance = 2;
				condition = "true";
				class AMP_RemoveDoorWedge {
					selection = "";
					displayName = "Remove Door Wedge";
					distance = 2;
					condition = "true";
					//condition = "[_target, _player] call bcdw_wedge_fnc_canRemoveDoorWedge";
					statement = "[_target, _player] call bcdw_wedge_fnc_removeDoorWedge;";
                    //statement = "[{_this call bcdw_wedge_fnc_removeDoorWedge}, [_target, _player]] call CBA_fnc_execNextFrame";
                    exceptions[] = {};
                    showDisabled = 0;
                    icon = "\a3\ui_f\data\IGUI\Cfg\Actions\repair_ca.paa";
				};
			};
		};
    };
};
