//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	This is one of a number of global starting conditional scripts for various
	background NPC ambient barks on Manaan. The vanilla scripts had some errors
	that meant that they would never return certain values, thus preventing some
	barks from being seen.
	
	See also k_pman_random03, k_pman_random04, k_pman_random05,	k_pman_random17,
	k_pman_random18, k_pman_random19, k_pman_random20.
	
	Issue #342: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/342
	
	2019-11-11																	*/
//////////////////////////////////////////////////////////////////////////////////

int StartingConditional() {
	
	int iResult = 0;

	iResult = (GetGlobalNumber("MAN_PLANET_PLOT") < 3 && (GetGlobalNumber("MAN_RANDOM") == 1 || GetGlobalNumber("MAN_RANDOM") == 2));
	
	if (iResult)
		SetGlobalNumber("MAN_RANDOM", d8());

	return iResult;
}
