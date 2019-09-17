////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by kor35_victim.dlg in korr_m35aa (Sith Academy).
	
	Original script edit from The Comprehensive KOTOR Bug Fix Collection by blennus.
	
	This script is fired when administering a small dose of truth serum. It
	simply removes the call to play an animation in the vanilla script.
	
	2019-03-18                                                                */
////////////////////////////////////////////////////////////////////////////////

void main() {
	SetGlobalNumber("KOR_THRESHOLD", (GetGlobalNumber("KOR_THRESHOLD") + 2));
}
