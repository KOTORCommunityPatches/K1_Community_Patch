//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk44_sithmast.dlg in unk_m44aa (Unknown World Temple Main Floor).
	
	This script fires on the first node of the Sith Master scene. The fade-in has
	been slightly altered to better mask the party jump when the scene is triggered.
	
	Updated 2022-10-05 to remove the saber blade overrides and further adjust the
	fade-in, in combination with DLG camera tweaks. Also corrected the constant used
	for SetNPCAIStyle (no material change to the compiled script for this, since
	the integer remains the same).
	
	See also cp_unk44_mastend, k_punk_master02, k_punk_masktk_en.
	
	Issue #325: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/325
	
	DP 2019-11-12 / DP 2022-10-05												*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	ActionPauseConversation();
	
	SetNPCAIStyle(OBJECT_SELF, NPC_AISTYLE_MELEE_ATTACK);
	
	DelayCommand(1.0, SetGlobalFadeIn(0.0, 0.5));
	
	DelayCommand(1.5, ActionResumeConversation());
}
