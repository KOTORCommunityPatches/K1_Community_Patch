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
	
	Updated 2023-12-19 to have the pause span the full length of the animation,
	bringing it into line with changes made to the map scenes on other planets.
	
	See also k_ptat_starcut.
	
	Issue #315: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/315
	
	Issue #756: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/756
	
	DP 2023-12-13 / DP 2023-12-19												*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	int nAnim = GetGlobalNumber("K_STAR_MAP") - 10; // Account for map number being incremented by CP_StarMapSetState().
	float fAnim = CP_StarMapAnimLength(nAnim);
	float fDelay = fAnim + 24.0; // Allow full anim to run to deactivation to prevent it glitching out.
	
	UT_ActionPauseConversation(fDelay);
	
	NoClicksFor(fDelay);
	
	DelayCommand(fDelay * 0.5, SetDialogPlaceableCamera(24));
	
	CreateItemOnObject("tat_starpad", oPC, 1);
}
