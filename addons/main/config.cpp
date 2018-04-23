#include "script_component.hpp"

class CfgPatches
{
	class AMP_Breaching_Charge
	{
		// Meta information for editor
		name = COMPONENT_NAME;
		author = "Ampersand";

		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
			"ace_explosives",
			"A3_Weapons_F_Explosives"
		};
		units[] = {"AMP_Breaching_Charge","AMP_Breaching_Charge_Place"};
		weapons[] = {"AMP_Breaching_Charge_Muzzle"};
	};
};

#include "CfgAmmo.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
