////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by dan13_crattis.dlg in danm13 (Dantooine Jedi Enclave).
	
	This is a conditional for one of Crattis Yurkal's conversation nodes about
	Kashyyyk. The vanilla script had a misspelled boolean name.
	
	JC 2019-07-31                                                             */
////////////////////////////////////////////////////////////////////////////////

int StartingConditional() {
	
	int nState = ((GetGlobalBoolean("DAN_CRATISC_DONE") == FALSE) && (GetGlobalBoolean("kas_ChuundarDead") == TRUE));
	
	if (nState)
		{
			SetGlobalBoolean("DAN_CRATISC_DONE", TRUE);
		}
	return nState;
}
