////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by m28ab_c01.dlg in manm28ab (Manaan Sea Floor).
	
	A simple delay script in order to pace the DLG progression according to the
	timing of the stunt animations for the scene.
	
	See also cp_m28ab_cut001w, cp_m28ab_cut002w, cp_m28ab_cut003w, cp_m28ab_cut005w,
	k_pman_cutscene1
	
	Issue #143: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/143
	
	DP 2019-05-17                                                             */
////////////////////////////////////////////////////////////////////////////////

void main()
{
   ActionPauseConversation();
   DelayCommand(0.666667, ActionResumeConversation());
}
