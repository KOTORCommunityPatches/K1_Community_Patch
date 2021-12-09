//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Starting condition dan13_vandar.dlg / dan13_vrook.dlg in danm13 (Dantooine
	Jedi Enclave).
	
	This is a replacement starting conditional for the player's lines asking both
	Vrook and Vandar what to do about the Mando raiders. Now that line is gated off
	once the raiders have been dealt with and Jon has been told.
	
	Issue #506: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/506
	
	DP 2021-12-09																*/
//////////////////////////////////////////////////////////////////////////////////

int StartingConditional() {

	int nMand = GetGlobalNumber("DAN_MAND_STATE");
	int nJon = GetGlobalNumber("DAN_JON_STATE");
	
	if (nMand > 0 && nMand < 6 && nJon < 3)
		{
			return TRUE;
		}
	
	return FALSE;
}
