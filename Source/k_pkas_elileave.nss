//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kas22_eli_01.dlg in kas_m22aa (Kashyyyk Landing Pad).
	
	A minor edit to the vanilla script of Eli running away after the player shows
	the droid head to Matton to ensure that Eli doesn't reach his destination before
	the fade-out, and that there is a sufficient pause before Matton's conversation
	is started. Also has the party face Matton via a signal to Matton's OUD.
	
	See also cp_kas22_matt_d, cp_kas22_matfade, k_pkas_eligone.
	
	Issue #118: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/118

	DP 2020-06-06																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oMatton = GetObjectByTag("kas22_dasol_01", 0);
	
	location lExit = Location(Vector(131.0,92.0,61.843), 21.0);
	
	NoClicksFor(4.0);
	
	ActionPauseConversation();
	
	SetGlobalFadeOut(0.0, 3.0);
	
	DelayCommand(2.0, SignalEvent(oMatton, EventUserDefined(200)));
	
	ActionMoveToLocation(lExit, TRUE);
	
	ActionWait(1.0);
	
	ActionResumeConversation();
}
