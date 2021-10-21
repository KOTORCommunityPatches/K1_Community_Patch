////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Module OnEnter script for kas_m22ab (Kashyyyk Great Walkway).
	
	Fixes an issue with Xor refusing to appear unless the rapid transit system
	was used. This fix is attached to every module adjacent to a spaceport, so
	when the player exits any spaceport the encounter will be set to begin when
	they return, via rapid transit or otherwise.
	
	2021-10-21 Updated to add an additional provision to prevent an erroneous
	duplicate encounter happening when fast travelling back to the Hawk after
	having already dealt with Xor's ambush.
	
	Issue #29: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/29
	
	Issue #468: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/468
	
	JC 2019-04-13 / DP 2021-10-21                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {

	// If the first Xor encounter is done, make him appear for the second one
	if (GetGlobalBoolean("K_MESS_JUHANI") == TRUE)
		{
			if (GetGlobalNumber("K_XOR_AMBUSH") < 1)
				{
					SetGlobalNumber("K_XOR_AMBUSH", 1);
					// Prevent k_sup_gohawk duplicating the attack again the
					// next time the player fast travels to the Ebon Hawk.
					SetGlobalBoolean("K_XOR_AMBUSH_FIX", TRUE);
				}
		}
}
