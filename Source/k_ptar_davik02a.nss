////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar08_davik081.dlg in tar_m08aa (Taris Davik's Estate).

	This script handles the fade-in to the start of the final portion of the
	initial Davik conversation, masking the transition from the hangar to the
	guest wing. The fade-in has simply been extended to better mask the delay
	before Davik begins speaking.

	Issue #57: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/57

	DP 2019-05-07                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	SetGlobalFadeIn(0.0, 1.5);
	ActionPauseConversation();
	ActionWait(2.0);
	ActionResumeConversation();
}
