////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar11_zaerdra111.dlg and tar11_gadon112.dlg in tar_m11aa
	(Taris Hidden Bek Base).

	This script reorients the PC to face Gadon. It's used in both the initial
	Zaerdra conversation, and the main Gadon one.
	
	See also cp_tar11_pcfce1.
	
	Issue #70: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/70

	DP 2019-09-28                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oGadon = GetObjectByTag("GadonThek112", 0);
	
	AssignCommand(oPC, ActionDoCommand(SetCommandable(TRUE, oPC)));
	AssignCommand(oPC, ClearAllActions());
	AssignCommand(oPC, ActionDoCommand(SetFacingPoint(GetPosition(oGadon))));
	AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_LISTEN, 1.0, 3.0));
}
