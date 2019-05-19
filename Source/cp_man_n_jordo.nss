////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	cp_man_n_jordo
	
	Checks if the player has NOT encountered Jordo, Jolee's messenger for the
	Sunry side quest.
	
	JC 2019-05-19                                                             */
////////////////////////////////////////////////////////////////////////////////
int StartingConditional() {

if( !GetGlobalBoolean("K_MESS_JOLEE") ) return TRUE;
return FALSE;

}