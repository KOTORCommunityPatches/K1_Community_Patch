////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	k_pman_locked03
	
	OnEnter script for manm26ac.
	
	Fixes an issue with Xor refusing to appear unless the rapid transit system
	was used. This fix is attached to every module adjacent to a spaceport, so
	when the player exits any spaceport the encounter will be set to begin when
	they return, via rapid transit or otherwise.
	
	See also cp_m26ac_en.
	
	Issue #29: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/29
	
	JC 2019-04-13                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {

	// Execute original script
	ExecuteScript("cp_m26ac_en", OBJECT_SELF, -1);
	
	// If the first Xor encounter is done, make him appear for the second one
	if( GetGlobalBoolean("K_MESS_JUHANI") == TRUE ) {
		if( GetGlobalNumber("K_XOR_AMBUSH") < 1 ) SetGlobalNumber("K_XOR_AMBUSH", 1);
		}
	
}
