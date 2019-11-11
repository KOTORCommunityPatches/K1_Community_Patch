//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by floorpanel004.utt in unk_m44ab (Unknown World Temple Catacombs).
	
	This is the trigger OnEnter that fires when you step on one of the floor tiles
	that make up the floor puzzle in the temple's lower level. It has been changed
	so that solo mode is deactivated as soon as the puzzle is complete, since the
	trigger in the doorway that used to do that has been changed.
	
	See also k_punk_floor01, k_punk_floor02, k_punk_floor03, k_punk_floor05,
	k_punk_floor06, k_punk_floor07, k_punk_floor08, k_punk_floor09, k_punk_sparty.
	
	Issue #338: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/338
	
	DP 2019-11-11																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void main() {
	
	object oDoor = GetObjectByTag("unk44_massdoor", 0);
	object oReset = GetObjectByTag("PanelReset", 0);
	object oFloor101 = GetObjectByTag("FloorPanel01", 0);
	object oFloor102 = GetObjectByTag("FloorPanel02", 0);
	object oFloor103 = GetObjectByTag("FloorPanel03", 0);
	object oFloor104 = GetObjectByTag("FloorPanel04", 0);
	object oFloor105 = GetObjectByTag("FloorPanel05", 0);
	object oFloor106 = GetObjectByTag("FloorPanel06", 0);
	object oFloor107 = GetObjectByTag("FloorPanel07", 0);
	object oFloor108 = GetObjectByTag("FloorPanel08", 0);
	object oFloor109 = GetObjectByTag("FloorPanel09", 0);
	
	if (GetGlobalBoolean("UNK_TILES") == FALSE)
		{
			if (UT_GetTalkedToBooleanFlag(oFloor101) == TRUE)
				{
					AssignCommand(oFloor101, ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE));
					UT_SetTalkedToBooleanFlag(oFloor101, FALSE);
				}
				else
					{
						AssignCommand(oFloor101, ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE));
						UT_SetTalkedToBooleanFlag(oFloor101, TRUE);
					}
			
			if (UT_GetTalkedToBooleanFlag(oFloor104) == TRUE)
				{
					AssignCommand(oFloor104, ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE));
					UT_SetTalkedToBooleanFlag(oFloor104, FALSE);
				}
				else
					{
						AssignCommand(oFloor104, ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE));
						UT_SetTalkedToBooleanFlag(oFloor104, TRUE);
					}
			
			if (UT_GetTalkedToBooleanFlag(oFloor105) == TRUE)
				{
					AssignCommand(oFloor105, ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE));
					UT_SetTalkedToBooleanFlag(oFloor105, FALSE);
				}
				else
					{
						AssignCommand(oFloor105, ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE));
						UT_SetTalkedToBooleanFlag(oFloor105, TRUE);
					}
			
			if (UT_GetTalkedToBooleanFlag(oFloor107) == TRUE)
				{
					AssignCommand(oFloor107, ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE));
					UT_SetTalkedToBooleanFlag(oFloor107, FALSE);
				}
				else
					{
						AssignCommand(oFloor107, ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE));
						UT_SetTalkedToBooleanFlag(oFloor107, TRUE);
					}
		}
	
	if (UT_GetTalkedToBooleanFlag(oFloor101) == TRUE
	&& UT_GetTalkedToBooleanFlag(oFloor102) == TRUE
	&& UT_GetTalkedToBooleanFlag(oFloor103) == TRUE
	&& UT_GetTalkedToBooleanFlag(oFloor104) == TRUE
	&& UT_GetTalkedToBooleanFlag(oFloor105) == TRUE
	&& UT_GetTalkedToBooleanFlag(oFloor106) == TRUE
	&& UT_GetTalkedToBooleanFlag(oFloor107) == TRUE
	&& UT_GetTalkedToBooleanFlag(oFloor108) == TRUE
	&& UT_GetTalkedToBooleanFlag(oFloor109) == TRUE
	&& GetGlobalBoolean("UNK_TILES") == FALSE)
		{
			SetGlobalBoolean("UNK_TILES", TRUE);
			AssignCommand(oReset, ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE));
			PlaySound("cs_puzzledone");
			
			ActionOpenDoor(oDoor);
			
			SetSoloMode(FALSE);
		}
}
