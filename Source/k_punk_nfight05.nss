//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by newfight.dlg in unk_m41aa (Lehon Central Beach).
	
	This script fires midway through the cutscene where the party encounters the
	Rakata warriors when exiting the Ebon Hawk the first time. The original script
	simply ran all five Rakata to a single waypoint, which resulted in the usual
	pathfinding jankiness. Now each Rakata gets its own position, fanned out in
	front of the party. Additionally, the static camera shot is changed halfway
	through for a better angle. Original idea proposed by ebmar, but altered to
	use custom locations rather than vanilla waypoints.
	
	See also k_punk_nfight01, k_punk_nfight06.
	
	Issue #168: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/168
	
	DP 2021-11-16																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oRakata1 = GetObjectByTag("unk41_blk1", 0);
	object oRakata2 = GetObjectByTag("unk41_blk2", 0);
	object oRakata3 = GetObjectByTag("unk41_blk3", 0);
	object oRakata4 = GetObjectByTag("unk41_blk4", 0);
	object oRakata5 = GetObjectByTag("unk41_blk5", 0);
	location lRakEnd01 = Location(Vector(109.98,151.71,24.04), 218.23);
	location lRakEnd02 = Location(Vector(111.72,148.95,24.40), 218.23);
	location lRakEnd03 = Location(Vector(112.69,145.45,24.43), 182.53);
	location lRakEnd04 = Location(Vector(111.98,141.85,24.39), 160.53);
	location lRakEnd05 = Location(Vector(109.34,138.83,24.30), 151.91);
	
	ActionPauseConversation();
	
	CP_PartyMove(oRakata1, lRakEnd01, TRUE);
	CP_PartyMove(oRakata2, lRakEnd02, TRUE);
	CP_PartyMove(oRakata3, lRakEnd03, TRUE);
	CP_PartyMove(oRakata4, lRakEnd05, TRUE);
	CP_PartyMove(oRakata5, lRakEnd04, TRUE);
	
	DelayCommand(0.75, AssignCommand(oRakata1, ActionDoCommand(SetFacing(218.23))));
	DelayCommand(0.75, AssignCommand(oRakata2, ActionDoCommand(SetFacing(218.23))));
	DelayCommand(0.75, AssignCommand(oRakata3, ActionDoCommand(SetFacing(182.53))));
	DelayCommand(0.75, AssignCommand(oRakata4, ActionDoCommand(SetFacing(151.91))));
	DelayCommand(0.75, AssignCommand(oRakata5, ActionDoCommand(SetFacing(160.53))));
	
	DelayCommand(3.5, SetDialogPlaceableCamera(15));
	
	ActionWait(6.0);
	ActionResumeConversation();
}
