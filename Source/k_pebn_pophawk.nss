//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnModLoad for ebo_m12aa (Ebon Hawk).
	
	This is the Ebon Hawk's OnModLoad. It has been tweaked to fix an oversight for
	Juhani, who didn't have her state saved like the other companions.
	
	Issue #111: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/111
	
	DP 2020-06-10																*/
////////////////////////////////////////////////////////////////////////////////// 

#include "k_inc_utility"

void HawkEnter() {
	
	int nGizka = 0;
	
	while (GetIsObjectValid(GetObjectByTag("gizka", nGizka)))
		{
			DelayCommand(0.2, DestroyObject(GetObjectByTag("gizka", nGizka)));
			(nGizka++);
		}
	
	int nMultiply;
	int nState = 0;
	
	if (GetGlobalNumber("EBO_GIZKA_PLOT") == 1)
		{
			SetGlobalNumber("GizkaMultiplier", (GetGlobalNumber("GizkaMultiplier") + 1));
			nMultiply = ((GetGlobalNumber("GizkaMultiplier") + 1) * 3);
			
			if ((nMultiply >= 15))
				{
					nMultiply = 15;
				}
			
			while ((nState <= nMultiply))
				{
					(nState++);
					
					{
						location lSpawn;
						
						if ((nGizka < 10))
							{
								lSpawn = GetLocation(GetObjectByTag((("wp_Gizka_" + "0") + IntToString(nState)), 0));
							}
							else
								{
									lSpawn = GetLocation(GetObjectByTag(("wp_Gizka_" + IntToString(nState)), 0));
								}
						
						CreateObject(OBJECT_TYPE_CREATURE, "g_gizka016", lSpawn);
					}
				}
		}
	
	DelayCommand(0.2, DestroyObject(GetObjectByTag("Sasha", 0)));
	DelayCommand(0.2, DestroyObject(GetObjectByTag("LurArka", 0)));
	
	if (GetGlobalNumber("Ebo_Sasha_State") >= 40 && GetGlobalNumber("Ebo_Sasha_State") < 99)
		{
			DelayCommand(0.5, UT_CreateObject(OBJECT_TYPE_CREATURE, "Sasha", GetLocation(GetObjectByTag("SashaSpawn", 0))));
		}
	
	if ((GetGlobalNumber("EBO_LURARKA") == 4))
		{
			NoClicksFor(0.7);
			DelayCommand(0.5, UT_CreateObject(OBJECT_TYPE_CREATURE, "LurArka", GetLocation(GetObjectByTag("SashaSpawn", 0))));
			DelayCommand(0.6, AssignCommand(GetObjectByTag("LurArka", 0), ActionStartConversation(GetFirstPC())));
		}
	
	int nGlobal = GetGlobalNumber("EBO_MYSTERY_BOX");
	object oMysteryBox = GetObjectByTag("EBO_MysteryBox", 0);
	
	if (nGlobal == 5 && !GetIsObjectValid(oMysteryBox))
		{
			object oEBO_MYSTERY_SPAWN = GetWaypointByTag("EBO_MYSTERY_SPAWN");
			location lMystery = GetLocation(oEBO_MYSTERY_SPAWN);
			
			DelayCommand(0.5, UT_CreateObject(OBJECT_TYPE_PLACEABLE, "g_pebn_mystery", lMystery));
		}
		else
			{
				if (nGlobal == 99 && GetIsObjectValid(oMysteryBox))
					{
						DestroyObject(oMysteryBox);
					}
			}
}

void DestroyParty() {
	
	object oNPC1 = GetObjectByTag("bastila");
	object oNPC2 = GetObjectByTag("carth");
	object oNPC3 = GetObjectByTag("cand");
	object oNPC4 = GetObjectByTag("hk47");
	object oNPC5 = GetObjectByTag("jolee");
	object oNPC6 = GetObjectByTag("juhani");
	object oNPC7 = GetObjectByTag("mission");
	object oNPC8 = GetObjectByTag("t3m4");
	object oNPC9 = GetObjectByTag("zaalbar");
	object oCurrent;

	int nParty = 1;
	
	while(nParty <= 9)
		{
			if(nParty == 1){oCurrent = oNPC1;}
			if(nParty == 2){oCurrent = oNPC2;}
			if(nParty == 3){oCurrent = oNPC3;}
			if(nParty == 4){oCurrent = oNPC4;}
			if(nParty == 5){oCurrent = oNPC5;}
			if(nParty == 6){oCurrent = oNPC6;}
			if(nParty == 7){oCurrent = oNPC7;}
			if(nParty == 8){oCurrent = oNPC8;}
			if(nParty == 9){oCurrent = oNPC9;}

			if (GetIsObjectValid(oCurrent))
				{
					DestroyObject(oCurrent, 0.0, TRUE);
				}
			
			nParty++;
		}
}

