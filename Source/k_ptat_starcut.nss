//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tat18_starspeak.dlg in tat_m18ac (Tatooine Eastern Dune Sea).
	
	This script fires at the start of the scene triggered when interacting with
	the Star Map in the Krayt Dragon cave on Tatooine. The vanilla scene jumps
	the party into a poor position, which results in facing issues with all the
	various party member interjections. This has been changed to place the party
	around the map (covered by a new fade-out/fade-in), in conjunction with some
	added listener tags in the DLG. Additionally, the default length of the map's
	animation is fairly short, so this has been extended by altering the vanilla
	function.
	
	Updated 2023-12-13 to use revised include functions that correctly set the
	timings to match the animations. Prevents a bug where the final map anim
	would play twice and then close prematurely, leaving some of the VFX visible.
	
	See also k_ptat_pause.
	
	Issue #315: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/315
	
	Issue #756: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/756
	
	DP 2019-10-28 / DP 2023-12-13												*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oStarMap = GetObjectByTag("K_TAT_STAR_MAP", 0);
	location lPC = Location(Vector(373.77,340.54,81.33), -2.76);
	location lPM1 = Location(Vector(374.26,342.26,81.33), -29.22);
	location lPM2 = Location(Vector(374.04,338.84,81.33), 23.59);
	
	ActionPauseConversation();
	
	SetGlobalFadeOut();
	SetGlobalFadeIn(1.0, 0.5);
	
	NoClicksFor(1.5);
	
	SetGlobalBoolean("tat_StarmapFound", TRUE);
	
	CP_PartyHerder(lPC, lPM1, lPM2);
	
	DelayCommand(0.1, CP_FaceNPC(GetFirstPC(), oStarMap));
	
	DelayCommand(1.0, AssignCommand(oStarMap, CP_StarMapPlayAnim()));
	
	DelayCommand(1.5, ActionResumeConversation());
}
