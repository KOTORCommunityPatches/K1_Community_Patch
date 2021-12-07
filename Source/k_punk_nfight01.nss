//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by newfight.dlg in unk_m41aa (Lehon Central Beach).
	
	This is the script on the first node of the cutscene where the party encounters
	Rakata when exiting the Ebon Hawk the first time. It moves the party further up
	the beach. The vanilla waypoints left the PC far ahead of the other two party
	members and out of shot, so the party has been wrangled into better positions.
	
	Updated 2021-12-07 to remove Force Speed from the party in order not to mess
	up the shot timings and reduced the shot length.
	
	See also k_punk_nfight05, k_punk_nfight06.
	
	Issue #168: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/168
	
	DP 2021-11-16																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = GetPartyMemberByIndex(1);
	object oPM2 = GetPartyMemberByIndex(2);
	location lPC = Location(Vector(106.34,144.80,23.72), 11.25);
	location lPM1 = Location(Vector(104.77,142.45,23.61), 11.25);
	location lPM2 = Location(Vector(103.99,146.38,23.41), 11.25);
	
	ActionPauseConversation();
	
	SetGlobalFadeIn(0.0, 0.75);
	
	NoClicksFor(3.0);
	
	// Strip off Force Speed.
	AssignCommand(oPC, ClearAllEffects());
	AssignCommand(oPM1, ClearAllEffects());
	AssignCommand(oPM2, ClearAllEffects());
	
	CP_PartyMove(oPC, lPC);
	CP_PartyMove(oPM1, lPM1);
	CP_PartyMove(oPM2, lPM2);
	
	ActionWait(3.0);
	ActionResumeConversation();
}
