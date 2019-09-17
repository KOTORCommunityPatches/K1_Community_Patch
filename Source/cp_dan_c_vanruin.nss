////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	cp_dan_c_vanruin

	Returns TRUE if the player has spoken to Vandar about investigating the
	ruins.	
	
	JC 2019-04-29                                                             */
////////////////////////////////////////////////////////////////////////////////

int StartingConditional() {

	object oVandar = GetObjectByTag("dan13_vandar", 0);
	
	if( GetLocalBoolean(oVandar, 49) ) return TRUE;
	return FALSE;
}
