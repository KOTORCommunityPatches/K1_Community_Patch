//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk41_ithor01.dlg in unk_m41aa (Lehon Central Beach).
	
	This script runs the Duros out of shot. The destroy command has been moved
	into the script from k_punk_ith01, which fired on the exit node, in order
	to make sure they are destroyed before dropping back to the game.
	
	See also k_punk_ith01, k_punk_ith03, k_punk_41aa_def.
	
	Issue #285: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/285
	
	DP 2019-10-02																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oDuros1 = GetObjectByTag("unk41_ithor01", 0);
	object oDuros2 = GetObjectByTag("unk41_ithor02", 0);
	object oExit = GetWaypointByTag("ithleave");
	
	ActionPauseConversation();
	
	SetGlobalFadeOut(1.0, 2.0);
	
	AssignCommand(oDuros1, ActionMoveToObject(oExit, TRUE));
	DelayCommand(3.2, DestroyObject(oDuros1, 0.0, TRUE));
	
	AssignCommand(oDuros2, ActionMoveToObject(oExit, TRUE));
	DelayCommand(3.2, DestroyObject(oDuros2, 0.0, TRUE));
	
	DelayCommand(3.5, ActionResumeConversation());
}
