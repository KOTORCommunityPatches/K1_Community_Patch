////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by dan26aa_init08.utt in manm26aa (Manaan Ahto West).
	
	This is a conversation trigger for Nilko Bwaas, although in the vanilla game
	it only results in a one line "come talk to me" kind of thing, requiring the
	player to manually re-initiate the conversation after that. Since there are
	the usual facing and positioning issues in the conversation proper, we are
	hijacking this trigger to skip right past that and start straight into the
	full conversation, allowing for a party jump under the fade-out.
	
	Updated 2023-12-08 to rejig the conversation initialisation to ensure that it
	starts before the fade-in.
	
	Updated 2023-12-20 to disable Nilko's ambient animations to really ensure that
	the conversation starts before the fade-in. Also toggle off the party member
	AI for the jump for good measure.
	
	Issue #272: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/272
	
	DP 2019-10-01 / DP 2023-12-08 / DP 2023-12-20								*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oEntering = GetEnteringObject();
	object oNilko = GetObjectByTag("man26_nilko");
	location lPC = Location(Vector(-25.0,29.183,59.158), 180.0);
	location lPM1 = Location(Vector(-22.5,30.683,59.158), 180.0);
	location lPM2 = Location(Vector(-22.5,27.682,59.158), 180.0);
	
	if (GetIsPC(oEntering) && CP_HasNeverTriggered())
		{
			SetGlobalFadeOut();
			DelayCommand(1.5, SetGlobalFadeIn(0.1, 1.0));
			
			NoClicksFor(1.5);
			
			SetPartyLeader(NPC_PLAYER);
			
			// In order to skip the "I wish to speak to you" bit, set the Talked To
			// flag on Nilko first so he will jump straight into the main convo
			UT_SetTalkedToBooleanFlag(oNilko);
			
			// Disable his ambient anims temporarily.
			CP_ToggleAmbientAnims(oNilko);
			
			CP_ToggleAI(oPM1);
			CP_ToggleAI(oPM2);
			
			DelayCommand(0.1, CP_PartyHerder(lPC, lPM1, lPM2));
			
			DelayCommand(0.6, CP_FaceNPC(oNilko, oPC));
			DelayCommand(1.0, AssignCommand(oNilko, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
		}
}
