//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk41_ithor01.dlg in unk_m41aa (Lehon Central Beach).
	
	This script fires on the exit node. Originally it destroyed the Duros, but
	that has been moved into k_punk_ith05. Now it just handles the post-convo
	fade-in.
	
	See also k_punk_ith03, k_punk_ith05, k_punk_41aa_def.
	
	Issue #285: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/285
	
	DP 2019-10-02																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	SetGlobalFadeIn(0.0, 2.0);
}
