//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar10_kandon01.dlg in tar_m10ac (Taris Black Vulkar Base Garage).
	
	This is the script that fires at the end of the branch where the player has
	sided with the Vulkars, jumping the party out to the Lower City. The simple
	addition of a fade-out was added to try and get a cleaner transition.
	
	Issue #241: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/241
	
	DP 2019-11-11																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oKand = GetObjectByTag("KandonArk101", 0);
	int SW_PLOT_BOOLEAN_10 = 9;
	
	SetGlobalFadeOut();
	
	SetGlobalBoolean("Tar_KandonMission", TRUE);
	
	// Direct substitution of k_inc_tar function TAR_MarkForCleanup
	// to cut down on unnecessary Include crud
	SetLocalBoolean(oKand, SW_PLOT_BOOLEAN_10, TRUE);
	
	DelayCommand(0.1, StartNewModule("tar_m03aa", "tar03_sw03aag"));
}
