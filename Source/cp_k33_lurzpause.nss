//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by ebo46_lurze.dlg in korr_m33aa (Korriban Dreshdae)
	
	This script fires on a couple of lines in Lurze's DLG just before he exits
	the area. He fires an animation during these lines, and if the player skips
	the line then he will skate along the floor for a second or so when the DLG
	ends and he moves to the exit. Now there's a forced pause to allow the anim
	to play out.
	
	Issue #529: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/529
	
	DP 2021-12-09																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	ActionPauseConversation();
	
	NoClicksFor(5.0);
	
	DelayCommand(5.0, ActionResumeConversation());
}
