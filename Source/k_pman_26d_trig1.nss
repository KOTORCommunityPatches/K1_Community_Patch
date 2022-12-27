//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnEnter for man26ad_trig01.utt in manm26ad (Manaan Docking Bay).
	
	This is the trigger OnEnter that starts the scene of the Republic and Sith
	troops arguing the first time the player leaves the starting hangar after
	arriving on Manaan. It has been tweaked to jump the party into position
	for better framing during the scene.
	
	Issue #519: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/519
	
	DP 2022-12-27																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oSith = GetObjectByTag("man26_sitharg", 0);
	location lPC = Location(Vector(251.57,196.04,8.00), 95.91);
	location lPM1 = Location(Vector(250.73,194.43,8.00), 95.91);
	location lPM2 = Location(Vector(252.72,194.64,8.00), 95.91);
	
	if (IsObjectPartyMember(GetEnteringObject()) && CP_HasNeverTriggered())
		{
			SetGlobalFadeOut();
			
			NoClicksFor(2.5);
			
			SetPartyLeader(NPC_PLAYER);
			
			CP_PartyJump(oPC, lPC);
			CP_PartyJump(oPM1, lPM1);
			CP_PartyJump(oPM2, lPM2);
			
			DelayCommand(0.5, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1)));
			DelayCommand(0.5, AssignCommand(oPM1, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1)));
			DelayCommand(0.5, AssignCommand(oPM2, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1)));
			
			DelayCommand(1.0, SetGlobalFadeIn(0.5, 1.0));
			
			DelayCommand(1.25, AssignCommand(oSith, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
		}
}
