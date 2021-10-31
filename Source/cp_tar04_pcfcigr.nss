////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar04_igear.dlg in tar_m04aa (Taris Undercity).

	This is an added script that reorients the player to face Igear properly
	after one of Carth's interjections.
	
	See also k_ptar_movespeak.
	
	Issue #482: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/482

	DP 2019-10-31                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oIgear = GetObjectByTag("igear", 0);
	
	AssignCommand(oPC, SetFacingPoint(GetPosition(oIgear)));
	AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_LISTEN, 1.0, 1.0));
}
