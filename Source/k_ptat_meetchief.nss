//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tat20_09first_01.dlg in tat_m20aa (Tatooine Sand People Enclave).
	
	This is the script that strips the party of their Sand People disguises before
	they go to see the Chieftain. While the vanilla version of this script cannot
	be decompiled, it appears to simply be a call to the DestroySandpeopleDisguise
	function in k_inc_tat. It seems the original intention of that function was to
	equip the party with clothes after the disguises were destroyed, but that was
	commented out and the function in-game leaves the party in their underwear. So
	the functions were changed up a little in order to skip over the droids and
	re-enabled. The original script also jumped the party, but that is unnecessary
	since they are jumped again on the first node of the Chieftain's DLG.
	
	See also cp_tat20_enc1st, k_ptat_cheifguar, k_ptat_chiefjump, k_ptat_meetchief
	
	Issue #296: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/296
	
	DP 2019-10-06																*/
//////////////////////////////////////////////////////////////////////////////////

// A modified version of EquipBasicClothing from k_inc_tat
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
					oInvItem = CreateItemOnObject("G_A_CLOTHES01", oTarget);
					AssignCommand(oTarget, ActionEquipItem(oInvItem, INVENTORY_SLOT_BODY,TRUE));
				}
		}
}

void main() {
	
	object oPC = GetFirstPC();
	object oParty1 = GetPartyMemberByIndex(0);
	object oParty2 = GetPartyMemberByIndex(1);
	object oParty3 = GetPartyMemberByIndex(2);
	object oTorsoItem;

	NoClicksFor(2.5);
	
	ActionPauseConversation();
	
	SetGlobalBoolean("tat_TuskenSuit", FALSE);
	
	oTorsoItem = GetItemInSlot(INVENTORY_SLOT_BODY, oParty1);

	if (GetTag(oTorsoItem) == "tat17_sandperdis")
		{
			AssignCommand(oParty1, ClearAllActions());
			AssignCommand(oParty1, ActionUnequipItem(oTorsoItem));
			DestroyObject(oTorsoItem);
			CP_EquipClothes(oParty1);
		}
	
	oTorsoItem = GetItemInSlot(INVENTORY_SLOT_BODY, oParty2);

	if (GetTag(oTorsoItem) == "tat17_sandperdis")
		{
			AssignCommand(oParty2, ClearAllActions());
			AssignCommand(oParty2, ActionUnequipItem(oTorsoItem));
			DestroyObject(oTorsoItem);
			CP_EquipClothes(oParty2);
		}
	
	oTorsoItem = GetItemInSlot(INVENTORY_SLOT_BODY, oParty3);
	
	if (GetTag(oTorsoItem) == "tat17_sandperdis")
		{
			AssignCommand(oParty3, ClearAllActions());
			AssignCommand(oParty3, ActionUnequipItem(oTorsoItem));
			DestroyObject(oTorsoItem);
			CP_EquipClothes(oParty3);
		}

	ActionWait(1.0);

	object oInvItem = GetFirstItemInInventory(oPC);

	while (GetIsObjectValid(oInvItem) == TRUE)
		{
			if (GetTag(oInvItem) == "tat17_sandperdis")
				{
					DestroyObject(oInvItem);
				}

			oInvItem = GetNextItemInInventory(oPC);
		}
	
	ActionResumeConversation();
}
