//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by tar04_republicso.dlg in tar_m04aa (Taris Undercity).
	
	This script fires on the first node of the conversation with the infected
	Republic soldier opposite the Outcast Village. The vanilla script just jumps
	the party into position. Now the soldier gets a forced injured animation as
	well, since previously the one fired by his OnHeartbeat event would be
	overridden by the scene. Now he will continue to play the anim until he is
	given the serum or transforms into a Rakghoul. The party has also been given
	a facing command to make sure they don't blankly stare off in a random direction.
	
	See also k_ptar_reprun, k_ptar_repserum, k_ptar_repsoldie.
	
	Issue #666: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/666
	
	DP 2023-07-25																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oRepSol = GetObjectByTag("REPUBLICSO", 0);
	object oWP_PC = GetObjectByTag("tar_pc0_jump_wp", 0);
	object oWP_PM1 = GetObjectByTag("tar_pc1_jump_wp", 0);
	object oWP_PM2 = GetObjectByTag("tar_pc2_jump_wp", 0);
	
	NoClicksFor(10.65);
	
	SetPartyLeader(NPC_PLAYER);
	
	AssignCommand(oRepSol, PlayAnimation(ANIMATION_LOOPING_TALK_INJURED, 1.0, 100.0));
	
	DelayCommand(0.2, UT_TeleportWholeParty(oWP_PC, oWP_PM1, oWP_PM2));
	
	DelayCommand(0.3, CP_FaceNPC(oPC, oRepSol));
	DelayCommand(0.3, CP_FaceNPC(oPM1, oRepSol));
	DelayCommand(0.3, CP_FaceNPC(oPM2, oRepSol));
}
