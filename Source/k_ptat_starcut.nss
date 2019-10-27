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
	
	The vanilla script was not able to be decompiled, so it was reconstructed by
	looking at the bytecode and referencing Kashyyyk's Star Map script, which is
	able to be decompiled. Hopefully nothing important was left out....
	
	Issue #315: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/315
	
	DP 2019-10-28																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void StarMapPlayAnim() {

    int nStar = GetGlobalNumber("K_STAR_MAP");
    int nBool = GetLocalBoolean(OBJECT_SELF, SW_PLOT_HAS_TALKED_TO);
    float fDelay = 62.94;
	
    if (!nBool)
		{
			ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
			ActionPlayAnimation(UT_StarMap3GetLoopAnim(nStar));
			
			if (nStar == 40)
				{
					fDelay = 93.34;
				}
			
			DelayCommand(fDelay, ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE));
		}
}

void StarMapPlaySet() {
	
	StarMapPlayAnim();
	UT_StarMap1VariableSet();
}

void main() {
	
	object oPM0 = CP_GetPartyMember(0);
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oStarMap = GetObjectByTag("K_TAT_STAR_MAP", 0);
	location lPC = Location(Vector(373.793,338.496,81.33), 30.0);
	location lPM1 = Location(Vector(374.367,341.27,81.32), -22.0);
	location lPM2 = Location(Vector(376.641,337.732,81.351), 84.0);
	
	ActionPauseConversation();
	
	SetGlobalFadeOut();
	SetGlobalFadeIn(0.5, 0.5);
	
	SetGlobalBoolean("tat_StarmapFound", TRUE);
	
	CP_PartyJump(oPM0, lPC);
	CP_PartyJump(oPM1, lPM1);
	CP_PartyJump(oPM2, lPM2);
	
	AssignCommand(oStarMap, PlaySound("pl_starmap_open"));
	AssignCommand(oStarMap, StarMapPlaySet());
	
	DelayCommand(13.0, ActionResumeConversation());
}
