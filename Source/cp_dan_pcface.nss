//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by dan13_zhar.dlg in danm13 (Dantooine Jedi Enclave).
	
	This is an added script to reface the player off-screen during one of Bastila's
	lines in the first conversation with the Council.
	
	Updated 2022-08-04 to completely replace the script's original functionality,
	since that failed to work as intended. Now the player's facing is locked
	during an earlier node, with this script unlocking their facing again once
	Bastila's interjection has happened.
	
	See also k_pdan_zhar07.
	
	Issue #151: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/151
	
	DP 2019-11-07 / DP 2022-08-04												*/
//////////////////////////////////////////////////////////////////////////////////

void main() {

	object oPC = GetFirstPC();
	
	SetLockOrientationInDialog(oPC, FALSE);
}
