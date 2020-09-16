//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tat17_griff.dlg in tat_m17ag (Tatooine Czerka Office).
	
	This is an added script to jump the party when talking to Griff in the Czerka
	office after rescuing him from the Sand People enclave. Mission was prone to
	skating across the floor if she interjected at the same time as she was trying
	to walk towards the PC from across the room as part of the companion AI.
	
	See also k_ptat_greettalk.
	
	Issue #265: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/265
	
	DP 2019-11-04																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = CP_GetPartyMember(0);
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	location lPC = Location(Vector(-1.0,4.815,1.386), 180.0);
	location lPM1 = Location(Vector(0.3,3.315,1.386), 180.0);
	location lPM2 = Location(Vector(0.3,6.315,1.386), 180.0);
	
	SetGlobalFadeOut();
	SetGlobalFadeIn(0.5, 0.5);
	
	// Realign Griff in case the PC initiated the convo from off to one side
	SetFacing(DIRECTION_EAST);
	
	CP_PartyJump(oPC, lPC);
	CP_PartyJump(oPM1, lPM1);
	CP_PartyJump(oPM2, lPM2);
}