void main() {
	
	location lSpawn;
	object oSpawnWP;
	
	UT_ClearAllPartyMembers();
	DelayCommand(0.2, DestroyParty());
	
	SetGlobalBoolean("K_AT_EBON_HAWK", TRUE);
	
	if (IsAvailableCreature(NPC_BASTILA) && !GetGlobalBoolean("DAN_BASTILA_AT_JEDI"))
		{
			oSpawnWP = GetWaypointByTag("pebn_bastila");
			lSpawn = GetLocation(oSpawnWP);
			
			if (GetIsObjectValid(oSpawnWP))
				{
					DelayCommand(0.5, UT_SpawnAvailableNPC(NPC_BASTILA, lSpawn));
					DelayCommand(2.0, SaveNPCState(NPC_BASTILA));
				}
		}
	
	if (IsAvailableCreature(NPC_CANDEROUS))
		{
			oSpawnWP = GetWaypointByTag("pebn_canderous");
			lSpawn = GetLocation(oSpawnWP);
			
			if (GetIsObjectValid(oSpawnWP))
				{
					DelayCommand(0.5, UT_SpawnAvailableNPC(NPC_CANDEROUS, lSpawn));
					DelayCommand(2.0, SaveNPCState(NPC_CANDEROUS));
				}
		}
	
	if (IsAvailableCreature(NPC_CARTH) && !GetGlobalBoolean("DAN_CARTH_AT_JEDI"))
		{
			oSpawnWP = GetWaypointByTag("pebn_carth");
			lSpawn = GetLocation(oSpawnWP);
			
			if (GetIsObjectValid(oSpawnWP))
				{
					DelayCommand(0.5, UT_SpawnAvailableNPC(NPC_CARTH, lSpawn));
					DelayCommand(2.0, SaveNPCState(NPC_CARTH));
				}
		}
	
	if (IsAvailableCreature(NPC_HK_47))
		{
			oSpawnWP = GetWaypointByTag("pebn_hk47");
			lSpawn = GetLocation(oSpawnWP);
			
			if (GetIsObjectValid(oSpawnWP))
				{
					DelayCommand(0.5, UT_SpawnAvailableNPC(NPC_HK_47, lSpawn));
					DelayCommand(2.0, SaveNPCState(NPC_HK_47));
				}
		}
	
	if (IsAvailableCreature(NPC_JOLEE))
		{
			oSpawnWP = GetWaypointByTag("pebn_jolee");
			lSpawn = GetLocation(oSpawnWP);
			
			if (GetIsObjectValid(oSpawnWP))
				{
					DelayCommand(0.5, UT_SpawnAvailableNPC(NPC_JOLEE, lSpawn));
					DelayCommand(2.0, SaveNPCState(NPC_JOLEE));
				}
		}
	
	if (IsAvailableCreature(NPC_JUHANI))
		{
			oSpawnWP = GetWaypointByTag("pebn_juhani");
			lSpawn = GetLocation(oSpawnWP);
			
			if (GetIsObjectValid(oSpawnWP))
				{
					DelayCommand(0.5, UT_SpawnAvailableNPC(NPC_JUHANI, lSpawn));
					// In the vanilla script, Juhani has a ClearAllEffects run on her instead
					// of SaveNPCState like all the other party members.
					DelayCommand(2.0, SaveNPCState(NPC_JUHANI));
				}
		}
	
	if (IsAvailableCreature(NPC_MISSION))
		{
			oSpawnWP = GetWaypointByTag("pebn_mission");
			lSpawn = GetLocation(oSpawnWP);
			
			if (GetIsObjectValid(oSpawnWP))
				{
					DelayCommand(0.5, UT_SpawnAvailableNPC(NPC_MISSION, lSpawn));
					DelayCommand(2.0, SaveNPCState(NPC_MISSION));
				}
		}
	
	if (IsAvailableCreature(NPC_T3_M4))
		{
			oSpawnWP = GetWaypointByTag("pebn_t3m4");
			lSpawn = GetLocation(oSpawnWP);
			
			if (GetIsObjectValid(oSpawnWP))
				{
					DelayCommand(0.5, UT_SpawnAvailableNPC(NPC_T3_M4, lSpawn));
					DelayCommand(2.0, SaveNPCState(NPC_T3_M4));
				}
		}
	
	if (IsAvailableCreature(NPC_ZAALBAR) && !GetGlobalBoolean("tat_ZaalbarTaken"))
		{
			oSpawnWP = GetWaypointByTag("pebn_zaalbar");
			lSpawn = GetLocation(oSpawnWP);
			
			if (GetIsObjectValid(oSpawnWP))
				{
					DelayCommand(0.5, UT_SpawnAvailableNPC(NPC_ZAALBAR, lSpawn));
					DelayCommand(2.0, SaveNPCState(NPC_ZAALBAR));
				}
		}
	
	DelayCommand(1.0, UT_HealAllPartyNPCs());
	
	SetGlobalNumber("K_SWG_BASTILA_LEVEL", 0);
	SetGlobalNumber("K_SWG_JOLEE_LEVEL", 0);
	SetGlobalNumber("K_SWG_CARTH_LEVEL", 0);
	
	if (!GetLoadFromSaveGame())
		{
			HawkEnter();
		}
}
