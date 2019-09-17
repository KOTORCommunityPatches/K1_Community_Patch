////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	k_pman_misc60
	
	Fired by man26_tyvark.dlg in manm26ae (Manaan East Central).
	
	Conditional script for Tyvark's gossip about Kashyyyk.
	
	Corrected a typo on the global boolean name that prevented this script from
	ever returning true.
	
	Note: The corresponding NCS in the Community Patch was fixed by hex editing.
	This source script is provided for reference, but wasn't actually used.
	
	JC 2019-07-31                                                             */
////////////////////////////////////////////////////////////////////////////////

int StartingConditional() {

	int nFlag = ((GetGlobalBoolean("MAN_TYVARKC_DONE") == FALSE) && (GetGlobalBoolean("kas_ChuundarDead") == TRUE));

	if( nFlag )
		SetGlobalBoolean("MAN_TYVARKC_DONE", TRUE);

	return nFlag;

}
