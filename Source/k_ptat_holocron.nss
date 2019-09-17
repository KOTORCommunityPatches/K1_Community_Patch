////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired when retrieving the holocron in tat_m18ac (Eastern Dune Sea).
	
	Original script edit from KOTOR Bug Fix Attempt by danil-ch.
	
	Fires a standalone DLG to re-enable some unused lines for Bastila.
	
	2019-03-18
	
////////////////////////////////////////////////////////////////////////////////
	
	Edited to add an additional check that the player actually has the holocron
	in their possession before initiating the dialogue.
	
	Issue #219: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/219
	
	DP 2019-09-05                                                                */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oBackpack = GetObjectByTag("K_SWG_HELENA01", 0);
	object oBastila = GetObjectByTag("bastila", 0);
	object oPC = GetFirstPC();
	object oHasItem = GetItemPossessedBy(oPC, "holocron");
	int nTalked = GetGlobalBoolean("K_SWG_BASTILA_HOLO");
	
	if ((nTalked == FALSE) && (GetIsObjectValid(oBastila)) && (GetIsObjectValid(oHasItem)))
		{
			AssignCommand(oBackpack, ActionStartConversation(oPC, "tat18_bastila"));
		}
}
