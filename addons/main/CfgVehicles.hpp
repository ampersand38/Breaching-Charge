class CfgVehicles {
    class SLAMDirectionalMine;
    class AMP_Breaching_Charge: SLAMDirectionalMine {
        author = "Ampersand";
        _generalMacro = "AMP_Breaching_Charge";
        ammo = "AMP_Breaching_Charge_Ammo";
        displayName = "Breaching Charge";
    };
    class ACE_Explosives_Place_SLAM;
    class AMP_Breaching_Charge_Place: ACE_Explosives_Place_SLAM {
        author = "Ampersand";
        displayName = "Breaching Charge";

        class EventHandlers {
            init = "(_this select 0) call bcdw_main_fnc_plantBreachingCharge;";
            deleted = "(_this select 0) call bcdw_main_fnc_rotateAmmoObj;";
        };
    };
};
