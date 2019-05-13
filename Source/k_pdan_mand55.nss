////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnUserDefine for dan14ab_mand01.utc in danm14ab (Dantooine Matale Grounds).
	
	This is the OnUserDefine script for the Mando in the "Take my wife and
	children instead!" cutscene where the Mandalorian raiders kill a farmer.
	Because an issue was encountered where the Mando equipped a	sword while
	shooting the farmer in the middle of the cutscene, it was decided that the
	best solution was to remove the sword before the cutscene starts, then add
	it back before combat with the player commences. Case 100 has been modified
	to carry out the initial removal. See also k_pdan_cut08.
	
	DP 2019-05-12                                                             */
////////////////////////////////////////////////////////////////////////////////


void main() {

	int int1 = GetUserDefinedEventNumber();
	
	switch (int1)
	{
		case 100:
			{
				object oPC = GetFirstPC();
				object oItem = GetFirstItemInInventory(OBJECT_SELF);
				
				ActionWait(3.0);
				
				while (GetIsObjectValid(oItem) == TRUE)
					{
						if (GetTag(oItem) == "g_w_vbroswrd01")
							{
								DestroyObject(oItem);
							}
						oItem = GetNextItemInInventory(OBJECT_SELF);
					}
				
				ActionStartConversation(oPC, "dan14ab_cut01", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE, "", "", "", "", "", "");
			}
			break;
			
		case 1007:
			{
				int nGlobal = GetGlobalNumber("DAN_MAND_STATE");
				
				if (((nGlobal > 1) && (nGlobal < 5)))
					{
						CreateItemOnObject(("g_mandat" + IntToString((nGlobal - 1))), OBJECT_SELF, 1);
					}
				
				SetGlobalNumber("DAN_MAND_STATE", (nGlobal + 1));
				AddJournalQuestEntry("dan_raiders", 30, 0);
			}
			break;
	}
}