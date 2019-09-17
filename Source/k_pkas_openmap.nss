////////////////////////////////////////////////////////////////////////////////
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
	
	2019-05-19 Updated to streamline code using vanilla include functions.

	Issue #123: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/123

	DP 2019-05-13                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

// Prototypes
void StarMapPlayAnim();
void StarMapPlaySet();
void SetStarMap(int bValue);

void StarMapPlayAnim() {

    int nStar = GetGlobalNumber("K_STAR_MAP");
    int nBool = GetLocalBoolean(OBJECT_SELF, SW_PLOT_HAS_TALKED_TO);
    float fDelay = 62.94;
	
    if(nBool == FALSE)
    {
        ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
        ActionPlayAnimation(UT_StarMap3GetLoopAnim(nStar));
		
        if(nStar == 40)
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

void SetStarMap(int bValue) {
	if (((bValue == TRUE) || (bValue == FALSE))) {
		SetGlobalBoolean("kas_StarMap", bValue);
	}
	return;
}

void main() {
	
	object oKas25_starmap = GetObjectByTag("kas25_starmap", 0);
	
	SetGlobalBoolean("kas_ComputerDown", 1);
	SetStarMap(1);
	CreateItemOnObject("kas_starpad", GetFirstPC(), 1);
	AssignCommand(oKas25_starmap, PlaySound("pl_starmap_open"));
	AssignCommand(oKas25_starmap, StarMapPlaySet());
	ActionPauseConversation();
	DelayCommand(14.0, ActionResumeConversation());
}
