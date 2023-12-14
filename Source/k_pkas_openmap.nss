//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kas25_comp_01.dlg in kas_m25aa (Kashyyyk Lower Shadowlands).
	
	This is the script that fires at the end of the conversation with the
	Rakatan computer in the Lower Shadowlands. It has the Star Map placeable
	play the opening, map fragment, and closing animations. Because of the
	party interjections straight after the conversation with the computer
	ends, in the vanilla game the map usually closes before you regain
	control of the player again. Additionally, the map itself can get stuck
	in a mid-animation state due to being commanded to perform an animation
	while already in the middle of another. To alleviate both these issues,
	the time that the map stays open has been more or less doubled, but using
	a time that matches multiples of the base animation duration.
	
	Updated 2019-05-19 to streamline code using vanilla include functions.
	
	Updated 2023-12-13 to use revised include functions that correctly set the
	timings to match the animations. Prevents a bug where the final map anim
	would play twice and then close prematurely, leaving some of the VFX visible,
	or where the switch to the Jolee dialogue could cause a similar issue for
	any of the anims.
	
	Updated 2023-12-14 to push out the quest related elements until after the
	subsequent DLG with the party members fires.
	
	See also k_pkas_starmap, k_pkas_starcut.
	
	Issue #123: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/315
	
	Issue #517: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/517
	
	Issue #756: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/756
	
	DP 2019-05-13 / DP 2019-05-19 / DP 2023-12-13 / DP 2023-12-14				*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oStarMap = GetObjectByTag("kas25_starmap", 0);
	int nAnim = GetGlobalNumber("K_STAR_MAP");
	float fAnim = CP_StarMapAnimLength(nAnim);
	float fDelay = fAnim + 25.0; // Allow full anim to run to deactivation to prevent it glitching out.
	
	UT_ActionPauseConversation(fDelay);
	
	NoClicksFor(fDelay);
	
	SetGlobalBoolean("kas_ComputerDown", TRUE);
	
	DelayCommand(1.0, AssignCommand(oStarMap, CP_StarMapPlayAnim()));
}
