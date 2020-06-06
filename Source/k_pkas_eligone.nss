//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kas22_eli_01.dlg in kas_m22aa (Kashyyyk Landing Pad).
	
	An edit to the vanilla script that fires on the exit node of the branch where
	Eli runs away after the player shows the droid head to Matton. In the vanilla
	game, the scene drops back into normal play when finished and the player has to
	manually re-initiate conversation with Matton. Now it is directly started once
	this scene ends.
	
	See also cp_kas22_matfade, k_pkas_elileave.
	
	Issue #118: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/118

	DP 2020-06-06																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oMatton = GetObjectByTag("kas22_dasol_01", 0);
	
	NoClicksFor(1.0);
	
	// Simplification of Kashyyyk include function SetEliDeadLocal
	// 0 = SW_PLOT_BOOLEAN_01
	SetLocalBoolean(oMatton, 0, TRUE);
	
	AssignCommand(oMatton, DelayCommand(0.5, ActionStartConversation(GetFirstPC(), "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
	
	ClearAllActions();
	DestroyObject(OBJECT_SELF, 0.0, TRUE);
}
