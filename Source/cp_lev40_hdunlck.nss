//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by lev40_saul402.dlg in lev_m40ad (Leviathan Bridge).
	
	This script is fired towards the end of the initial cutscene of the final
	showdown with Saul Karath. It unlocks Bastila and Carth's head orientation
	just before combat begins and points Bastila back to face Saul after her
	earlier interjection, during which she turns to face Carth.
	
	See also k_plev_brdgcs_en, k_plev_saulcs0.
	
	Issue #332: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/332
	
	DP 2020-09-12																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oBast = GetObjectByTag("Bastila", 0);
	object oCarth = GetObjectByTag("Carth", 0);
	
	AssignCommand(oBast, SetFacing(DIRECTION_EAST));
	
	SetLockHeadFollowInDialog(oBast, FALSE);
	SetLockHeadFollowInDialog(oCarth, FALSE);
}
