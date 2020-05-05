#include "BIS_AddonInfo.hpp"

class CfgPatches {
	class AMP_Breaching_Charge {
		// Meta information for editor
		name = "Breaching Charge";
		author = "Ampersand";

		requiredVersion = 1.56;
		requiredAddons[] = {
			"A3_Weapons_F_Explosives",
			"ace_interaction",
			"ace_explosives"
		};
		units[] = {"AMP_Breaching_Charge","AMP_Breaching_Charge_Place","AMP_Door_Wedge_Place"};
		weapons[] = {"AMP_Breaching_Charge_Muzzle"};
	};
};

#include "CfgAmmo.hpp"
#include "CfgFunctions.hpp"
#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
