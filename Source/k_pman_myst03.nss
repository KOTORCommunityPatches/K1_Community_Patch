////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man26_mman.dlg in manm26ae (Manaan East Central).
	
	This script is fired on the last entry of the conversation with the Mysterious
	Man. In order to fix an issue with his selection icon being visible after the
	conversation finishes, he is now jumped across the module during a fade out
	on the previous entry. This script has thus been reduced to doing a fade in
	and destroying him. 
	
	See also k_pman_myst02.
	
	Issue #138: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/138
	
	DP 2019-06-28                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	SetGlobalFadeIn(0.0, 1.0);
	DelayCommand(0.1, ActionDoCommand(DestroyObject(OBJECT_SELF,0.0,TRUE)));
}
