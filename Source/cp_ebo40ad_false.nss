//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by ebo_carth.dlg in ebo_m40ad (Ebon Hawk Post-Leviathan).
	
	This is an added starting conditional for the post-Leviathan escape scene that
	closes off the original starting nodes in order run some forced animations for
	the entire party under the initial fade-out.
	
	See also cp_ebo40ad_endcs, cp_ebo40ad_pause, cp_lev_awarefix, k_pebo_carthtlk.
	
	Issue #527: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/527
	
	DP 2021-12-10																*/
//////////////////////////////////////////////////////////////////////////////////

int StartingConditional() {
	
	return FALSE;
}
