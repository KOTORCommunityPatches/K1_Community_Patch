//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	cp_inc_lev

	Include script for the Leviathan
																				*/
//////////////////////////////////////////////////////////////////////////////////


int CP_IsRomancingCarth();
int CP_IsHKTalkDone();

//////////////////////////////////////////////////////////////////////////////////
/*	CP_IsRomancingCarth()
	
	Checks if the Carth romance is active during the post-Leviathan scene.
	
	JC, Leilukin 2022-08-07														*/
//////////////////////////////////////////////////////////////////////////////////
int CP_IsRomancingCarth() {
	int nGlobal = GetGlobalNumber("K_SWG_CARTH");
	
	return nGlobal >= 13 && nGlobal <= 15;
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_IsHKTalkDone()
	
	Checks if the player is finished with HK's part of the post-Leviathan scene.
	Returns true if the player has talked to HK or if the player doesn't need to
	to talk to HK because he isn't in the party.
	
	JC 2022-08-07																*/
//////////////////////////////////////////////////////////////////////////////////
int CP_IsHKTalkDone() {
	return !IsAvailableCreature(NPC_HK_47) || GetGlobalBoolean("Ebo_HK47");
}
