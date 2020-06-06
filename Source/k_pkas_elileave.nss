//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kas22_eli_01.dlg in kas_m22aa (Kashyyyk Landing Pad).
	
	A minor edit to the vanilla script of Eli running away after the player shows
	the droid head to Matton to ensure that Eli doesn't reach his destination before
	the fade-out, and that there is a sufficient pause before Matton's conversation
	is started.
	
	See also cp_kas22_matfade, k_pkas_eligone.
	
	Issue #118: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/118

	DP 2020-06-06																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	location lExit = Location(Vector(128.0,91.0,62.144), 0.0);
	
	NoClicksFor(3.0);
	
	ActionPauseConversation();
	
	SetGlobalFadeOut(0.0, 3.0);
	
	ActionMoveToLocation(lExit, TRUE);
	
	DelayCommand(3.0, ActionResumeConversation());
}
