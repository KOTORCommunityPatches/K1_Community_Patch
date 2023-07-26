//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar03_mission031.dlg in tar_m03ae (Taris Lower City Javyar's Cantina).
	
	This script is fired on the first node of the cutscene with Mission being
	confronted by a pair of Rodians (AKA the "greenies"). Since the party can
	be seen in the background when approaching from the southern side, they need
	to be wrangled. However, the scene can be triggered from either side of the
	room, necessitating an approach without the use of predefined positions.
	
	See also cp_tar03_misjump, k_ptar_missexcan.
	
	Issue #495: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/495
	
	DP 2023-07-26																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_tar"
#include "cp_inc_k1"

void main() {
	
	object oPM0 = GetPartyMemberByIndex(0);
	object oPM1 = GetPartyMemberByIndex(1);
	object oPM2 = GetPartyMemberByIndex(2);
	object oRodian1 = GetObjectByTag("rodian033", 0);
	object oRodian2 = GetObjectByTag("rodian034", 0);
	object oMission = GetObjectByTag("mission031", 0);
	object oRod1WP = GetObjectByTag("tar03_wprodiana", 0);
	object oRod2WP = GetObjectByTag("tar03_wprodianb", 0);
	
	ActionPauseConversation();
	
	NoClicksFor(4.0);
	
	UT_SetTalkedToBooleanFlag(oMission, TRUE);
	
	AssignCommand(oRodian1, ActionMoveToObject(oRod1WP));
	DelayCommand(1.0, AssignCommand(oRodian2, ActionMoveToObject(oRod2WP)));
	
	// Since the party can trigger the cutscene from either side of the room, wrangle them via move
	// orders rather than jumping to fixed positions. Walk the controlled character forwards briefly,
	// then run any remaining party members close to them. Then face everyone at the Rodians.
	CP_PartyMoveObject(oPM0, oRod2WP);
	DelayCommand(0.8, AssignCommand(oPM0, ClearAllActions()));
	DelayCommand(0.8, AssignCommand(oPM1, ClearAllActions()));
	DelayCommand(0.8, AssignCommand(oPM2, ClearAllActions()));
	DelayCommand(1.0, AssignCommand(oPM1, ActionForceMoveToObject(oPM0, TRUE, 1.5)));
	DelayCommand(1.0, AssignCommand(oPM2, ActionForceMoveToObject(oPM0, TRUE, 1.5)));
	DelayCommand(1.5, CP_FaceNPC(oPM0, oRodian1));
	DelayCommand(1.5, CP_FaceNPC(oPM1, oRodian1));
	DelayCommand(1.5, CP_FaceNPC(oPM2, oRodian1));
	
	DelayCommand(6.0, ActionResumeConversation());
}
