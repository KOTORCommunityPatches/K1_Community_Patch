//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar10_kandon01.dlg in tar_m10aa (Taris Black Vulkar Base Upper).
	
	This script is fired at the end of the scene before the swoop race at the
	Vulkar base, walking a Vulkar mook up to the player and then walking them
	both out. Since the player's orientation was locked for the previous shot,
	it is now unlocked before the end of the scene.
	
	See also k_ptar_fadeout.
	
	Issue #12: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/12
	
	DP 2023-12-21																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oVulk = GetObjectByTag("tar11_csvulkar", 0);
	object oWP = GetObjectByTag("tar11_wpcsvulkar", 0);
	
	ActionPauseConversation();
	
	NoClicksFor(12.0);
	
	SetGlobalFadeIn(0.5, 1.0);
	
	SetLocalBoolean(oVulk, SW_PLOT_BOOLEAN_10, TRUE);
	
	AssignCommand(oVulk, ActionMoveToObject(oPC, FALSE, 1.5));
	AssignCommand(oVulk, ActionPlayAnimation(ANIMATION_LOOPING_FLIRT, 1.0, 1.06667));
	AssignCommand(oVulk, ActionMoveToObject(oWP));
	
	DelayCommand(9.0, CP_DLGLock(oPC, FALSE));
	DelayCommand(10.0, AssignCommand(oPC, ActionMoveToObject(oWP)));
	
	DelayCommand(11.0, SetGlobalFadeOut(0.0, 1.0));
	
	ActionWait(12.0);
	ActionResumeConversation();
}
