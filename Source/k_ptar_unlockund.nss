//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar03_sithpat31.dlg in tar_m03aa (Taris Lower City).
	
	This is the script that fires on an exit node of the conversation with the
	Sith guard outside the locked door to the Undercity elevator. It unlocks the
	door after the player has presented the papers obtained from the Beks. The
	original script used ActionUnlockObject, but seemingly this no longer works
	with the UTD changes to swap to using a key, necessitating a change to
	SetLocked instead.
	
	Issue #396: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/396
	
	DP 2021-11-28																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oDoor = GetObjectByTag("tar03_underdoor", 0);
	
	SetLocked(oDoor, FALSE);
}
