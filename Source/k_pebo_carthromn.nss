////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Starting Conditional for ebo_carth.dlg in ebo_m40ad (Ebon Hawk Post-Leviathan).
	
	Carth romance check for post-Leviathan scene.
	
	Returns true if the player is NOT romancing Carth.
	
	Issue #663:
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/663
	
	JC, Leilukin, Salk 2020-08-07                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_lev"

int StartingConditional() {
	return !CP_IsRomancingCarth();
}
