//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnUsed for reptab002.utp in tar_m02af (Taris Upper City Hideout).
	
	This is the OnUsed script for the workbench in the Taris Hideout. It seems
	that the initial tutorial cutscene can leave the player frozen after they
	exit the upgrade screen, so they are now given a forced animation.
	
	Issue #491: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/491
	
	DP 2021/12/10																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void main() {
	
	AssignCommand(GetFirstPC(), PlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1));
	
	if (!UT_GetTalkedToBooleanFlag(OBJECT_SELF))
		{
			UT_SetTalkedToBooleanFlag(OBJECT_SELF, TRUE);
			ActionStartConversation(GetLastUsedBy());
		}
		else
			{
				ShowUpgradeScreen(OBJECT_INVALID);
			}
}
