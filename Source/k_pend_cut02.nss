//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by end_cut01.dlg in end_m01aa (Endar Spire Command Module).
	
	This script fires during the the Darth Bandon confrontation/Trask's sacrifice
	cutscene. It signals Bandon to walk forwards. For some reason, the original
	script only paused the conversation, with the resume command being sandwiched
	between two move commands in Bandon's OUD event. This has been altered so that
	the resume is handled here, meaning Bandon only needs a single move command,
	smoothing out his stop-start behaviour.
	
	See also k_pend_cut14, k_pend_cut23, k_pend_cut32, k_pend_traskdie1.
	
	Issue #230: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/230
	
	DP 2019-10-08																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	ActionPauseConversation();
	
	SignalEvent(GetObjectByTag("end_bandon", 0), EventUserDefined(10));
	
	DelayCommand(1.25, ActionResumeConversation());
}
