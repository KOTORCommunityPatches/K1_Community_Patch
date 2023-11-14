//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar02_bastvision.dlg in tar_m02af (Taris Upper City Hideout).
	
	This script fires on the opening node of Bastila's conversation with the PC
	after the initial reunion scene with Carth, post-swoop race. Since the movie
	of the Bastila vs Revan fight now plays between these two conversations, the
	PC is given the horror animation on this first node to indicate that they are
	seeing it in their head.
	
	See also k_con_bastcon, k_ptar_bastpart.
	
	Issue #603: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/603
	
	DP 2023-11-14																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	
	AssignCommand(oPC, ClearAllActions());
	AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_HORROR, 1.0, 3.25));
}
