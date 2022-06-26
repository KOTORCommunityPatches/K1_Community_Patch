//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Starting conditional for man26_hulas.dlg in manm26ae (Manaan East Central).
	
	This is the starting conditional for the player response to tell Huulas that
	you failed to kill Zuulan because Dantooine was destroyed. The
	original script checked that K_Geno_Zuulan was less than 3, but this appears
	to be a mistake on the part of the author since killing him sets the state
	to 2, thus you could kill him and report post-Leviathan that you failed to
	kill him.
	
	Issue #639: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/639
	
	DP 2022-06-26																*/
//////////////////////////////////////////////////////////////////////////////////

int StartingConditional() {
	
	int nCheck = (GetGlobalNumber("K_Geno_Zuulan") == 1 && GetGlobalNumber("DAN_PLANET_PLOT") == 3);
	
	return nCheck;
}
