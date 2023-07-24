//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk41_blackrak.dlg in unk_m41ac (Lehon North Beach).
	
	This script fires on just before the exit node when the player agrees to
	meet The One after entering the North Beach area for the first time. Since
	the two rancors had their AI disabled at the start of the scene to prevent
	their ambient behaviours (like walking waypoints) firing during the scene,
	it is now switched back on.
	
	See also k_punk_rakatk7, k_punk_rakspk02.
	
	Issue #531: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/531
	
	DP 2023-07-24																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oRak1 = GetObjectByTag("unk41_blk1", 0);
	object oRak2 = GetObjectByTag("unk41_blk2", 0);
	object oRak3 = GetObjectByTag("unk41_blk3", 0);
	object oRak4 = GetObjectByTag("unk41_blk4", 0);
	object oRanc1 = GetObjectByTag("unk41_rancor01", 0);
	object oRanc2 = GetObjectByTag("unk41_rancor02", 0);
	location lPC = GetLocation(GetObjectByTag("playermove", 0));
	
	ActionPauseConversation();
	
	// Enable the AI of the rancors after it was disabled at the start of the scene.
	AssignCommand(oRanc1, CP_DisableAI(FALSE));
	AssignCommand(oRanc2, CP_DisableAI(FALSE));
	
	AssignCommand(oRak1, ActionMoveToLocation(lPC));
	AssignCommand(oRak2, ActionMoveToLocation(lPC));
	AssignCommand(oRak3, ActionMoveToLocation(lPC));
	AssignCommand(oRak4, ActionMoveToLocation(lPC));
	AssignCommand(oRanc1, ActionMoveToLocation(lPC));
	AssignCommand(oRanc2, ActionMoveToLocation(lPC));
	
	AssignCommand(oPC, ActionMoveToLocation(lPC));
	AssignCommand(oPM1, ActionMoveToLocation(lPC));
	AssignCommand(oPM2, ActionMoveToLocation(lPC));
	
	SetGlobalFadeOut(2.0, 1.0);
	
	SetGlobalBoolean("Unk_Ambush_Temp", 0);
	
	ActionWait(3.0);
	ActionResumeConversation();
}
