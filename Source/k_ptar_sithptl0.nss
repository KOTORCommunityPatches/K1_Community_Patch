//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Trigger OnEnter for tar04_sithptl0.utt in tar_m04aa (Taris Undercity).
	
	This is the OnEnter for the trigger that starts the scene with the Sith patrol
	in the Taris Undercity. The original simply initiated the conversation, relying
	on the the script that fires on the first node of the DLG to walk the Troopers
	to the player. But that resulted in messy positioning and framing as all three
	got right up in the PC's face. There could be clipping issues with the shot on
	the first node as well. Now the party is jumped into position before the DLG
	begins, in conjunction with the Troopers being walked to preset positions.
	
	See also k_ptar_sithmove.
	
	Issue #499: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/499
	
	DP 2021/12/10																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oLeader = GetObjectByTag("tar04_sithcomm0", 0);
	object oEntering = GetEnteringObject();
	location lPC = Location(Vector(289.81,180.07,3.00), -25.32);
	location lPM1 = Location(Vector(286.11,179.20,3.00), -15.32);
	location lPM2 = Location(Vector(288.07,183.38,3.00), -35.32);
	
	if (GetIsPC(oEntering) && !UT_GetTalkedToBooleanFlag(OBJECT_SELF))
		{
			UT_SetTalkedToBooleanFlag(OBJECT_SELF, TRUE);
			
			SetGlobalFadeOut();
			SetGlobalFadeIn(0.75, 1.5);
			
			NoClicksFor(1.0);
			
			SetPartyLeader(NPC_PLAYER);
			
			CP_PartyHerder(lPC, lPM1, lPM2);
			
			DelayCommand(0.5, AssignCommand(oLeader, ActionStartConversation(GetFirstPC(), "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
		}
}
