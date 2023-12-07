//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by k_sta_darthmalak.dlg in sta_m45ac (Star Forge Deck 3/Command Center).
	
	This script fires on the opening node of the scene where the player confronts
	Malak at the end of Deck 3. His two Jedi captives are both supposed to be
	in a permanent choke, but occasionally one may fail to play the animation. To
	try and prevent that, they're now both given a ClearAllActions first. Also
	removed an unnecessary jump for PM1, since the player has no companions for
	the remainder of the game at this point.
	
	See also k_psta_genstart.
	
	Issue #173: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/173
	
	DP 2023-12-07																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void CP_Choke() {
	ClearAllActions();
	DelayCommand(0.1, ActionPlayAnimation(ANIMATION_LOOPING_CHOKE, 1.0, 999.0));
}

void main() {
	
	object oPC = GetFirstPC();
	object oDoor = GetObjectByTag("k45_door_malak", 0);
	object oJedi1 = GetObjectByTag("sta_jedivic1", 0);
	object oJedi2 = GetObjectByTag("sta_jedivic2", 0);
	object oWP = GetWaypointByTag("STA_JUMP0_WP");
	
	ActionPauseConversation();
	
	CP_PartyJumpObject(oPC, oWP);
	
	AssignCommand(oJedi1, CP_Choke());
	AssignCommand(oJedi2, CP_Choke());
	
	DelayCommand(0.2, AssignCommand(oDoor, ActionOpenDoor(oDoor)));
	
	ActionWait(1.9);
	ActionResumeConversation();
}
