////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	k_pman_misc61
	
	Fired by man26_yortal.dlg in manm26ab (Manaan Ahto East).
	
	Conditional script for Yortal's gossip about Kashyyyk.
	
	Corrected a typo on the global boolean name that prevented this script from
	ever returning true.
	
	Note: The corresponding NCS in the Community Patch was fixed by hex editing.
	This source script is provided for reference, but wasn't actually used.
	
	JC 2019-07-31                                                             */
////////////////////////////////////////////////////////////////////////////////

int StartingConditional() {

	int nFlag = ((GetGlobalBoolean("MAN_YORTALC_DONE") == FALSE) && (GetGlobalBoolean("kas_ChuundarDead") == TRUE));

	if( nFlag )
		SetGlobalBoolean("MAN_YORTALC_DONE", TRUE);

	return nFlag;

}
