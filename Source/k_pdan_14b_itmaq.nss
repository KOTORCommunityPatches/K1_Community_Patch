////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	k_pdan_14b_area
	
	OnAcquirItem for danm14ab
	
	Fixed to set the journal entry in this script rather than the OnUse for the
	Casus placeable (which caused problems) and to cooperate with fixes
	elsewhere.
	
	JC 2019-02-05                                                             */
////////////////////////////////////////////////////////////////////////////////
void main() {

object oItem = GetModuleItemAcquired();
if ((GetTag(oItem) == "dan14_diary")) {
	SetGlobalNumber("DAN_CASUS_PLOT", 2);
	AddJournalQuestEntry("dan_casus", 10, 0);
	}

}