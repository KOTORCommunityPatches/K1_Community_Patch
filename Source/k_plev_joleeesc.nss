//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by lev40_jolee.dlg in lev_m40aa (Leviathan Prison Block).
	
	This is script fires during Jolee's scene when he is the chosen jail breaker
	on the Leviathan, walking him out of his cell. The timings have been adjusted,
	and he's now given a facing and persuade animation which occur on the following
	entry, since the in-DLG anim doesn't work due to the conflict with his action
	stack.
	
	See also cp_levaa_joldoor, k_plev_joldoor.
	
	Issue #145: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/145
	
	DP 2023-12-09																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oJolee = GetFirstPC();
	object oGuard = GetObjectByTag("levguard403", 0);
	object oDoor = GetNearestObjectByTag("lev40_cell08", oJolee, 1);
	
	ActionPauseConversation();
	
	NoClicksFor(6.0);
	
	AssignCommand(oDoor, ActionOpenDoor(oDoor));
	
	AssignCommand(oJolee, ClearAllActions());
	DelayCommand(1.2, AssignCommand(oJolee, ActionMoveToObject(GetObjectByTag("lev40_wpjoleeout", 0))));
	DelayCommand(2.0, AssignCommand(oJolee, ActionDoCommand(SetFacingPoint(GetPosition(oGuard)))));
	DelayCommand(2.2, AssignCommand(oJolee, ActionPlayAnimation(ANIMATION_FIREFORGET_PERSUADE)));
	
	ActionWait(4.0);
	ActionResumeConversation();
}
