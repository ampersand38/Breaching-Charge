class CfgAmmo {
    class ClaymoreDirectionalMine_Remote_Ammo;

    class AMP_Breaching_Charge_Ammo: ClaymoreDirectionalMine_Remote_Ammo {
        hit = 10;
        indirectHit = 10;
        indirectHitRange = 2;
        model = "\A3\Weapons_F\Explosives\mine_SLAM_directional";
        mineModelDisabled = "\A3\Weapons_F\Explosives\mine_SLAM_directional";
        defaultMagazine = "AMP_Breaching_Charge_Mag";
        ace_explosives_magazine = "AMP_Breaching_Charge_Mag";
        ace_explosives_Explosive = "AMP_Breaching_Charge_Ammo_Scripted";
    };
    class AMP_Breaching_Charge_Ammo_Scripted: AMP_Breaching_Charge_Ammo {};

    class AMP_Breaching_Charge_Timer_Ammo: AMP_Breaching_Charge_Ammo {
        mineTrigger = "TimeTrigger";
    };
    class AMP_Breaching_Charge_Command_Ammo: AMP_Breaching_Charge_Ammo {
        mineTrigger = "RemoteTrigger";
    };
};
