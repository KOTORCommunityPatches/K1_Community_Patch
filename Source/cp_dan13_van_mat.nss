//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Starting condition for R205 of dan13_vandar.dlg in danm13 (Dantooine Jedi Enclave).
	
	This is an added starting conditional for one of the reply nodes when asking
	Vandar questions. It gates off asking what to do about the Sandral/Matale feud
	once that quest is done. Or more specifically once Vandar has commented on
	the outcome.
	
	Issue #480: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/480
	
	DP 2021-10-26																*/
//////////////////////////////////////////////////////////////////////////////////

int StartingConditional() {
	
	if (GetGlobalBoolean("DAN_VANDARS_DONE"))
		{
			return FALSE;
		}
	
	return TRUE;
}
