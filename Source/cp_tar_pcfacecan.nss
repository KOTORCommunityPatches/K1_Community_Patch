////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar03_cand031.dlg in tar_m02ae (Taris Upper City Cantina).

	This script is fired on Canderous' reply to the interjections from either
	Carth or Bastila, since their speaker tag will force the PC to face them
	and subsequently end up only half-facing Canderous on subsequent nodes.
	It simply reorients the PC to face Canderous, with a forced animation
	to ensure the rotation properly takes (creatures tend not to properly
	obey facing commands without a subsequent action).
	
	See also k_ptar_candtlk, k_ptar_spawncand.
	
	Issue #75: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/75

	DP 2019-09-28                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oCand = GetObjectByTag("Canderous031", 0);
	
	AssignCommand(oPC, ActionDoCommand(SetCommandable(TRUE, oPC)));
	AssignCommand(oPC, ClearAllActions());
	AssignCommand(oPC, ActionDoCommand(SetFacing(254.0)));
	AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_RIGHT));
}
