//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnUsed for kas25_starmap.utp in kas_m25aa (Kashyyyk Lower Shadowlands).
	
	This is the OnUsed script that activated the Star Map in the Lower Shadowlands
	if the Rakatan hologram has been disabled but didn't fire the map sequence. It
	incorporates the revised include functions that correctly set the timings to
	match the animations. It also adds a check of the Talked To flag in order to
	correctly pop-up the barkstring for it being inactive after it has played an
	animation and the hologram has been flagged as deactivated (which will be the
	case when proceeding through the sequence normally).
	
	See also k_pkas_openmap.
	
	Issue #123: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/315
	
	Issue #756: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/756
	
	DP 2023-12-13																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	
	if (GetGlobalBoolean("kas_ComputerDown") &&  !UT_GetTalkedToBooleanFlag(OBJECT_SELF))
		{
			CP_StarMapPlayAnim();
			CreateItemOnObject("kas_starpad", oPC, 1);
		}
		else
			{
				ActionStartConversation(oPC, "", 0, 0, TRUE);
			}
}
