//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
    OnEnter for kas_xor_enc.utt in kas_m22aa (Kashyyyk Landing Pad), korr_m33aa
	(Korriban Dreshdae), manm26ad (Manaan Docking Bay), tat_m17ab (Tatooine
	Docking Bay).
	
    This is the trigger OnEnter that starts the final Xor encounter in all
	eligible landing bay modules. The original could spawn Xor without Juhani
	present which would then block further progress, since there is no DLG
	attached to Xor's UTC and his perception event that was intended to trigger
	the scene didn't work. The previous fix to this script was somewhat inadequate,
	since it didn't check that the entering object was valid. It's now changed
	so that it will only be triggered by PCs and only re-trigger a second time
	if Juhani is present.
	
	See also cp_xor_ptyjmpend, k_kas_xorthug_ud, k_kas_xor_user.
	
	Issue #397: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/397
	
	DP 2021-12-06																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void SpawnXor() {
	
	location lXor = GetLocation(GetObjectByTag("kas_xor1_spawn", 0));
	location lThugA = GetLocation(GetObjectByTag("kas_xor2_spawn", 0));
	location lThugB = GetLocation(GetObjectByTag("kas_xor3_spawn", 0));
	
	CreateObject(OBJECT_TYPE_CREATURE, "kas_xor1", lXor);
	CreateObject(OBJECT_TYPE_CREATURE, "kas_xor2", lThugA);
	CreateObject(OBJECT_TYPE_CREATURE, "kas_xor3", lThugB);
}

void main() {
	
	object oTalker = GetObjectByTag("invis_xor_conv", 0);
	object oXor = GetObjectByTag("kas_xor1", 0);
	int nGlobal = GetGlobalNumber("K_XOR_AMBUSH");
	
	if (GetIsPC(GetEnteringObject()) && nGlobal == 1 && !UT_GetTalkedToBooleanFlag(OBJECT_SELF))
		{
			UT_SetTalkedToBooleanFlag(OBJECT_SELF, TRUE);
			
			// Set this to prevent Xor spawning a second time if you didn't fast travel
			// the first time but did the second, per issue #468. See also k_sup_gohawk.
			SetGlobalBoolean("K_XOR_AMBUSH_FIX", TRUE);
			
			NoClicksFor(3.0);
			
			SetGlobalFadeOut();
			
			SetGlobalFadeIn(1.5, 2.0);
			
			DelayCommand(0.5, SpawnXor());
			
			DelayCommand(1.0, AssignCommand(oTalker, ActionStartConversation(OBJECT_SELF, "", FALSE, CONVERSATION_TYPE_CINEMATIC, FALSE)));
		}
		// If Xor and friends were previously spawned without Juhani present, fire the scene if the player returns with Juhani in the party.
		else if (GetIsPC(GetEnteringObject()) && IsNPCPartyMember(NPC_JUHANI) && GetIsObjectValid(oXor) && nGlobal == 1 && !GetLocalBoolean(OBJECT_SELF, SW_PLOT_BOOLEAN_08) && UT_GetTalkedToBooleanFlag(OBJECT_SELF))
			{
				SetLocalBoolean(OBJECT_SELF, SW_PLOT_BOOLEAN_08, TRUE);
				
				NoClicksFor(2.0);
				
				SetGlobalFadeOut();
				
				SetGlobalFadeIn(1.0, 2.0);
				
				DelayCommand(0.5, AssignCommand(oTalker, ActionStartConversation(OBJECT_SELF, "", FALSE, CONVERSATION_TYPE_CINEMATIC, FALSE)));
			}
}
