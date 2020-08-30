#include "script_component.hpp"

class CfgPatches {
    class AMP_Breaching_Charge {
        name = COMPONENT_NAME;
        units[] = {"AMP_Breaching_Charge","AMP_Breaching_Charge_Place","AMP_Door_Wedge_Place"};
        weapons[] = {"AMP_Breaching_Charge_Muzzle"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "A3_Weapons_F_Explosives",
            "ace_interaction",
            "ace_explosives"
        };
        author = "Ampersand";
        authors[] = {"Ampersand"};
        authorUrl = "https://github.com/ampersand38/";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgModuleCategories.hpp"

#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
