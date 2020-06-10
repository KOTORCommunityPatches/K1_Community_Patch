//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar05_ff_dlg2.dlg in tar_m05aa (Taris Lower Sewers)
	
	This script has Mission entering the codes into the terminal and then shuts
	down the forcefield with an added sound effect.
	
	See also cp_tar05_ffend, cp_tar05_ffopen, cp_tar05_ffstart, cp_tar05_ffwalk, k_ptar_startconv.
	
	Issue #66: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/66
	
	DP 2020-06-09																*/
////////////////////////////////////////////////////////////////////////////////// 

void main() {
	
	object oMission = GetObjectByTag("mission", 0);
	object oForcefield = GetObjectByTag("tar05_forcefield", 0);
	object oFFOff = GetObjectByTag("cp_forcefieldoff", 0);
	
	ActionPauseConversation();
	
	// Have Mission "enter" the codes to deactivate the forcefield.
	AssignCommand(oMission, SetFacing(135.0));
	AssignCommand(oMission, ActionPlayAnimation(ANIMATION_FIREFORGET_USE_COMPUTER));
	
	DelayCommand(5.0, AssignCommand(oForcefield, ActionOpenDoor(oForcefield)));
	DelayCommand(5.75, SoundObjectPlay(oFFOff));
	
	DelayCommand(9.0, ActionResumeConversation());
}
