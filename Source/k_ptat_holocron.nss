////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired when retrieving the holocron in tat_m18ac (Eastern Dune Sea).
	
	Original script edit from KOTOR Bug Fix Attempt by danil-ch.
	
	Fires a standalone DLG to re-enable some unused lines for Bastila.
	
	Edited 2019-09-05 to add an additional check that the player has the
	holocron in their possession before initiating the dialogue.
	
	2019-03-18                                                                */
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
