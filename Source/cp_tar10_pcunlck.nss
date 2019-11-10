//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar10_kandon01.dlg in tar_m10ac (Taris Black Vulkar Base Garage).
	
	This script unlocks the player's facing at the end of the conversation,
	either before jumping outside if siding with the Vulkars, or turning Kandon
	hostile is siding with the Beks.
	
	See also cp_tar10_pclock.
	
	Issue #241: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/241
	
	DP 2019-11-11																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {

	object oPC = GetFirstPC();
	
	NoClicksFor(1.0);
	
	SetLockOrientationInDialog(oPC, FALSE);
}
