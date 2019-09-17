////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Starting conditional for Reply 131 of man26_repdip.dlg in manm26ae (Manaan
	East Central).

	Returns TRUE if the player has not previously tried to blackmail Roland over
	the events of Hrakert Station.
	
	Issue #106: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/106
	
	DP 2019-05-19                                                             */
////////////////////////////////////////////////////////////////////////////////

int StartingConditional() {
	
	object oRoland = GetObjectByTag("man26_repdip", 0);
	
	if (GetLocalBoolean(oRoland, 49) == FALSE)
		{
			return TRUE;
		}
	
	return FALSE;
}
