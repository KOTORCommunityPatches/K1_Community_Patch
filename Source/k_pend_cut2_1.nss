//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by end_room5.dlg in end_m01aa (Endar Spire Command Module).
	
	This script is fired during the third cutscene of Republic and Sith troopers
	fighting each other. The Republic soldier that is killed by the exploding
	barrel originally died in the shot this script fires on, but that has now been
	changed to have him die in the previous entry, so those commands have been
	removed. The rest of the commands remain the same as the vanilla script.
	
	See also k_pend_explosion.
	
	Issue #490: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/490
	
	DP 2023-12-10																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oSith3 = GetObjectByTag("end_cut2_sith3", 0);
	object oSith5 = GetObjectByTag("end_cut2_sith5", 0);
	object oRepSol = GetObjectByTag("end_cut2_soldier4", 0);
	
	ActionPauseConversation();
	
	SetMinOneHP(oRepSol, FALSE);
	
	DelayCommand(0.1, AssignCommand(oSith3, CutsceneAttack(oRepSol, 156, ATTACK_RESULT_HIT_SUCCESSFUL, 140)));
}
