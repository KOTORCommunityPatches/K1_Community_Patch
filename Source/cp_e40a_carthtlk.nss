//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnEnter for ebo40_carthtlk.utt in ebo_m40aa (Ebon Hawk Pre-Leviathan stunt module).
	
	This is the trigger OnEnter that starts the scene after the Hawk is interdicted
	by the Leviathan, where the player chooses who is going to break them out of
	jail. It has been renamed to prevent a filename clash with a script from ebo_m40ad
	(the post-Leviathan stunt module) and altered to swap the cutscene owner to an
	invisible placeable rather than Carth as part of getting the hide masks/weapons
	flags to take effect correctly. Ignore flags for potentially missing party members
	were also added, since they now have assigned animations on the DLG's second node.
	
	See also k_plev_fadein.
	
	Issue #559: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/559
	
	DP 2022-06-22																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void main() {
	
	object oEntering = GetEnteringObject();
	
	if (GetIsPC(oEntering) && !UT_GetTalkedToBooleanFlag(OBJECT_SELF))
		{
			HoldWorldFadeInForDialog();
			
			UT_SetTalkedToBooleanFlag(OBJECT_SELF, TRUE);
			
			SetGlobalFadeOut();
			
			NoClicksFor(1.2);
			
			DelayCommand(1.0, AssignCommand(GetObjectByTag("CutStart", 0), ActionStartConversation(GetFirstPC(), "lev40_carth", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE, "zaalbar", "hk47", "juhani", "jolee")));
		}
}
