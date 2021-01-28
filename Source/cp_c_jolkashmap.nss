//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Starting conditional on E89 in k_hjol_dialog.dlg.
	
	This is an added starting conditional for Jolee's global DLG that gates one
	of his lines about Kashyyyk being intended as a garden planet and Wookiees
	being an engineered race of gardeners behind a check of whether or not the
	Kashyyyk star map has been accessed. If it hasn't, a cut down version of
	this line that removes the allusions to Rakatan engineering plays instead.
	
	Issue #446: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/446
	
	DP 2021-01-28																*/
//////////////////////////////////////////////////////////////////////////////////

int StartingConditional() {
	
	if (GetGlobalBoolean("K_STAR_MAP_KASHYYYK"))
		{
			return TRUE;
		}
	
	return FALSE;
}
