//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by ebo_carth.dlg in ebo_m40ad (Ebon Hawk Post-Leviathan).
	
	This is the exit node script for the post-Leviathan escape scene. It replaces
	the original, k_ebo_gohawk, to avoid potential filename clashes in the future.
	It clears off the True Seeing effect on Carth and the player, if that is still
	active.
	
	See also cp_ebo40ad_false, cp_ebo40ad_pause, cp_lev_awarefix, k_pebo_carthtlk.
	
	Issue #527: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/527
	
	DP 2021-12-10																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	// Clear True Seeing, if it is still active.
	AssignCommand(GetObjectByTag("carth", 0), ClearAllEffects());
	AssignCommand(GetFirstPC(), ClearAllEffects());
	
	DelayCommand(0.1, ExecuteScript("k_ren_leavlev", OBJECT_SELF));
}
