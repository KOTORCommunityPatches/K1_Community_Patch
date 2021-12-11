//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man_k_h_bandon.dlg in manm28aa (Manaan Hrakert Station).

	This script fires on the first node of the Bandon cutscene. Due to the fade-in
	this shot gets cut off too quickly, so the pause has been extended by a couple
	of seconds. Replaces the original script, imaginatively named k_pman_pause.
	
	Issue #142: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/142

	DP 2021-12-11																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void main() {
	
	object oWP_PC = GetObjectByTag("man_pc_jump0", 0);
	object oWP_PM1 = GetObjectByTag("man_pc_jump1", 0);
	object oWP_PM2 = GetObjectByTag("man_pc_jump2", 0);
	
	ActionPauseConversation();
	
	NoClicksFor(4.0);
	
	UT_TeleportWholeParty(oWP_PC, oWP_PM1, oWP_PM2);
	
	DelayCommand(4.0, ActionResumeConversation());
}
