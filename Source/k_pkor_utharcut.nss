////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by k_kor_utharcut.utt in korr_m39aa (Korriban Tomb of Naga Sadow)
	
	This script is fired by a trigger near the acid river after the player
	has looted the lightsaber from the Sith statue. It starts the conversation
	for the final showdown. The player is now jumped into a static starting
	position to help reduce some of the facing issues that occur in this
	conversation.
	
	See also k_pkor_utharmove.
	
	Issue #167: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/167
	
	DP 2019-08-10                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

int GetFlag() {
	return UT_GetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_01);
}

void main() {
	
	object oEntering = GetEnteringObject();
	object oPC = GetFirstPC();
	object oUthar = GetObjectByTag("kor39_utharwynn", 0);
	object oYuthura = GetObjectByTag("kor39_yuthura", 0);
	object oSaber = GetItemPossessedBy(oPC, "k39_itm_cersaber");
	object oDoorStarMap = GetObjectByTag("k39_door_starmap", 0);
	object oWP_Uthar = GetObjectByTag("k39_way_utharjmp", 0);
	object oWP_Yuthura = GetObjectByTag("k39_way_yuthjump", 0);
	location lPC = Location(Vector(93.75,107.7755,15.12), 180.0);
	
	if ((GetIsPC(oEntering)) && (GetIsObjectValid(oSaber)) && (!GetFlag()))
		{
			SetGlobalFadeOut();
			
			NoClicksFor(0.7);
			
			UT_SetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_01, TRUE);
			
			AssignCommand(oDoorStarMap, ActionCloseDoor(oDoorStarMap));
			SetLocked(oDoorStarMap, TRUE);
			
			AssignCommand(oPC, ActionJumpToLocation(lPC));
			AssignCommand(oPC, ActionDoCommand(SetFacing(DIRECTION_WEST)));
			
			SetGlobalFadeIn(0.5, 1.5);
			
			DelayCommand(0.5, UT_NPC_InitConversation("kor39_utharwynn", "", OBJECT_INVALID));
		}
}
