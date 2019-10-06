//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tat20_09chief_01.dlg in tat_m20aa (Tatooine Sand People Enclave).
	
	This fires on the starting node of every branch of the Chieftain's DLG, jumping
	the party into place. This has been tweaked to use better positioning for the
	party, give the Chieftain a facing towards the player, and hide it all under
	a fade-out.
	
	See also k_ptat_takevapor.
	
	Issue #293: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/293
	
	DP 2019-10-06																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = CP_GetPartyMember(0);
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oChief = GetObjectByTag("tat20_09chief_01", 0);
	location lPC = Location(Vector(13.89,61.952,14.576), 45.0);
	location lPM1 = Location(Vector(13.173,59.113,14.55), 45.0);
	location lPM2 = Location(Vector(11.051,61.235,14.6), 45.0);
	
	SetPartyLeader(NPC_PLAYER);
	
	NoClicksFor(2.0);
	
	SetGlobalFadeOut();
	SetGlobalFadeIn(0.6, 1.5);
	
	CP_DLGHerder(lPC, lPM1, lPM2);
	
	ClearAllActions();
	ActionDoCommand(SetFacing(235.0));
	ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_LEFT);
}
