//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk41_blackrak.dlg in unk_m41ac (Lehon North Beach).
	
	This script fires at the start of the scene when entering the North Beach
	area for the first time. Since the two rancors tend to fire their ambient
	behaviours (like walking waypoints) during the scene, it is now disabled.
	
	See also k_punk_ambush02, k_punk_rakatk7.
	
	Issue #531: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/531
	
	DP 2023-07-24																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oRak1 = GetObjectByTag("unk41_blk1", 0);
	object oRak2 = GetObjectByTag("unk41_blk2", 0);
	object oRak3 = GetObjectByTag("unk41_blk3", 0);
	object oRak4 = GetObjectByTag("unk41_blk4", 0);
	object oRanc1 = GetObjectByTag("unk41_rancor01", 0);
	object oRanc2 = GetObjectByTag("unk41_rancor02", 0);
	//object oRanc3 = GetObjectByTag("unk41_rancord", 0);
	location lWP1 = GetLocation(GetObjectByTag("blk1wp", 0));
	location lWP2 = GetLocation(GetObjectByTag("blk2wp", 0));
	location lWP3 = GetLocation(GetObjectByTag("blk3wp", 0));
	location lWP4 = GetLocation(GetObjectByTag("blk4wp", 0));
	location lWP5 = GetLocation(GetObjectByTag("rancor01wp", 0));
	location lWP6 = GetLocation(GetObjectByTag("rancor02wp", 0));
	//location lWP7 = GetLocation(GetObjectByTag("br2", 0))
	vector vPC = GetPosition(GetObjectByTag("playerwp2", 0));
	
	ActionPauseConversation();
	
	// Disable the AI of the rancors to prevent them playing ambient
	// animations during the cutscene.
	AssignCommand(oRanc1, CP_DisableAI(TRUE));
	AssignCommand(oRanc2, CP_DisableAI(TRUE));
	
	AssignCommand(oRak1, ActionMoveToLocation(lWP1, TRUE));
	AssignCommand(oRak1, ActionDoCommand(SetFacingPoint(vPC)));
	
	AssignCommand(oRak2, ActionMoveToLocation(lWP2, TRUE));
	AssignCommand(oRak2, ActionDoCommand(SetFacingPoint(vPC)));
	
	AssignCommand(oRak3, ActionMoveToLocation(lWP3, TRUE));
	AssignCommand(oRak3, ActionDoCommand(SetFacingPoint(vPC)));
	
	AssignCommand(oRak4, ActionMoveToLocation(lWP4, TRUE));
	AssignCommand(oRak4, ActionDoCommand(SetFacingPoint(vPC)));
	
	AssignCommand(oRanc1, ActionMoveToLocation(lWP5, TRUE));
	AssignCommand(oRanc1, ActionDoCommand(SetFacingPoint(vPC)));
	
	AssignCommand(oRanc2, ActionMoveToLocation(lWP6, TRUE));
	AssignCommand(oRanc2, ActionDoCommand(SetFacingPoint(vPC)));
	
	// Third rancor that apparently no longer exists.
	//AssignCommand(oRanc3, ActionMoveToLocation(lWP7, FALSE));
	//AssignCommand(oRanc3, ActionDoCommand(SetFacingPoint(vPC)));
	
	ActionWait(3.0);
	ActionResumeConversation();
}
