#include "script_component.hpp"

class CfgPatches {
    class AMP_Door_Wedge {
        name = COMPONENT_NAME;
        units[] = {"AMP_Door_Wedge_Place"};
        weapons[] = {"AMP_Door_Wedge"};
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

#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
