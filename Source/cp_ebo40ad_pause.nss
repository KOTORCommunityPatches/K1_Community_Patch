//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by ebo_carth.dlg in ebo_m40ad (Ebon Hawk Post-Leviathan).
	
	This is an added script for the post-Leviathan escape scene that fires on the
	second new entry in the added starting branch, where the entire party play
	animations in order to force the hide weapons/masks flags to apply. 
	
	See also cp_ebo40ad_endcs, cp_ebo40ad_false, cp_lev_awarefix, k_pebo_carthtlk.
	
	Issue #527: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/527
	
	DP 2021-12-10																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	ActionPauseConversation();
	
	SetGlobalFadeOut();
	
	NoClicksFor(2.0);
	
	SetLocalBoolean(OBJECT_SELF, 10, TRUE);
	
	SetGlobalFadeIn(0.75, 1.0);
	
	DelayCommand(0.5, ActionResumeConversation());
}
