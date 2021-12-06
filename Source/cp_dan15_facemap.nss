//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by cp_dan15_starmap.dlg in danm15 (Dantooine Ruins).
	
	This script was added to Bastila's "See this world here?" node, to re-orient
	the player and Bastila off-screen, then switch the camera angle mid-line.
	
	Updated 2020-12-06 to add an animation to the player to prevent them freezing
	once the scene ends. Also prevented skipping through the line.
	
	See also cp_dan15_mapstrt, k_pdan_cut50, k_pdan_cut51, k_pdan_starmap02, 
	k_pdan_starmap05.
	
	Issue #105: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/105
	
	DP 2019-08-01 / DP 2021-12-06												*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oBast = GetObjectByTag("bastila", 0);
	object oStarmap = GetObjectByTag("dan15_starmap", 0);
	
	ActionPauseConversation();
	
	NoClicksFor(10.4);
	
	AssignCommand(oPC, ClearAllActions());
	AssignCommand(oPC, SetFacingPoint(GetPosition(oStarmap)));
	DelayCommand(0.2, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1)));
	
	AssignCommand(oBast, ClearAllActions());
	AssignCommand(oBast, SetFacingPoint(GetPosition(oStarmap)));
	
	DelayCommand(4.4, SetDialogPlaceableCamera(1));
	
	DelayCommand(10.4, ActionResumeConversation());
}
