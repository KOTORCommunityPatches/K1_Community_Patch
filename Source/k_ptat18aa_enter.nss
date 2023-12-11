//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Module OnEnter script for tat_m18a (Tatooine Dune Sea).
	
	This is the OnEnter for the Dune Sea, now combined with the contents of the
	vanilla script thanks to clues from AmanoJyaku on getting DeNCS to decompile
	the original. It checks if the player has spoken to the Czerka miners at the
	sandcrawler (through an added local boolean) and has resolved the quest at the
	Sandpeople enclave (either peacefully or violently). If both cases are true,
	the miners are removed, since their dialogue indicates they plan on evacuating
	back to Anchorhead soon after the player has rescued them. Also includes the
	Sand People reputation fix so it gets set correctly on module load.
	
	Updated 2023-12-11 to move the wraid spawn functions out to the include.
	
	Issue #21: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/21
	
	Issue #115: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/115
	
	Issue #217: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/217
	
	JC 2019-09-29 / DP 2020-05-19 / DP 2020-06-15 / DP 2023-12-11				*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_tat"

void main() {
	
	int nCount = 0;
	object oPC = GetFirstPC();
	object oEntering = GetEnteringObject();
	object oMinerCap = GetObjectByTag("tat18_13craw2_01", 0);
	object oMinerGrunt = GetObjectByTag("tat18_13craw1_01", nCount);
	object oSPWarrior1 = GetObjectByTag("tat18_tusken", 0);
	object oSPWarrior2 = GetObjectByTag("tat18_tusken02", 0);
	object oSPWarrior3 = GetObjectByTag("tat18_tusken03", 0);
	object oSPEncounter = GetObjectByTag("tat18_tuskenenc", 0);
	object oWraid1 = GetObjectByTag("tat18_wraid01", 0);
	object oWraid2 = GetObjectByTag("tat18_wraid02", 0);
	object oWraid3 = GetObjectByTag("tat18_wraid03", 0);
	object oWP_Wraid1 = GetWaypointByTag("WP_tat18_wraid01_09");
	object oWP_Wraid2 = GetWaypointByTag("WP_tat18_wraid02_09");
	object oWP_Wraid3 = GetWaypointByTag("WP_tat18_wraid03_09");
	object oTusken;
	location lWP_Wraid1 = GetLocation(oWP_Wraid1);
	location lWP_Wraid2 = GetLocation(oWP_Wraid2);
	location lWP_Wraid3 = GetLocation(oWP_Wraid3);
	
	DelayCommand(0.1, CP_SandRepFix());
	DelayCommand(0.2, CP_SandpeopleDisguiseUsable());
	
	if ((GetLocalBoolean(oMinerCap, 53) && GetGlobalBoolean("tat_TuskenDead")))
		{
			if(GetIsObjectValid(oMinerCap))
				{
					DestroyObject(oMinerCap,0.0,TRUE);
				}
			
			while ((GetIsObjectValid(oMinerGrunt)))
				{
					if (GetIsObjectValid(oMinerGrunt))
						{
							DestroyObject(oMinerGrunt, 0.0, TRUE);
						}
				
					(nCount++);
					
					oMinerGrunt = GetObjectByTag("tat18_13craw1_01", nCount);
				}
		}
	
	if (GetGlobalNumber("k_genoharadan") == 50 && GetIsPC(oEntering))
		{
			SetGlobalNumber("k_genoharadan", 60);
			CP_SpawnGenoFight();
		}
	
	if (GetGlobalBoolean("tat_DuneSea") == FALSE)
		{
			SetGlobalBoolean("tat_DuneSea", TRUE);
		}
	
	if ((CP_GetTuskenJobGlobal() && GetIsObjectValid(oSPWarrior1)) || GetIsObjectValid(oSPWarrior2) || GetIsObjectValid(oSPWarrior3) || GetIsObjectValid(oSPEncounter))
		{
			oTusken = GetFirstObjectInArea(OBJECT_INVALID, OBJECT_TYPE_ALL);
			
			while (GetIsObjectValid(oTusken))
				{
					if (GetTag(oTusken) == "tat18_tusken" || GetTag(oTusken) == "tat18_tusken02" || GetTag(oTusken) == "tat18_tusken03" || GetTag(oTusken) == "tat18_tuskenenc")
						{
							DestroyObject(oTusken);
						}
					
					oTusken = GetNextObjectInArea(OBJECT_INVALID, OBJECT_TYPE_CREATURE);
				}
		}
	
	if (GetIsPC(oEntering) && !GetIsObjectValid(oWraid1) && !GetIsObjectValid(oWraid2) && !GetIsObjectValid(oWraid3))
		{
			switch (GetGlobalNumber("tat_WraidHerd"))
				{
					case 0:
							DelayCommand(1.0, CP_SpawnWraidHerdA(lWP_Wraid1));
							SetGlobalNumber("tat_WraidHerd", 1);
					break;
					
					case 1:
							DelayCommand(1.0, CP_SpawnWraidHerdB(lWP_Wraid2));
							SetGlobalNumber("tat_WraidHerd", 2);
					break;
					
					case 2:
							DelayCommand(1.0, CP_SpawnWraidHerdC(lWP_Wraid3));
							SetGlobalNumber("tat_WraidHerd", 0);
					break;
				}
		}
}
