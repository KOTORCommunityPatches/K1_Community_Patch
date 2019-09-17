////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by k_hdustil_dialog.dlg in korr_m35aa (Korriban Sith Academy)
	
	This is the companion script to the one added to Dustil's DLG to force
	Carth (and the PC) to face him while speaking his lines. This one unlocks
	the PC so they can resume normal actions once the DLG ends.
	
	See also cp_k35_facedust.
	
	Issue #162: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/162
	
	DP 2019-07-14                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {

	object oPC = GetFirstPC();
	
	SetLockOrientationInDialog(oPC, FALSE);
}
