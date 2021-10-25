//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired on E64 of unk44_evilbast.dlg in unk_m44ac (Lehon Temple Roof).
	
	This is one of a series of scripts that fire at the end of the conversation
	on the temple roof when you side with Bastila and Jolee & Juhani turn hostile.
	The vanilla script just adds the journal entry about siding with Bastila, 
	but this has been expanded to also delete the personal quests for Jolee and
	Juhani if they are still in the player's journal. It's not like you'll be
	needing those any more....
	
	Issue #424: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/424
	
	DP 2021-10-25																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	AddJournalQuestEntry("k_swg_bastilatalk", 4, TRUE);
	
	// Remove Jolee and Juhani's personal quests.
	RemoveJournalQuestEntry("k_swg_joleetalk");
	RemoveJournalQuestEntry("k_swg_juhani");
}
