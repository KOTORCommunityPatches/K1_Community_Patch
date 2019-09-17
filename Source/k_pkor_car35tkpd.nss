////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by kor35_carth.dlg in korr_m35aa (Korriban Sith Academy)
	
	This script fires on the exit node of the brief interjection by Carth when
	you find the datapad detailing the death of Selene in Uthar's room. For some
	strange reason the vanilla script had a check for Carth to take the datapad
	if the PC had it and he didn't (which makes no sense with a shared inventory).
	This has been changed in order to do something useful. Namely, update the
	quest stage to reflect that you found the datapad, which doesn't seem to
	happen otherwise.
	
	Issue #4: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/4
	
	DP 2019-08-11                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	AddJournalQuestEntry("kor35_findingdustil", 25, FALSE);
}
