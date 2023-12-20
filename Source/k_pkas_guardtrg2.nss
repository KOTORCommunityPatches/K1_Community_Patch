//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnEnter for kas22_guardtrig2.utt in kas_m22ab (Kashyyyk The Great Walkway).

	This is the trigger OnEnter that starts the scene with the Wookiee guard
	outside the entrance to Rwookrrorro village. It has been altered to jump
	the party, since otherwise Zaalbar's interjections (if present) can cause
	camera angle issues as well as skating as he tries to walk up to the PC,
	especially if skipping through the guard's lines.
	
	Issue #741: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/741

	DP 2023-12-20																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oEntering = GetEnteringObject();
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oGuard = GetObjectByTag("kas22_wookg2_01");
	location lPC = Location(Vector(223.07,315.97,19.77), -35.00);
	location lPM1 = Location(Vector(222.58,317.54,19.77), -50.00);
	location lPM2 = Location(Vector(221.43,315.90,19.77), -20.00);
	
	if (GetIsPC(oEntering) && CP_HasNeverTriggered())
		{
			SetGlobalFadeOut();
			SetGlobalFadeIn(0.6, 1.0);
			
			NoClicksFor(2.0);
			
			SetPartyLeader(NPC_PLAYER);
			
			CP_ToggleAI(oPM1);
			CP_ToggleAI(oPM2);
			DelayCommand(0.1, CP_PartyHerder(lPC, lPM1, lPM2));
			
			DelayCommand(0.3, AssignCommand(oGuard, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
			
			// Allow enough time for the party member's AI to be toggled back on (1 sec) before the script owner is destroyed.
			DelayCommand(1.5, DestroyObject(OBJECT_SELF));
		}
}
