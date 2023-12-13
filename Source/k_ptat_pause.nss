//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tat18_starspeak.dlg in tat_m18ac (Tatooine Eastern Dune Sea).
	
	This script fires near the beginning of the scene triggered when interacting
	with the Star Map in the Krayt Dragon cave on Tatooine. It pauses the scene
	momentarily while the star map plays its animation and gives the player the
	datapad quest item. It has been altered to vary the delay based on the new
	star map anim setup functions, and also switch to another static camera on
	the opposite side of the map midway through the shot, which otherwise seems
	to be unused.
	
	See also k_ptat_starcut.
	
	Issue #315: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/315
	
	Issue #756: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/756
	
	DP 2023-12-13																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	int nAnim = GetGlobalNumber("K_STAR_MAP") - 10; // Account for map number being incremented by CP_StarMapSetState().
	float fAnim = CP_StarMapAnimLength(nAnim);
	float fDelay;
	
	// If on the final map, pause to show the full animation, otherwise cut to the companion interjections
	// while the anim is still running an additional loop in the background.
	if (nAnim < 40)
		{
			fDelay = (fAnim * 0.6) + 12.6;
		}
		else
			{
				fDelay = fAnim + 14.6;
			}
	
	UT_ActionPauseConversation(fDelay);
	
	NoClicksFor(fDelay);
	
	DelayCommand(fDelay * 0.7, SetDialogPlaceableCamera(24));
	
	CreateItemOnObject("tat_starpad", oPC, 1);
}
