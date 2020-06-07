//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by missdoor_dlg.dlg in tar_m05aa (Taris Lower Sewers)
	
	This script has Mission face the door (since she faces the player on the
	previous node) and "unlock" it. The vanilla script only ran the open command
	on the door (twice, for some reason, followed by a third time in a subsequent
	script). Now she gets an animation to show she is fiddling with it.
	
	See also cp_tar05_misswlk, k_ptar_addzaal, k_ptar_destzaal, k_ptar_trigdoor,
	k_ptar_zaalrun.
	
	Issue #65: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/65
	
	DP 2020-06-08																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oMission = GetObjectByTag("mission", 0);
	object oDoor = GetObjectByTag("ptar_missdoor0", 0);
	
	ActionPauseConversation();
	
	AssignCommand(oMission, ActionDoCommand(SetFacing(180.0)));
	// Fire an animation to force the facing to take effect.
	AssignCommand(oMission, ActionPlayAnimation(ANIMATION_FIREFORGET_USE_COMPUTER));

	DelayCommand(5.5, ActionUnlockObject(oDoor));
	DelayCommand(5.5, AssignCommand(oDoor, ActionOpenDoor(oDoor)));
	
	DelayCommand(6.0, ActionResumeConversation());
}
