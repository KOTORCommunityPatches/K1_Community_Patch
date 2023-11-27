//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnEnter for kas22_dehnotrig.utt in kas_m22ab (Kashyyyk The Great Walkway).

	This is the trigger OnEnter that starts the scene with Captain Dehno and his
	two offsiders that just killed a Wookiee. The original script only relied on
	UT_NPC_InitConversation, which resulted in the party being in a poor position
	and subsequent issues with camera angles/framing. The party is now jumped in
	conjunction with some camera angle and listener edits in the DLG.
	
	Issue #156: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/156

	DP 2023-11-27																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
 	
 	object oEntering = GetEnteringObject();
	object oDehno = GetObjectByTag("kas22_dehno_01");
	int nCnt = 0;
	location lPC = Location(Vector(75.62,294.15,19.96), -5.00);
	location lPM1 = Location(Vector(73.92,293.29,20.10), -5.00);
	location lPM2 = Location(Vector(74.09,295.28,20.03), -5.00);
	
 	if (GetIsPC(oEntering) && CP_HasNeverTriggered())
 		{
 			SetGlobalFadeOut();
			DelayCommand(0.75, SetGlobalFadeIn(0.1, 1.0));
			
			NoClicksFor(1.0);

			SetPartyLeader(NPC_PLAYER);
			
			UT_RestorePartyToOneHealth();
			
			DelayCommand(0.1, CP_PartyHerder(lPC, lPM1, lPM2));
			
			DelayCommand(0.6, AssignCommand(oDehno, ActionStartConversation(GetFirstPC(), "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
 			
			DelayCommand(2.0, DestroyObject(OBJECT_SELF));
		}
}
