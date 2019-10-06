//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tat18_14sandg_01.dlg in tat_m18ab (Tatooine Sand People Territory).
	
	This is an added fade-out when the party has the vaporators and is teleported
	to the Chieftain in the Enclave to mask the guard visibly being destroyed
	before the module transition.
	
	See also k_ptat_sandpush.
	
	Issue #292: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/292
	
	DP 2019-10-06																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	ActionPauseConversation();
	
	SetGlobalFadeOut(4.0, 1.0);
	
	DelayCommand(5.0, ActionResumeConversation());
}
