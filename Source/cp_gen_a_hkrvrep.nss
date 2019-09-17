////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by k_hhkd_dialog.dlg on Entry 225.
	
	This script sets a local boolean the first time the player asks HK about
	restoring his memory post-Leviathan and is told there is nothing more to
	restore. Previously this could be asked repeatedly, so the boolean check
	has been added to the starting conditional for the node. 
	
	See also k_swg_hk4702.
	
	Issue #175: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/175
	
	DP 2019-06-26                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {

	object oHK = GetObjectByTag("HK47", 0);
	
	SetLocalBoolean(oHK, 54, TRUE);
}
