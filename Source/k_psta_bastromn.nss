////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	From Bastila Romance Scriptfix by Markus Ramikin.
	
	Part of a series of fixes to prevent the Bastila romance from breaking.
	
	2019-03-18                                                                */
////////////////////////////////////////////////////////////////////////////////

int StartingConditional() {
	int int1 = ((GetGlobalNumber("K_SWG_BASTILA") < 12) || (GetGlobalNumber("K_SWG_BASTILA") > 13) || (GetGender(GetPCSpeaker()) == 1));
	return int1;
}