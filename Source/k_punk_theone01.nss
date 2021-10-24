//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk43_theone.dlg in unk_m43aa (Lehon The One's Settlement).
	
	This script fires on the opening node of the cutscene that plays the first
	time the player meets The One, showing the party and The One walking toward
	one another in the arena section of his compound. In conjunction with the
	trigger OnEnter script that initiates this cutscene, the party's destination
	positions have been tweaked slightly to avoid pathfinding and player-following
	behaviour issues with the party members.
	
	See also k_punk_onespk_en.
	
	Issue #477: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/477
	
	DP 2021-10-24																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	location lPC = Location(Vector(35.55,136.79,40.68), 180.00);
	location lPM1 = Location(Vector(38.25,135.14,40.68), 180.00);
	location lPM2 = Location(Vector(38.27,138.64,40.68), 180.00);
	
	ActionPauseConversation();
	
	ActionMoveToObject(GetObjectByTag("onemove", 0), FALSE, 0.2);
	
	CP_PartyHerder(lPC, lPM1, lPM2, FALSE, FALSE);
	
	AssignCommand(GetObjectByTag("unk43_blk1", 0), ActionMoveToObject(GetObjectByTag("blk1move", 0), FALSE, 0.2));
	AssignCommand(GetObjectByTag("unk43_blk2", 0), ActionMoveToObject(GetObjectByTag("blk2move", 0), FALSE, 0.2));
	
	ActionWait(2.0);
	ActionResumeConversation();
}
