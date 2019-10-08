//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by end_cut01.dlg in end_m01aa (Endar Spire Command Module).
	
	This is the script that fires on the first node of the DLG for the Darth Bandon
	confrontation/Trask's sacrifice cutscene. Since the door is now set to start
	off locked, the script has been changed to unlock and open it. This is so that
	it doesn't happen off-screen earlier under the fade-out. This script originally
	jumped the player and Trask into position, but that has been moved to the door
	script that triggers the scene. Instead, the player and Trask are given some
	facing commands in conjunction with a speaker tag change to the DLG, and the
	player is given an animation to have them look at Trask.
	
	See also k_pend_cut02, k_pend_cut14, k_pend_cut23, k_pend_traskdie1.
	
	Issue #230: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/230
	
	DP 2019-10-08																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oTrask = GetObjectByTag("end_trask");
	object oDoor = GetObjectByTag("end_door19", 0);
	
	SetGlobalFadeIn(0.5, 0.0);
	
	ActionPauseConversation();
	
	// Since we now start the door off locked, unlock it
	// and open it for the first shot of the scene.
	SetLocked(oDoor, FALSE);
	AssignCommand(oDoor, ActionOpenDoor(oDoor));
	
	AssignCommand(oTrask, SetFacing(DIRECTION_SOUTH));
	
	// Make the player look at Trask rather than staring blankly straight ahead.
	AssignCommand(oPC, ClearAllActions());
	AssignCommand(oPC, ActionDoCommand(SetFacing(DIRECTION_SOUTH)));
	AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_LEFT));
	
	ActionDoCommand(SignalEvent(oTrask, EventUserDefined(400)));
}
