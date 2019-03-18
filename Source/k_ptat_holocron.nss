////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired when retrieving the holocron in tat_m18ac (Eastern Dune Sea).
	
	Original script edit from KOTOR Bug Fix Attempt by danil-ch.
	
	Fires a standalone DLG to re-enable some unused lines for Bastila.
	
	2019-03-18                                                                */
////////////////////////////////////////////////////////////////////////////////

void main() {
	object oHolocron = GetObjectByTag("K_SWG_HELENA01", 0);
	object oBastila = GetObjectByTag("bastila", 0);
	object oPC = GetFirstPC();
	int int1 = GetGlobalBoolean("K_SWG_BASTILA_HOLO");
	if (((int1 == 0) && GetIsObjectValid(oBastila))) {
		AssignCommand(oHolocron, ActionStartConversation(oPC, "tat18_bastila", 0, 0, 0, "", "", "", "", "", ""));
	}
}