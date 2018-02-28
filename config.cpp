#include "BIS_AddonInfo.hpp"
class CfgPatches 
{
	class AMP_Breaching_Charge
	{
		// Meta information for editor
		name = "Breaching Charge";
		author = "Ampersand";
		url = "";
		
		requiredVersion = 1.000000;
		requiredAddons[] = {
			"ace_explosives",
			"A3_Weapons_F_Explosives"
		};
		units[] = {"AMP_Breaching_Charge","AMP_Breaching_Charge_Place"};
		weapons[] = {"AMP_Breaching_Charge_Muzzle"};
	};
};

class CfgFunctions {
    class AMP_Breaching_Charge {
        tag = "AMP";
        class functions {
            file = "\AMP_Breaching_Charge\functions";
            class plantBreachingCharge;
        };
    };
};

class CfgAmmo
{
	class ClaymoreDirectionalMine_Remote_Ammo;
	class AMP_Breaching_Charge_Ammo: ClaymoreDirectionalMine_Remote_Ammo
	{
		hit = 10;
		indirectHit = 10;
		indirectHitRange = 3;
		model = "\A3\Weapons_F\Explosives\mine_SLAM_directional";
		defaultMagazine = "AMP_Breaching_Charge_Mag";
		ace_explosives_magazine = "AMP_Breaching_Charge_Mag";
		ace_explosives_Explosive = "AMP_Breaching_Charge_Ammo_Scripted";
		
	};
	class AMP_Breaching_Charge_Ammo_Scripted: AMP_Breaching_Charge_Ammo
	{
	};
};

class CfgMagazines
{
	class SLAMDirectionalMine_Wire_Mag;
	class AMP_Breaching_Charge_Mag: SLAMDirectionalMine_Wire_Mag
	{
		scope = 2;
		scopeArsenal = 2;
		author = "Ampersand";
		ammo = "AMP_Breaching_Charge_Ammo";
		mass = 10;
		model = "\A3\Weapons_F\Explosives\mine_SLAM_directional_i";
		picture = "\A3\Weapons_F\Data\UI\gear_mine_SLAM_directional_CA.paa";
		descriptionShort = "A breaching charge takes down walls, doors, and other obstacles with minimal collateral damage.";
		class Library
		{
			libTextDesc = "A breaching charge takes down walls, doors, and other obstacles with minimal collateral damage.";
		};
		displayName = "Breaching Charge";
		ace_explosives_SetupObject = "AMP_Breaching_Charge_Place";
		
		class ACE_Triggers
		{
			SupportedTriggers[] = {"Timer","Command"};
		};
	};
};

class CfgVehicles
{
	class SLAMDirectionalMine;
	class AMP_Breaching_Charge: SLAMDirectionalMine
	{
		author = "Ampersand";
		editorPreview = "\A3\EditorPreviews_F\Data\CfgVehicles\SLAMDirectionalMine.jpg";
		_generalMacro = "AMP_Breaching_Charge";
		ammo = "AMP_Breaching_Charge_Ammo";
		model = "\A3\Weapons_F\Explosives\mine_SLAM_directional";
		displayName = "Breaching Charge";
	};
	
	class ACE_Explosives_Place_SLAM;
	class AMP_Breaching_Charge_Place: ACE_Explosives_Place_SLAM
	{
		author = "Ampersand";
		displayName = "Breaching Charge";
		
		class EventHandlers
		{
			Init = "[_this select 0] call AMP_fnc_plantBreachingCharge;";
		};
	};
};

class CfgWeapons
{
    class Default;
    class Put: Default {
        muzzles[] += {AMP_Breaching_Charge_Muzzle};
        class PutMuzzle: Default{};
        class AMP_Breaching_Charge_Muzzle: PutMuzzle {
			magazines[] = {"AMP_Breaching_Charge_Mag"};
			displayName = "Breaching Charge";
        };
    };
};
