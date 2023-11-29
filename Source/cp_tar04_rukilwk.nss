//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar04_rukil.dlg in tar_m04aa (Taris Undercity).
	
	This added script fires on every exit node for Rukil's conversation (except
	for the betrayal branch). It re-enables the random waypoint walking of the
	surrounding ambient NPCs that were disabled at the start of the conversation.
	
	See also cp_tar04_rukiljp, k_ptar_rukcs0.
	
	Issue #501: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/501
	
	DP 2023-11-29																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_generic"

void CP_ResumeWalk(object oNPC) {
	SetLocalBoolean(oNPC, SW_FLAG_WAYPOINT_WALK_RANDOM, TRUE);
	DelayCommand(0.1, AssignCommand(oNPC, GN_WalkWayPoints()));
}

void main() {
	
	object oOut1 = GetObjectByTag("OutcastMan043", 0);
	object oOut2 = GetObjectByTag("OutcastMan044", 0);
	object oOut3 = GetObjectByTag("OutcastWom041", 0);
	object oOut4 = GetObjectByTag("OutcastWom042", 0);
	object oOut5 = GetObjectByTag("OutcastWom042", 1);
	
	CP_ResumeWalk(oOut1);
	CP_ResumeWalk(oOut2);
	CP_ResumeWalk(oOut3);
	CP_ResumeWalk(oOut4);
	CP_ResumeWalk(oOut5);
}
