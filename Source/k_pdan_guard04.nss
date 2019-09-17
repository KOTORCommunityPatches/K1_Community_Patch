////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by dan15_ancientdrd.dlg in danm15 (Dantooine Ruins).
	
	This script fires on exiting the overseer droid's DLG. The vanilla version
	only toggles Bastila's AI back on (since they turned it off at the start
	of the initial conversation for some reason), but with the addition of
	locked facing during that sequence, this script was edited to also disable
	the orientation locking once the conversation is done.
	
	See also k_pdan_guard03.
	
	Issue #105: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/105
	
	Issue #152: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/152
	
	DP 2019-07-31                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
    
	object oPC = GetFirstPC();
	object oBast = GetObjectByTag("bastila", 0);
	
	SetLockOrientationInDialog(oPC, FALSE);
	SetLockOrientationInDialog(oBast, FALSE);
	
	ExecuteScript("k_pman_aion", oBast, -1);
}
