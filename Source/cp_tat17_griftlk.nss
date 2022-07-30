//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tat17_griff.dlg in tat_m17ag (Tatooine Czerka Office).
	
	This is an added script to jump the party when talking to Griff in the Czerka
	office after rescuing him from the Sand People enclave. Mission was prone to
	skating across the floor if she interjected at the same time as she was trying
	to walk towards the PC from across the room as part of the companion AI.
	
	Updated 2022-07-30 to revise the starting angles of the party members and
	ensure that the player is the party leader.
	
	See also k_ptat_greettalk.
	
	Issue #265: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/265
	
	DP 2019-11-04 / DP 2022-07-30												*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	location lPC = Location(Vector(-1.00,4.82,1.39), 180.00);
	location lPM1 = Location(Vector(0.30,3.32,1.39), 150.00);
	location lPM2 = Location(Vector(0.30,6.32,1.39), 210.00);
	
	SetGlobalFadeOut();
	SetGlobalFadeIn(0.5, 0.5);
	
	SetPartyLeader(NPC_PLAYER);
	
	// Realign Griff in case the PC initiated the convo from off to one side
	SetFacing(DIRECTION_EAST);
	
	CP_PartyJump(oPC, lPC);
	CP_PartyJump(oPM1, lPM1);
	CP_PartyJump(oPM2, lPM2);
}
