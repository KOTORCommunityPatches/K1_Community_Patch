////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	k_pebo_carthromn
	
	Carth romance check for post-Leviathan scene.
	
	The conditions have been changed so the player will be forced to speak to
	HK-47 during this scene (if they have recruited him) so his storyline isn't
	left hanging.
	
	Returns true if the player has NOT romanced Carth and they've talked to HK.
	
	Issue #3: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/3
	
	JC 2019-02-02                                                             */
////////////////////////////////////////////////////////////////////////////////

int StartingConditional() {

	int nRomance;
	if( GetGlobalNumber("K_SWG_CARTH") == 13 ) nRomance = 0;
	else nRomance = 1;
	int nHKCheck = GetGlobalBoolean("Ebo_HK47");
	int nReturn;
	if( IsAvailableCreature(NPC_HK_47) ) nReturn = nRomance * nHKCheck;
	else nReturn = nRomance;

	return nReturn;
}
