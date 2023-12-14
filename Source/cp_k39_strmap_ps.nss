//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kor39_starspeak.dlg in korr_m39aa (Korriban Tomb of Naga Sadow)
	
	This is a custom script that replaces the vanilla pause script on the first
	node of the cutscene showing the star map opening. It has been extended
	using the new star map include functions, and incorporates a mid-animation
	switch to a second added static camera.
	
	See also k_pkor_star_map.
	
	Issue #756: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/756

	DP 2023-12-14																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oStarMap = GetObjectByTag("k39_plc_starmap", 0);
	int nStar = GetGlobalNumber("K_STAR_MAP");
	float fAnim = CP_StarMapAnimLength(nStar);
	float fDelay = fAnim + 25.0; // Allow full anim to run to deactivation to prevent it glitching out.
	
	UT_ActionPauseConversation(fDelay);
	
	NoClicksFor(fDelay);
	
	AddJournalQuestEntry("kor33_findstarmap", 40);
	GivePlotXP("kor33_findstarmap", 100);
	
	DelayCommand(fDelay * 0.4, SetDialogPlaceableCamera(65));
	
	DelayCommand(1.0, AssignCommand(oStarMap, CP_StarMapPlayAnim()));
}
