////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	This is an added global starting conditional that will check for the presence
	of the stated party member without the distance check that the vanilla party
	member starting conditionals do. Required for scenes where the party is herded
	in such a manner that puts the companions more than 10m away from the player.
	
	See also cp_con_pty_bast, cp_con_pty_cand, cp_con_pty_carth, cp_con_pty_hk47,
	cp_con_pty_jolee, cp_con_pty_juha, cp_con_pty_miss, cp_con_pty_zaal.
	
	Issue #711: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/711
	
	DP 2023-11-19																*/
//////////////////////////////////////////////////////////////////////////////////

int StartingConditional() {
	
	return IsNPCPartyMember(NPC_T3_M4);
}
