////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kor38b_jorakuln.dlg in korr_m38ab (Korriban Tomb of Tulak Hord).
	
	This script replaces the bow animation specified in the DLG to more suitably
	fire it in accordance with his line of dialogue (on the end "welcome") rather
	than right at the start.
	
	See also cp_k38_slander, k_pkor_animstun, k_pkor_forceslep, k_pkor_gaschoke,
	k_pkor_gasfall, k_pkor_jorakmove, k_pkor_jorstunmu, k38b_init_jorak,
	k38b_init_jorak1, k38b_jor_gastrap, k38b_jor_givetab, k38b_jor_hostile,
	k38b_jor_riddlen, and k38b_jor_riddley.
	
	Issue #165: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/165
	
	DP 2019-07-28                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {

	ActionPauseConversation();
	
	DelayCommand(7.3, ActionPlayAnimation(ANIMATION_FIREFORGET_BOW));
	
	DelayCommand(9.5, ActionResumeConversation());
}
