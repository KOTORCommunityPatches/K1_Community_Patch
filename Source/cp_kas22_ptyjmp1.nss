//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnDialogue for kas22_dasol_01.utc and kas22_eli_01.utc in kas_m22aa (Kashyyyk
	Landing Pad).
	
	This is a custom OnDialogue for Eli and Matton that includes some party herding
	functions to jump the party into position to mitigate NPC pathfinding issues and
	improve camera angles during conversations.
	
	Issue #118: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/118
	
	DP 2020-06-05																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oMatton = GetObjectByTag("kas22_dasol_01", 0);
	location lPC = Location(Vector(117.454,87.919,62.876), 102.0);
	location lPM1 = Location(Vector(119.055,87.052,62.876), 122.5);
	location lPM2 = Location(Vector(116.466,86.461,62.876), 81.5);
	
	NoClicksFor(2.5);
	
	SetGlobalFadeOut();
	
	CP_PartyJump(oPC, lPC);
	CP_PartyJump(oPM1, lPM1);
	CP_PartyJump(oPM2, lPM2);
	
	// If Eli was killed/ran away
	if (GetLocalBoolean(oMatton, 0))
		{
			// Since Eli is dead, face the party towards Matton.
			AssignCommand(oPC, ActionDoCommand(SetFacingPoint(GetPosition(oMatton))));
			AssignCommand(oPM1, ActionDoCommand(SetFacingPoint(GetPosition(oMatton))));
			AssignCommand(oPM2, ActionDoCommand(SetFacingPoint(GetPosition(oMatton))));
			
			// Play an anim to force the facing and to prevent the player freezing post-conversation.
			AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_INJECT));
			AssignCommand(oPM1, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 1.0));
			AssignCommand(oPM2, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 1.0));
		}
		// If Eli is still around
		else
			{
				// Running a ClearAllActions after the jump seems to cure freezing post-conversation.
				DelayCommand(0.75, AssignCommand(oPC, ClearAllActions()));
				DelayCommand(0.75, AssignCommand(oPM1, ClearAllActions()));
				DelayCommand(0.75, AssignCommand(oPM2, ClearAllActions()));
			}
	
	SetGlobalFadeIn(0.9, 1.0);
	
	// 1004 = KOTOR_DEFAULT_EVENT_ON_DIALOGUE
	DelayCommand(0.8, ExecuteScript("k_ai_master", OBJECT_SELF, 1004));
}
