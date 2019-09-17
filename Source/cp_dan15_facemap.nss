////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by cp_dan15_starmap.dlg in danm15 (Dantooine Ruins).
	
	This script was added to Bastila's "See this world here?" node, to re-orient
	the player and Bastila off-screen, then switch the camera angle mid-line.
	
	See also k_pdan_cut50, k_pdan_cut51, k_pdan_starmap02, and k_pdan_starmap05.
	
	Issue #105: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/105
	
	DP 2019-08-01                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oBast = GetObjectByTag("bastila", 0);
	object oStarmap = GetObjectByTag("dan15_starmap", 0);
	
	AssignCommand(oPC, ClearAllActions());
	AssignCommand(oPC, SetFacingPoint(GetPosition(oStarmap)));
	
	AssignCommand(oBast, ClearAllActions());
	AssignCommand(oBast, SetFacingPoint(GetPosition(oStarmap)));
	
	DelayCommand(4.4, SetDialogPlaceableCamera(1));
}
