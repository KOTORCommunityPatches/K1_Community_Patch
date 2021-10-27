//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar04_rukil.dlg in tar_m04aa (Taris Undercity).
	
	This is one of the scripts that fires during the cutscene at the end of the
	Promised Land quest if Rukil was given all three journals and all the Outcasts
	leave the village. It was possible to complete this quest before resolving the
	Infected Outcasts quest, which would then leave behind an orphaned journal
	entry for that quest until it was finally removed when escaping Taris on the
	Ebon Hawk. The script has been hijacked to add a simple check for the Infected
	Outcasts quest and remove it if it is still active.
	
	Issue #439: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/439
	
	DP 2021-09-20																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	int nQuestStage = GetJournalEntry("tar_infectedoutcasts");
	
	ActionPauseConversation();
	ActionWait(1.0);
	ActionResumeConversation();
	
	SetGlobalFadeOut(0.0, 1.0);
	
	// Check if the quest is active.
	if (nQuestStage == 1 || nQuestStage == 10)
		{
			RemoveJournalQuestEntry("tar_infectedoutcasts");
		}
}
