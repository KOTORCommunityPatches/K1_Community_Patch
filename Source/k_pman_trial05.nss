////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man26_trial.dlg in manm26aa (Manaan Ahto West).
	
	This script fires during Sunry's trial cutscene when he is found guilty. It
	walks him and his Selkath guard out of the courtroom. It has been edited to
	add a delay to the guard so that he doesn't run into pathing issues due to
	being too close to Sunry.
	
	See also k_pman_26a_aread, k_pman_murder81, k_pman_wit02.
	
	Issue #136: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/136
	
	DP 2023-11-20																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oSunry = GetObjectByTag("man26_sunry", 0);
	object oElora = GetObjectByTag("man26_elora", 0);
	object oGuard = GetObjectByTag("man26_selguard", 0);
	object oWP_Elora = GetObjectByTag("man26a_eloraleave", 0);
	object oWP_Sunry = GetObjectByTag("man26a_sunryleave", 0);
	object oDoor = GetObjectByTag("man26aa_door04", 0);
	
	AssignCommand(oDoor, ActionOpenDoor(oDoor));
	
	AssignCommand(oSunry, ActionForceMoveToObject(oWP_Sunry));
	DelayCommand(1.0, AssignCommand(oGuard, ActionForceMoveToObject(oWP_Elora)));
	
	ActionPauseConversation();
	ActionWait(5.0);
	ActionResumeConversation();
}
