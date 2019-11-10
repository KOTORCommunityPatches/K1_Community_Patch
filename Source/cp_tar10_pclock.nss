//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar10_kandon01.dlg in tar_m10ac (Taris Black Vulkar Base Garage).
	
	This script locks the player's facing at the start of the conversation to
	avoid them turning to face Mission or Carth on their interjections.
	
	See also cp_tar10_pcunlck.
	
	Issue #241: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/241
	
	DP 2019-11-11																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {

	object oPC = GetFirstPC();
	
	NoClicksFor(2.0);
	
	SetLockOrientationInDialog(oPC, TRUE);
}
