////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	cp_man_n_jolmess
	
	Checks if the player has NOT encountered Davin, Jolee's messenger for the
	Sunry side quest.
	
	JC 2019-05-19                                                             */
////////////////////////////////////////////////////////////////////////////////

int StartingConditional() {

	if( !GetGlobalBoolean("K_MESS_JOLEE") ) return TRUE;
	return FALSE;
}
