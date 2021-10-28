//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man28_sub.dlg in manm28aa (Manaan Hrakert Station).
	
	This is the script that fires when you choose to return to the surface via
	the sub in Hrakert Station. The original simply starts a new module, but this
	has now been hijacked to set a boolean on the area to flag that the player
	has returned via sub at least once. This is referenced by a new starting
	conditional in the crazed mercenary's DLG.
	
	See also cp_man28_surfrtn.
	
	Issue #378: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/378
	
	DP 2021-10-28																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	int SW_PLOT_BOOLEAN_06 = 5;
	
	SetLocalBoolean(GetArea(OBJECT_SELF), SW_PLOT_BOOLEAN_06, TRUE);
	
	StartNewModule("manm26ae", "from28a", "23b");
}
