////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar11_zaerdra111.dlg in tar_m11aa (Taris Hidden Bek Base).

	This script fires on the first node of Zaerdra's DLG in the Bek base.
	It switches the facing of the PC, but the first node already had a
	script for setting her Talked To flag, so that had to be merged into
	a single script.
	
	See also cp_tar11_pcfce2.
	
	Issue #70: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/70

	DP 2019-09-28                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void main() {
	
	object oPC = GetFirstPC();
	object oGadon = GetObjectByTag("GadonThek112", 0);
	
	UT_SetTalkedToBooleanFlag(OBJECT_SELF);
	
	AssignCommand(oPC, ActionDoCommand(SetCommandable(TRUE, oPC)));
	AssignCommand(oPC, ClearAllActions());
	AssignCommand(oPC, ActionDoCommand(SetFacingPoint(GetPosition(oGadon))));
	AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_LISTEN, 1.0, 3.0));
}
