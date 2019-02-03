////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	k33b_openacademy
	
	OnEnter script for korr_m33ab.
	Fixes an issue with Xor refusing to appear unless the rapid transit system
	was used. This fix is attached to every module adjacent to a spaceport, so
	when the player exits any spaceport the encounter will be set to begin when
	they return, via rapid transit or otherwise.
	
	JC 2019-02-02                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {

// Execute original script
ExecuteScript("cp_m33ab_en", OBJECT_SELF, -1);
// If the first Xor encounter is done, make him appear for the second one
if( GetGlobalBoolean("K_MESS_JUHANI") == TRUE ) {
	SetGlobalNumber("K_XOR_AMBUSH", 1);
	}
	
}