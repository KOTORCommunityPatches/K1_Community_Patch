////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	k_pdan_com02
	
	Fired by dan_13_karal.dlg in danm13 (Dantooine Jedi Enclave).
	
	Conditional script for Karal Karr's gossip about Kashyyyk. 
	
	Corrected a typo on the global boolean name that prevented this script from
	ever returning true.
	
	Note: The corresponding NCS in the Community Patch was fixed by hex editing.
	This source script is provided for reference, but wasn't actually used.
	
	JC 2019-07-31                                                             */
////////////////////////////////////////////////////////////////////////////////

int StartingConditional() {
	
	int nFlag = ((GetGlobalBoolean("DAN_KARALC_DONE") == FALSE) && (GetGlobalBoolean("kas_ChuundarDead") == TRUE));

	if( nFlag )
		SetGlobalBoolean("DAN_KARALC_DONE", TRUE);

	return nFlag;
}
