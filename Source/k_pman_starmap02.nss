//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man28_starmap.dlg in manm28ad (Manaan Hrakert Rift).
	
	This is the script that fires at the beginning of the cutscene of discovering
	the star map in Manaan Hrakert Rift. The vanilla script only partially made
	use of Bioware's include functions for running the star maps, which resulted
	in the map looping the specific map animation forever. This isn't ideal for
	the final map anim, since it is really only designed to run a single time.
	This has been revised to use K1CP's added include functions that correctly
	set the timings to match the animations. It will now run the appropriate anim
	and then close the map, all within the cutscene. If on the final map, it will
	utilise all three static cameras, one formerly unused, to showcase the anim
	from different angles (in conjunction with some GIT tweaks to their framing).
	
	See also k_pman_starmap01.
	
	Issue #734: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/734

	Issue #756: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/756

	DP 2023-12-13																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oStarMap = GetObjectByTag("man28_starmap", 0);
	int nStar = GetGlobalNumber("K_STAR_MAP");
	float fAnim = CP_StarMapAnimLength(nStar);
	float fDelay = fAnim + 25.0; // Allow full anim to run to deactivation to prevent it glitching out.
	
	UT_ActionPauseConversation(fDelay);
	
	NoClicksFor(fDelay);
	
	if (nStar > 30)
		{
			DelayCommand(fDelay * 0.33, SetDialogPlaceableCamera(4));
			DelayCommand(fDelay * 0.5, SetDialogPlaceableCamera(6));
		}
	
	DelayCommand(1.0, AssignCommand(oStarMap, CP_StarMapPlayAnim()));
}
