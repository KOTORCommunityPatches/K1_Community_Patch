//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Trigger OnEnter for ebo40_carthtlk.utt in ebo_m40ad (Ebon Hawk Post-Leviathan).
	
	This is the OnEnter script that fires the post-Leviathan escape scene. It has
	been tweaked to jump the player into a new position, since the entire party
	has been rearranged to try and minimise facing issues and bad camera angles.
	Additionally, the start conversation command has had ignore flags added for
	any potentially missing party members, in order not to break the node that has
	the added forced animations for everyone.
	
	See also cp_ebo40ad_endcs, cp_ebo40ad_false, cp_ebo40ad_pause, cp_lev_awarefix.
	
	Issue #527: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/527
	
	DP 2021-12-10																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oEntering = GetEnteringObject();
	location lPC_Jump = Location(Vector(48.25,43.45,1.80), 43.50);
	
	if (GetIsPC(oEntering) && !UT_GetTalkedToBooleanFlag(OBJECT_SELF))
		{
			HoldWorldFadeInForDialog();
			
			NoClicksFor(1.0);
			
			UT_SetTalkedToBooleanFlag(OBJECT_SELF, TRUE);
			
			// Jump the player from their module spawn-in position to their cutscene position.
			DelayCommand(0.3, CP_PartyJump(oEntering, lPC_Jump));
			
			// Add exclusion flags for potentially missing party members so that the forced animations on the initial nodes still fire correctly for remaining party members.
			DelayCommand(0.5, AssignCommand(GetObjectByTag("carth", 0), ActionStartConversation(GetFirstPC(), "ebo_carth", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE, "zaalbar", "hk47", "juhani")));
		}
}
