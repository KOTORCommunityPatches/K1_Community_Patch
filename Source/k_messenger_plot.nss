//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Global messenger setup script.
	
	This is the generic script that fires at the start of all messenger scenes
	that herds the party and the messenger. It has been hijacked to set a local
	boolean on the messenger for use in conjunction with K1CP's added include
	function CP_JumpMessenger that catches stranded messengers that spawned
	but did not initiate their conversation as intended. This seems to be a
	problem primarily on Dantooine, where they can end up inside the Aratech
	Mercantile room for some reason. This added boolean will prevent the
	include function from firing for successfully completed messenger convos.
	
	See also cp_inc_k1.
	
	Issue #262: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/262
	
	DP 2021-11-29																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void main() {
	
	object oWP0 = GetNearestObjectByTag("K_MESSENGER_SPAWN_PC0");
	object oWP1 = GetNearestObjectByTag("K_MESSENGER_SPAWN_PC1");
	object oWP2 = GetNearestObjectByTag("K_MESSENGER_SPAWN_PC2");

	ActionPauseConversation();
	
	// Jump the messenger to their start point.
	ActionJumpToLocation(GetLocation(GetObjectByTag("K_MESSENGER_SPAWN_2")));
	
	// Herd the party.
	UT_TeleportWholeParty(oWP0, oWP1, oWP2);
	
	// Walk the messenger to the party.
	ActionMoveToObject(GetObjectByTag("K_MESSENGER_SPAWN_PC0"), FALSE, 2.0);
	
	// Add a local boolean to the messenger to prevent CP_JumpMessenger firing.
	SetLocalBoolean(OBJECT_SELF, 50, TRUE);
	
	ActionResumeConversation();
}
