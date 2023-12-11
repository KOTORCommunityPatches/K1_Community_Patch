//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Module OnEnter script for tat_m18ab (Tatooine Sand People Territory).
	
	Fixes an issue with the Sand People	hostility state not being set correctly
	when the module loads.
	
	Updated 2023-08-16 to include the vanilla OnEnter functionality, thanks to
	clues from AmanoJyaku on getting DeNCS to decompile the original.
	
	Updated 2023-12-11 to move the various spawn and global/local functions out to
	the include.
	
	Issue #217: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/217
	
	Issue #21: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/21
	
	JC 2019-09-29 / DP 2023-08-16 / DP 2023-12-11								*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_tat"

void main() {
	
	object oPC = GetFirstPC();
	object oGuard = GetObjectByTag("tat18_14sandg_01", 0);
	object oFac = GetObjectByTag("tat18_tuskanfac", 0);
	
	DelayCommand(0.1, CP_SandRepFix());
	DelayCommand(0.2, CP_SandpeopleDisguiseUsable());
	
	if (GetGlobalNumber("K_Geno_Vorn") == 1 && !GetGlobalBoolean("K_VornSpawn"))
		{
			SetGlobalBoolean("K_VornSpawn", TRUE);
			DelayCommand(0.2, CP_VornSpawn());
		}
	
	if (CP_GetTuskenJobGlobal() == TRUE && !GetIsEnemy(oFac, oPC) && !GetIsObjectValid(oGuard) && !CP_GetTuskenDoneLocal())
		{
			CP_SetTuskenDoneLocal(TRUE);
			DelayCommand(1.0, CP_SpawnGuard());
		}
		else if (GetIsObjectValid(oGuard) && GetGlobalBoolean("tat_TuskenDead"))
			{
				DestroyObject(oGuard, 0.0, TRUE);
			}
	
	if (GetGlobalBoolean("tat_TuskenDead"))
		{
			object oTurret;
			
			oTurret = GetFirstObjectInArea();
			
			while (GetIsObjectValid(oTurret))
				{
					if (GetTag(oTurret) == "tat18_turret" || GetTag(oTurret) == "tat18_turret2")
						{
							ChangeToStandardFaction(oTurret, STANDARD_FACTION_NEUTRAL);
						}
					
					oTurret = GetNextObjectInArea();
				}
		}
}
