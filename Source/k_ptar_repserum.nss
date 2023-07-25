//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by tar04_republicso.dlg in tar_m04aa (Taris Undercity).
	
	This script is fired when the player gives the infected Republic soldier the
	Rakghoul serum. Due the arrangement of the commands in the vanilla script, the
	soldier would perform the inject animation before the player had walked up to
	him. This has now been fixed so that they occur in the correct sequence. The
	player will also perform an animation intended to represent handing the serum
	over (as much as can be done with the generic anims).
	
	See also k_ptar_reprun, k_ptar_repsoldie, tar_pc_jump.
	
	Issue #666: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/666
	
	DP 2023-07-25																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void main() {
	
	object oPC = GetFirstPC();
	object oRepSol = GetObjectByTag("REPUBLICSO", 0);
	
	UT_ActionPauseConversation(4.5);
	
	AssignCommand(oPC, ActionMoveToObject(oRepSol));
	AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0, 1.0));
	AssignCommand(oPC, ActionDoCommand(AssignCommand(oRepSol, PlayAnimation(ANIMATION_FIREFORGET_INJECT))));
}
