//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar04_rukil.dlg/tar04_gendar041.dlg in tar_m04aa (Taris Undercity).
	
	This added script fires on every exit node for Rukil's conversation (except
	for the betrayal branch). It re-enables the random waypoint walking of the
	surrounding ambient NPCs that were disabled at the start of the conversation.
	
	Updated 2023-12-10 to correctly identify the fifth waypoint walker as Shaleena.
	Also now used on the exit nodes of Gendar's DLG, since he has gotten the same
	party jump setup.
	
	See also cp_tar04_gendjmp, cp_tar04_rukiljp, k_ptar_rukcs0.
	
	Issue #501: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/501
	
	Issue #722: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/722
	
	DP 2023-11-29 / DP 2023-12-10												*/
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
	object oShal = GetObjectByTag("outcastshaleena", 0);
	
	CP_ResumeWalk(oOut1);
	CP_ResumeWalk(oOut2);
	CP_ResumeWalk(oOut3);
	CP_ResumeWalk(oOut4);
	CP_ResumeWalk(oShal);
}
