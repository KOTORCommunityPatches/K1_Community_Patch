//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnEnter for kas22_zaaltrig2.utt in kas_m22ab (Kashyyyk The Great Walkway).

	This is the trigger OnEnter that starts a conversation with Zaalbar talking
	about his family if he is present in the party. Edited to jump the party into
	better positions than the vanilla waypoints.
	
	see also k_pkas_zaaldone2.
	
	Issue #719: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/719

	DP 2023-11-27																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"
#include "k_inc_kas"

void main() {
 	
 	object oPC = GetFirstPC();
 	object oEntering = GetEnteringObject();
 	object oZaalbar = GetObjectByTag("Zaalbar", 0);
	location lPC = Location(Vector(62.73,290.23,20.56), 269.14);
	location lPM1 = Location(Vector(61.30,289.04,20.68), 24.88);
	location lPM2 = Location(Vector(62.81,288.36,20.62), 91.46);
 	
 	if (GetIsPC(oEntering))
 		{
 			if (!GetChuundarTalkGlobal() && !GetZaalbarTalk2Local(OBJECT_SELF) && IsNPCPartyMember(NPC_ZAALBAR))
 				{
 					SetGlobalFadeOut();
					
					NoClicksFor(1.4);
					
 					SetPartyLeader(NPC_PLAYER);
					
					DelayCommand(0.5, CP_PartyHerder(lPC, lPM1, lPM2));
 					
 					DelayCommand(1.5, AssignCommand(oPC, ActionStartConversation(oZaalbar, "22aa_zaalb02_01", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
 				}
 				else
 					{
 						DestroyObject(OBJECT_SELF);
 					}
 		}
}
