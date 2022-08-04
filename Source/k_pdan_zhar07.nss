//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by dan13_zhar.dlg in danm13 (Dantooine Jedi Enclave).
	
	This script fires during Zhar's introduction in the player's first meeting
	with the Council after arriving from Taris. It locks the player's orientation
	to prevent some facing issues with one of Bastila's interjections.
	
	See also cp_dan_pcface.
	
	Issue #151: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/151
	
	DP 2022-08-04																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oZhar = GetObjectByTag("dan13_zhar", 0);
	
	ActionPauseConversation();
	
	CP_FaceNPC(oPC, oZhar);
	
	DelayCommand(1.0, SetLockOrientationInDialog(oPC, TRUE));
	
	ActionWait(11.0);
	ActionResumeConversation();
	
	DelayCommand(1.5, SetDialogPlaceableCamera(8));
	DelayCommand(3.0, SetDialogPlaceableCamera(11));
	DelayCommand(7.0, SetDialogPlaceableCamera(2));
}
