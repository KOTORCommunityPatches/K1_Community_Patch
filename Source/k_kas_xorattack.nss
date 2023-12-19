//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
    OnEnter for kas_xor_enc.utt in kas_m22aa (Kashyyyk Landing Pad), korr_m33aa
	(Korriban Dreshdae), manm26ad (Manaan Docking Bay), tat_m17ab (Tatooine
	Docking Bay).
	
    This is the trigger OnEnter that starts the final Xor encounter in all eligible
	landing bay modules. The original could spawn Xor without Juhani present which
	would then block further progress, since there is no DLG attached to Xor's UTC
	and his perception event that was intended to trigger the scene didn't work.
	The previous fix to this script was somewhat inadequate, since it didn't check
	that the entering object was valid. It's now changed so that it will only be
	triggered by PCs and only re-trigger a second time if Juhani is present.
	
	Updated 2023-12-19 to add an additional check that prevents a duplicate set of
	Xor and friends being spawned if they were already spawned in another module.
	Also added in a HoldWorldFadeInForDialog for when the scene is triggered by the
	party disembarking the Hawk or using quick travel, and switched the triggered
	checks to use include functions.
	
	See also cp_xor_ptyjmpend, k_kas_xorthug_ud, k_kas_xor_user.
	
	Issue #397:
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/397
	
	Issue #468:
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/468
	
	DP 2021-12-06 / DP 2023-12-19												*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

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
	int nGlobalA = GetGlobalNumber("K_XOR_AMBUSH");
	int nGlobalB = GetGlobalBoolean("K1CP_XOR_SPAWNED");
	
	if (GetIsPC(GetEnteringObject()) && nGlobalA == 1 && !nGlobalB && CP_HasNeverTalkedTo())
		{
			HoldWorldFadeInForDialog();
			SetGlobalFadeOut();
			SetGlobalFadeIn(1.5, 2.0);
			
			NoClicksFor(3.0);
			
			// A global used in k_sup_gohawk to dictate the waypoint where the player will spawn in when using fast travel. Seems like the intention
			// was to originally only have the Xor trigger under this waypoint, but was probably changed when it didn't work consistently (or at all).
			SetGlobalBoolean("K_XOR_AMBUSH_FIX", TRUE);
			
			// An added global to prevent duplicate encounters spawning in other modules if you already spawned Xor without Juhani present, then left the planet.
			// Possibly what K_XOR_AMBUSH_FIX was also originally intended to do, but doesn't.
			SetGlobalBoolean("K1CP_XOR_SPAWNED", TRUE);
			
			DelayCommand(0.5, SpawnXor());
			
			DelayCommand(1.0, AssignCommand(oTalker, ActionStartConversation(OBJECT_SELF, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
		}
		// If Xor and friends were previously spawned without Juhani present, fire the scene if the player returns with Juhani in the party.
		else if (GetIsPC(GetEnteringObject()) && IsNPCPartyMember(NPC_JUHANI) && GetIsObjectValid(oXor)
				&& nGlobalA == 1 && UT_GetTalkedToBooleanFlag(OBJECT_SELF) && CP_HasNeverTriggered())
			{
				HoldWorldFadeInForDialog();
				SetGlobalFadeOut();
				SetGlobalFadeIn(1.0, 2.0);
				
				NoClicksFor(2.0);
				
				DelayCommand(0.5, AssignCommand(oTalker, ActionStartConversation(OBJECT_SELF, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
			}
}
