////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man26_nilko.dlg in manm26aa (Manaan Ahto West).
	
	This script fires when the party returns to Nilko after having agreed to
	investigate the mercenaries being hired. It jumps the party to minimise
	some of the usual party herding and facing issues.
	
	See also k_pman_init21.
	
	Issue #272: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/272
	
	DP 2021-12-07																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	location lPC = Location(Vector(-25.0,29.183,59.158), 180.0);
	location lPM1 = Location(Vector(-22.5,30.683,59.158), 180.0);
	location lPM2 = Location(Vector(-22.5,27.682,59.158), 180.0);
	
	SetGlobalFadeOut();
	
	NoClicksFor(1.5);
	
	SetPartyLeader(NPC_PLAYER);
	
	SetGlobalFadeIn(1.0, 0.5);
	
	CP_PartyHerder(lPC, lPM1, lPM2);
}
