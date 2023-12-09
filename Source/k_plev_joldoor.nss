//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by lev40_jolee.dlg in lev_m40aa (Leviathan Prison Block).
	
	This is script fires during Jolee's scene when he is the chosen jail breaker
	on the Leviathan, walking the guard into the cell and closing the forcefield
	behind him. It now walks Jolee up to the forcefield beforehand, since he was
	otherwise refusing facing commands.
	
	See also cp_levaa_joldoor, k_plev_joleeesc.
	
	Issue #145: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/145
	
	DP 2023-12-09																*/
//////////////////////////////////////////////////////////////////////////////////

void MoveGuard() {
	ClearAllActions();
	ActionMoveToObject(GetObjectByTag("lev40_wpescape3", 0));
	ActionDoCommand(SetFacingPoint(GetPosition(GetObjectByTag("lev40_wpjoleeout", 0))));
}

void main() {
	
	object oJolee = GetFirstPC();
	object oDoor = GetNearestObjectByTag("lev40_cell08", oJolee, 1);
	object oGuard = GetObjectByTag("levguard403", 0);
	
	ActionPauseConversation();
	
	AssignCommand(oGuard, MoveGuard());
	
	DelayCommand(0.5, AssignCommand(oJolee, ClearAllActions()));
	DelayCommand(3.0, AssignCommand(oJolee, ActionMoveToObject(oDoor)));
	
	DelayCommand(4.0, AssignCommand(oDoor, ActionCloseDoor(oDoor)));
	
	ActionWait(7.0);
	ActionResumeConversation();
}
