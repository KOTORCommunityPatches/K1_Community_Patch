////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	cp_m22ab_en
	
	OnEnter script for kas_m22ab.
	Fixes an issue with Xor refusing to appear unless the rapid transit system
	was used. This fix is attached to every module adjacent to a spaceport, so
	when the player exits any spaceport the encounter will be set to begin when
	they return, via rapid transit or otherwise.
	
	JC 2019-04-13                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {

// If the first Xor encounter is done, make him appear for the second one
if( GetGlobalBoolean("K_MESS_JUHANI") == TRUE ) {
	if( GetGlobalNumber("K_XOR_AMBUSH") < 1 ) SetGlobalNumber("K_XOR_AMBUSH", 1);
	}
	
}