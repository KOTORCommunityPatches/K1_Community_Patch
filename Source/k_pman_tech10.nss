//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Firec by man26_reptech.dlg in manm26ae (Manaan East Central).
	
	This is the script that fires on the first node of the Republic tech's DLG,
	when opening his room for the first time. It walks him from the far corner
	towards the player. However, he doesn't face the player until the next node,
	leaving him facing off to the side when he reaches his waypoint. This edit
	simply adds a facing command to his action stack so that he will face the
	player as soon as he hits his mark.
	
	See also cp_man26_tech_d.
	
	Issue #273: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/273
	
	DP 2019-10-03																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void main() {
	
	UT_SetTalkedToBooleanFlag(OBJECT_SELF, TRUE);
	
	ActionPauseConversation();
	
	ActionMoveToObject(GetObjectByTag("wp_man26_tech", 0));
	ActionDoCommand(SetFacing(DIRECTION_WEST));
	
	ActionResumeConversation();
}
