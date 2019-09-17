////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	cp_tar_n_cndwait
	
	Checks if you have NOT made Canderous wait yet.
	
	Issue #73: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/73
	
	JC 2019-02-27                                                             */
////////////////////////////////////////////////////////////////////////////////

int StartingConditional() {

	object oCand = GetObjectByTag("Canderous031", 0);
	
	if( GetLocalBoolean(oCand, 49) ) return FALSE;
	return TRUE;
}
