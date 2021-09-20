//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar04_mission.dlg in tar_m04aa (Taris Undercity).
	
	This script fires on the first node of scene where Mission meets the party
	in the Undercity. Originally she was instructed to run to the player, which
	resulted in her getting right up the player's grill. Now she runs to a spot
	a few metres away, respecting social distancing during the Rakghoul pandemic.
	
	See also cp_tar04_miskill, k_ptar_desmis, k_ptar_miscrt_en, k_ptar_misrun.
	
	Issue #472: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/472
	
	DP 2021-09-20																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void main() {
	
	location lMissRun = Location(Vector(256.90,216.71,3.00), 229.19);
	
	UT_SetTalkedToBooleanFlag(OBJECT_SELF, TRUE);
	
	ActionPauseConversation();
	
	ActionMoveToLocation(lMissRun, TRUE);
	
	DelayCommand(5.0, ActionResumeConversation());
}
