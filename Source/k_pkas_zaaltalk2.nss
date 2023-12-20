//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnEnter for kas22_zaaltrig2.utt in kas_m22ab (Kashyyyk The Great Walkway).

	This is the trigger OnEnter that starts a conversation with Zaalbar talking
	about his family if he is present in the party. Edited to jump the party into
	better positions than the vanilla waypoints.
	
	Updated 2023-12-20 to toggle party member AI to make sure they obey commands.
	
	see also k_pkas_zaaldone2.
	
	Issue #719: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/719

	DP 2023-11-27 / DP 2023-12-20												*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
 	
	object oEntering = GetEnteringObject();
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
 	object oZaal = GetObjectByTag("Zaalbar", 0);
	location lPC = Location(Vector(62.73,290.23,20.56), 269.14);
	location lPM1 = Location(Vector(61.30,289.04,20.68), 24.88);
	location lPM2 = Location(Vector(62.81,288.36,20.62), 91.46);
 	
 	if (GetIsPC(oEntering))
 		{
 			if (!GetGlobalBoolean("kas_TalkChuundar") && !GetLocalBoolean(GetArea(OBJECT_SELF), SW_PLOT_BOOLEAN_01) && IsNPCPartyMember(NPC_ZAALBAR))
 				{
 					SetGlobalFadeOut();
					
					NoClicksFor(1.5);
					
					SetPartyLeader(NPC_PLAYER);
					
					CP_ToggleAI(oPM1);
					CP_ToggleAI(oPM2);
					DelayCommand(0.1, CP_PartyHerder(lPC, lPM1, lPM2));
					
					// Reorient the PC and Zaalbar so they always face each other regardless of whether Zaalbar is PM1 or PM2.
					DelayCommand(0.5, CP_FaceNPC(oZaal, oPC));
					DelayCommand(0.5, CP_FaceNPC(oPC, oZaal));
 					
 					DelayCommand(1.5, AssignCommand(oPC, ActionStartConversation(oZaal, "22aa_zaalb02_01", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
 				}
 				else
 					{
 						DestroyObject(OBJECT_SELF);
 					}
 		}
}
