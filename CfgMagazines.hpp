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
		descriptionShort = "A breaching charge takes down obstacles like walls and doors with minimal collateral damage.";
		class Library
		{
			libTextDesc = "A breaching charge takes down obstacles like walls and doors with minimal collateral damage.";
		};
		displayName = "Breaching Charge";
		ace_explosives_SetupObject = "AMP_Breaching_Charge_Place";

		class ACE_Triggers
		{
			SupportedTriggers[] = {"Timer","Command"};
			/*
			class Timer
			{
				ammo = "AMP_Breaching_Charge_Timer_Ammo";
			};
			class Command
			{
				ammo = "AMP_Breaching_Charge_Command_Ammo";
				fuseTime = 0.5;
			};
			*/
		};
	};
};
