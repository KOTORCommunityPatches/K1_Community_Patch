////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by kor39_utharwynn.dlg in korr_m39aa (Korriban Tomb of Naga Sadow)
	
	This script Fires during the introductory cutscene, moving player forwards.
	In order to remove a long delay on the initial node looking at a closed
	door, the node this script fires on has had its delay increased slightly.
	
	Issue #167: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/167
	
	DP 2019-08-10                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oWP_PC = GetObjectByTag("k39_way_player", 0);
	
	ActionPauseConversation();
	
	AssignCommand(oPC, ActionMoveToObject(oWP_PC));
	
	DelayCommand(4.0, ActionResumeConversation());
}
