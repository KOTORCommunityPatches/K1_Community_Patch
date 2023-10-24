//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnEnter for man27aa_init01.utt in manm27aa (Manaan Sith Base).
	
	This is the trigger OnEnter that initiates the scene with Shasa and her fellow
	Selkath Sith apprentices. It has been altered to jump the party into positions
	that leave enough room for the Selkath to pathfind past when they exit in the
	LS resolution of the conversation.
	
	See also cp_man27aa_shajp, k_pman_shasa04.
	
	Issue #141: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/141
	
	DP 2023-10-24																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"
 
 void main() {
 	
	location lPC = Location(Vector(234.13,32.49,0.00), 30.00);
	location lPM1 = Location(Vector(233.95,34.49,0.00), -40.00);
	location lPM2 = Location(Vector(232.31,33.35,0.00), -10.00);
	
	if (IsObjectPartyMember(GetEnteringObject()) && CP_HasNeverTriggered() && GetGlobalNumber("MAN_MISSING_PLOT") < 2)
		{
			SetGlobalFadeOut();
			DelayCommand(1.0, SetGlobalFadeIn(0.0, 1.0));
			
			NoClicksFor(2.0);
			
			SetPartyLeader(NPC_PLAYER);
			
			CP_PartyHerder(lPC, lPM1, lPM2);
			
			DelayCommand(0.9, AssignCommand(GetObjectByTag("man27_shasa"), ActionStartConversation(GetFirstPC(), "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
		}
 }
