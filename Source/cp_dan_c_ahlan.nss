////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	cp_dan_c_ahlan

	Checks if the player spoke to Ahlan Matale about his son's disappearance.
	
	JC 2019-05-18                                                             */
////////////////////////////////////////////////////////////////////////////////
int StartingConditional() {

if( GetGlobalBoolean("DAN_AHLAN_DONE") ) return TRUE;
return FALSE;

}