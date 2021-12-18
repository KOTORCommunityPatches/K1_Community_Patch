//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	cp_inc_tat
	
	Include script for Tatooine.
																				*/
//////////////////////////////////////////////////////////////////////////////////


// Adjusts Sand People reputation to either hostile or neutral.
void CP_AdjustSandRep(object oTarget, int nHostile);

// Corrects Sand People reputation when party is disguised.
void CP_SandRepFix();

// Spawns Griff and his guards inside the Sand People Enclave.
void CP_SpawnGriff();

// Equips the target with a set of basic clothing.
void CP_EquipClothes(object oTarget);

// Removes the Sand People disguise from the target.
void CP_StripDisguise(object oTarget);


//////////////////////////////////////////////////////////////////////////////////
/*	CP_AdjustSandRep()
	
	This automatically sets the Sand People reputation so their faction will
	never have a value other than 0 (hostile) or 50 (neutral).
	
	- oTarget:	Object of faction to change. An invisible placeable is used for
				controlling the Sand People faction.
	- nHostile:	hostile = TRUE, neutral = FALSE.
	
	JC 2019-09-01																*/
//////////////////////////////////////////////////////////////////////////////////
void CP_AdjustSandRep(object oTarget, int nHostile) {
	
	object oPC = GetFirstPC();
	
	if (nHostile == TRUE)
		{
			AdjustReputation(oPC, oTarget, -GetReputation(oTarget, oPC));
		}
		else
			{
				AdjustReputation(oPC, oTarget, 50 - GetReputation(oTarget, oPC));
			}
}


//////////////////////////////////////////////////////////////////////////////////
/*	CP_SandRepFix()
	
	Triggers the Sand People to be hostile or neutral depending on various
	circumstances. Fixes several issues with their faction being wrong.
	
	Used in area enter and heartbeat scripts.
	
	JC 2019-09-01																*/
//////////////////////////////////////////////////////////////////////////////////
void CP_SandRepFix() {

	object oPM0 = GetPartyMemberByIndex(0);
	object oPM1 = GetPartyMemberByIndex(1);
	object oPM2 = GetPartyMemberByIndex(2);
	object oSandFaction = GetObjectByTag("tat18_tuskanfac", 0); // An invisible placeable controls the attitude of the Sand People faction
	int nCheck0 = FALSE;
	int nCheck1 = FALSE;
	int nCheck2 = FALSE;
	string sDisguise = "tat17_sandperdis";
	
	// Check the party leader to see if they're disguised (or a droid or not there)
	if (!GetIsObjectValid(oPM0) || GetTag(oPM0) == "HK47" || GetTag(oPM0) == "T3M4" || GetTag(GetItemInSlot(INVENTORY_SLOT_BODY, oPM0)) == sDisguise)
		{
			nCheck0 = TRUE;
		}
	
	// Check the first party member to see if they're disguised (or a droid or not there)
	if (!GetIsObjectValid(oPM1) || GetTag(oPM1) == "HK47" || GetTag(oPM1) == "T3M4" || GetTag(GetItemInSlot(INVENTORY_SLOT_BODY, oPM1)) == sDisguise)
		{
			nCheck1 = TRUE;
		}
	
	// Check the second party member to see if they're disguised (or a droid or not there)
	if (!GetIsObjectValid(oPM2) || GetTag(oPM2) == "HK47" || GetTag(oPM2) == "T3M4" || GetTag(GetItemInSlot(INVENTORY_SLOT_BODY, oPM2)) == sDisguise)
		{
			nCheck2 = TRUE;
		}
	
	// If the player is working for the Chieftain, make the Sand People friendly
	if (GetGlobalBoolean("tat_TuskenJob") == TRUE & GetGlobalBoolean("tat_TuskenMad") == FALSE)
		{
			CP_AdjustSandRep(oSandFaction, FALSE);
		}
	
	// If the player hasn't angered the Sand People, but the disguise global isn't set, correct the Sand People attitude
	if (GetGlobalBoolean("tat_TuskenSuit") == FALSE && GetGlobalBoolean("tat_TuskenMad") == FALSE)
		{
			// If the whole party is disguised, set the disguise global and make Sand People friendly
			if (nCheck0 == TRUE && nCheck1 == TRUE && nCheck2 == TRUE)
				{
					CP_AdjustSandRep(oSandFaction, FALSE);
					SetGlobalBoolean("tat_TuskenSuit", FALSE);
				}
				// If somebody isn't disguised and the player isn't working for the Chieftain, make Sand People hostile but don't change the disguise global
				else if (GetGlobalBoolean("tat_TuskenJob") == FALSE)
					{
					CP_AdjustSandRep(oSandFaction, TRUE);
					}
		}
	
	// Disguise global is already set or player has angered Sand People
	else
		{
			// If anybody isn't disguised or if the Sand People have been angered, and the player isn't working for the Chieftain, make Sand People hostile and set the disguise global
			if ((nCheck0 == FALSE || nCheck1 == FALSE || nCheck2 == FALSE || GetGlobalBoolean("tat_TuskenMad") == TRUE) && GetGlobalBoolean("tat_TuskenJob") == FALSE)
				{
					CP_AdjustSandRep(oSandFaction, TRUE);
					SetGlobalBoolean("tat_TuskenSuit", FALSE);
				}
		}
}


