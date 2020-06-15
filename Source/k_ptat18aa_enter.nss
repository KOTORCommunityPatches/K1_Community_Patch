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
	
	Issue #21: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/21
	
	Issue #115: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/115
	
	Issue #217: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/217
	
	JC 2019-09-29 / DP 2020-05-19 / DP 2020-06-15                               */
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_tat"
#include "k_inc_tat"

void SpawnWraidHerdC(location lLocation) {
	
	object oPC = GetFirstPC();
	int nLevel = (GetLevelByPosition(1, oPC) + GetLevelByPosition(2, oPC) + GetLevelByPosition(3, oPC));
	
	if (nLevel > 11)
		{
			CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid23", lLocation, FALSE);
			CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid23", lLocation, FALSE);
			CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid23", lLocation, FALSE);
			CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid23", lLocation, FALSE);
		}
		else
			{
				CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid03", lLocation, FALSE);
				CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid03", lLocation, FALSE);
				CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid03", lLocation, FALSE);
				CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid03", lLocation, FALSE);
			}
}

void SpawnWraidHerdB(location lLocation) {
	
	object oPC = GetFirstPC();
	int nLevel = (GetLevelByPosition(1, oPC) + GetLevelByPosition(2, oPC) + GetLevelByPosition(3, oPC));
	
	if (nLevel > 11)
		{
			CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid22", lLocation, FALSE);
			CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid22", lLocation, FALSE);
			CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid22", lLocation, FALSE);
			CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid22", lLocation, FALSE);
		}
		else
			{
				CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid02", lLocation, FALSE);
				CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid02", lLocation, FALSE);
				CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid02", lLocation, FALSE);
				CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid02", lLocation, FALSE);
			}
}

void SpawnWraidHerdA(location lLocation) {
	
	object oPC = GetFirstPC();
	int nLevel = (GetLevelByPosition(1, oPC) + GetLevelByPosition(2, oPC) + GetLevelByPosition(3, oPC));
	
	if (nLevel > 11)
		{
			CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid21", lLocation, FALSE);
			CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid21", lLocation, FALSE);
			CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid21", lLocation, FALSE);
			CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid21", lLocation, FALSE);
		}
		else
			{
				CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid01", lLocation, FALSE);
				CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid01", lLocation, FALSE);
				CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid01", lLocation, FALSE);
				CreateObject(OBJECT_TYPE_CREATURE, "tat18_wraid01", lLocation, FALSE);
			}
}

void main() {
	
	int nCount = 0;
	object oPC = GetFirstPC();
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
	
	if (GetGlobalNumber("k_genoharadan") == 50 && GetIsPC(GetEnteringObject()))
		{
			SetGlobalNumber("k_genoharadan", 60);
			
			location location1 = GetLocation(GetObjectByTag("tat_bh_hulas_wp", 0));
			location location3 = GetLocation(GetObjectByTag("tat_bh_senni_wp", 0));
			location location5 = GetLocation(GetObjectByTag("tat_bh_bounty_wp", 0));
			location location7 = GetLocation(GetObjectByTag("tat_bh_thug1_wp", 0));
			location location9 = GetLocation(GetObjectByTag("tat_bh_thug2_wp", 0));
			location location11 = GetLocation(GetObjectByTag("tat_bh_thug3_wp", 0));
			location location13 = GetLocation(GetObjectByTag("tat_bh_thug4_wp", 0));
			location location15 = GetLocation(GetObjectByTag("tat_bh_bike1_wp", 0));
			location location17 = GetLocation(GetObjectByTag("tat_bh_bike2_wp", 0));
			location location19 = GetLocation(GetObjectByTag("tat_bh_bike3_wp", 0));
			location location21 = GetLocation(GetObjectByTag("tat_bh_speeder1_wp", 0));
			location location23 = GetLocation(GetObjectByTag("tat_bh_speeder2_wp", 0));
			
			CreateObject(OBJECT_TYPE_CREATURE, "n_duros001", location1, 0);
			CreateObject(OBJECT_TYPE_CREATURE, "tat_senni", location3, 0);
			CreateObject(OBJECT_TYPE_CREATURE, "tat_bounty", location5, 0);
			CreateObject(OBJECT_TYPE_CREATURE, "tat_thug1", location7, 0);
			CreateObject(OBJECT_TYPE_CREATURE, "tat_thug2", location9, 0);
			CreateObject(OBJECT_TYPE_CREATURE, "tat_thug3", location11, 0);
			CreateObject(OBJECT_TYPE_CREATURE, "tat_thug4", location13, 0);
			CreateObject(OBJECT_TYPE_PLACEABLE, "tat_bike1", location15, 0);
			CreateObject(OBJECT_TYPE_PLACEABLE, "tat_bike1", location17, 0);
			CreateObject(OBJECT_TYPE_PLACEABLE, "tat_bike1", location19, 0);
			CreateObject(OBJECT_TYPE_PLACEABLE, "tat_speeder1", location21, 0);
			CreateObject(OBJECT_TYPE_PLACEABLE, "tat_speeder1", location23, 0);
		}
	
	if (GetGlobalBoolean("tat_DuneSea") == FALSE)
		{
			SetGlobalBoolean("tat_DuneSea", TRUE);
		}
	
	SandpeopleDisguiseUsable();
	
	if ((GetTuskenJobGlobal() == TRUE && GetIsObjectValid(oSPWarrior1)) || GetIsObjectValid(oSPWarrior2) || GetIsObjectValid(oSPWarrior3) || GetIsObjectValid(oSPEncounter))
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
	
	if (GetEnteringObject() == GetFirstPC())
		{
			switch (GetGlobalNumber("tat_WraidHerd"))
				{
					case 0:
						if (GetIsObjectValid(oWraid1) == FALSE && GetIsObjectValid(oWraid2) == FALSE && GetIsObjectValid(oWraid3) == FALSE)
							{
								DelayCommand(1.0, SpawnWraidHerdA(lWP_Wraid1));
								SetGlobalNumber("tat_WraidHerd", 1);
							}
						
						break;
					
					case 1:
						if (GetIsObjectValid(oWraid1) == FALSE && GetIsObjectValid(oWraid2) == FALSE && GetIsObjectValid(oWraid3) == FALSE)
							{
								DelayCommand(1.0, SpawnWraidHerdB(lWP_Wraid2));
								SetGlobalNumber("tat_WraidHerd", 2);
							}
						
						break;
					
					case 2:
						if (GetIsObjectValid(oWraid1) == FALSE && GetIsObjectValid(oWraid2) == FALSE && GetIsObjectValid(oWraid3) == FALSE)
							{
								DelayCommand(1.0, SpawnWraidHerdC(lWP_Wraid3));
								SetGlobalNumber("tat_WraidHerd", 0);
							}
						
						break;
				}
		}
	
	// Sand People reputation fix
	CP_SandRepFix();
}
