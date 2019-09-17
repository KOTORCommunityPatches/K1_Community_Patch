////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by kor33_lashowe.dlg in korr_m33aa (Korriban Dreshdae)
	
	This script fires just prior to the of the convo to walk Lashowe and her
	mooks out. The vanilla script has been cleaned up, removing a few unused
	object statements, and the timings have been added to fade out before
	they walk directly into the camera.
	
	See also k_pkor_lashturn1, k_pkor_lashturn2, cp_kor33_fcelash, and k33_las_initconv.
	
	Issue #160: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/160
	
	DP 2019-08-09                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oMook1 = GetObjectByTag("kor33_lasfriend1", 0);
	object oMook2 = GetObjectByTag("kor33_lasfriend2", 0);
	object oWP_Lash = GetObjectByTag("k33a_way_lashowe", 0);
	object oWP_Mook1 = GetObjectByTag("k33a_way_lashhn2", 0);
	object oWP_Mook2 = GetObjectByTag("k33a_way_lashhn1", 0);
	
	SetGlobalFadeOut(2.5, 2.0);
	
	ActionPauseConversation();
	
	AssignCommand(oMook1, ActionMoveToObject(oWP_Mook1));
	DelayCommand(0.5, ActionMoveToObject(oWP_Lash));
	DelayCommand(1.1, AssignCommand(oMook2, ActionMoveToObject(oWP_Mook2)));
	DelayCommand(4.9, ClearAllActions());
	
	DelayCommand(5.0, ActionResumeConversation());
}