//////////////////////////////////////////////////////////////////////////////////
/*	CP_SpawnGriff()
	
	Spawns Mission's brother Griff and his four Sand People guards inside the
	Enclave when Mission's quest is at the right stage. The vanilla function
	used a local boolean on the module to prevent spawning duplicates, but
	occasionally the function would trigger without actually spawning him,
	meaning that he would never spawn due to the local, breaking the quest.
	
	Used in the Sand People Enclave OnEnter (k_ptat20aa_enter).
	
	Issue #512: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/512
	
	DP 2021-11-29																*/
//////////////////////////////////////////////////////////////////////////////////
void CP_SpawnGriff() {
	if (GetGlobalNumber("Mis_MissionTalk") == 9 && !GetIsObjectValid(GetObjectByTag("tat20_griff")))
		{
			int SW_PLOT_BOOLEAN_01 = 0;
			// Original vanilla Griff check which could fail.
			// SetGriffSpawnLocal(TRUE);
			// Still set the boolean in case it is used elsewhere, but cut out extraneous include guff.
			SetLocalBoolean(OBJECT_SELF, SW_PLOT_BOOLEAN_01, TRUE);
			CreateObject(OBJECT_TYPE_CREATURE, "tat20_griff", GetLocation(GetWaypointByTag("tat20_wp_griff")));
			CreateObject(OBJECT_TYPE_CREATURE, "tat20_09warr_01", GetLocation(GetObjectByTag("tat20_griffguard", 0)));
			CreateObject(OBJECT_TYPE_CREATURE, "tat20_09warr_01", GetLocation(GetObjectByTag("tat20_griffguard", 1)));
			CreateObject(OBJECT_TYPE_CREATURE, "tat20_09warr_01", GetLocation(GetObjectByTag("tat20_griffguard", 2)));
			CreateObject(OBJECT_TYPE_CREATURE, "tat20_09warr_01", GetLocation(GetObjectByTag("tat20_griffguard", 3)));
		}
}


//////////////////////////////////////////////////////////////////////////////////
/*	CP_EquipClothes()
	
	A modified version of the EquipBasicClothing function from k_inc_tat. Equips
	the target NPC with clothing from the player's inventory, or spawns a new
	set if no clothing exists. For use in conjunction with CP_StripDisguise when
	removing the Sand People disguises from the party in the Sand People Enclave.
	
	DP 2021-12-18																*/
//////////////////////////////////////////////////////////////////////////////////
void CP_EquipClothes(object oTarget) {
	
	object oInvItem;
	int bFound = FALSE;
	
	if (GetTag(oTarget) != "HK47" && GetTag(oTarget) != "T3M4")
		{
			oInvItem = GetFirstItemInInventory(oTarget);
			
			while (GetIsObjectValid(oInvItem) == TRUE && bFound == FALSE)
				{
					if (GetBaseItemType(oInvItem) == BASE_ITEM_BASIC_CLOTHING && GetItemInSlot(INVENTORY_SLOT_BODY, oTarget) != oInvItem)
						{
							AssignCommand(oTarget, ActionEquipItem(oInvItem, INVENTORY_SLOT_BODY, TRUE));
							bFound = TRUE;
						}
					
					oInvItem = GetNextItemInInventory(oTarget);
				}

			if (bFound == FALSE)
				{
					oInvItem = CreateItemOnObject("g_a_clothes01", oTarget);
					AssignCommand(oTarget, ActionEquipItem(oInvItem, INVENTORY_SLOT_BODY,TRUE));
				}
		}
}


//////////////////////////////////////////////////////////////////////////////////
/*	CP_StripDisguise()
	
	Removes the Sand People disguise if it is equipped on the target NPC and equips
	basic clothing via CP_EquipClothes.
	
	DP 2021-12-18																*/
//////////////////////////////////////////////////////////////////////////////////
void CP_StripDisguise(object oTarget) {
	object oTorsoItem = GetItemInSlot(INVENTORY_SLOT_BODY, oTarget);

	if (GetTag(oTorsoItem) == "tat17_sandperdis")
		{
			AssignCommand(oTarget, ClearAllActions());
			CP_EquipClothes(oTarget);
		}
}
