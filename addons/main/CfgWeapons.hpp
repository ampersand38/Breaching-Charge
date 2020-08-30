class CfgWeapons {
    class Default;
    class Put: Default {
        muzzles[] += {"AMP_Breaching_Charge_Muzzle"};
        class PutMuzzle: Default{};
        class AMP_Breaching_Charge_Muzzle: PutMuzzle {
            magazines[] = {"AMP_Breaching_Charge_Mag"};
            displayName = "Breaching Charge";
        };
    };
};
