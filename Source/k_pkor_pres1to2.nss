//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kor35_lashowe.dlg / kor35_utharwynn.dlg / kor35_yuthuraban.dlg in
	korr_m35aa (Korriban Sith Academy).
	
	This is a starting conditional script that checks the player's prestige level
	is either 1 or 2. The vanilla script erroneously checked for a value between
	0 and 2, rendering certain minor dialogue nodes unavailable.
	
	Issue #421: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/421

	Salk 2021-10-22																*/
//////////////////////////////////////////////////////////////////////////////////

int StartingConditional() {
	
	int nGlobal = (GetGlobalNumber("KOR_SITH_PRESTIGE") > 0 && GetGlobalNumber("KOR_SITH_PRESTIGE") < 3);
	return nGlobal;
}
