////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	cp_m40ad_done_n
	
	Checks if the player is done with the post-Leviathan scene.
	
	Returns true if the player is finished with HK and is NOT romancing Carth.
	
	Issue #3: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/3
	
	Issue #663:
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/663	
	
	JC, Leilukin, Salk 2022-08-07                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_lev"

int StartingConditional() {
	return CP_IsHKTalkDone() && !CP_IsRomancingCarth();
}