//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tat18_14sandg_01.dlg in tat_m18ab (Tatooine Sand People Territory).
	
	This is the script that fires on the first node of the DLG for the Guard
	standing outside the Enclave once you are doing the vaporator quest for
	the Chieftain. It jumps the party into position, but the vanilla positions
	were terrible, resulting in all sorts of facing/orientation issues for HK
	as he switched between talking to the guard and the player. Edited to use
	a nicer formation and also add a fade-in to mask the jump.
	
	See also cp_tat18_grdfade.
	
	Issue #292: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/292
	
	DP 2019-10-06																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = CP_GetPartyMember(0);
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	location lPC = Location(Vector(153.5,28.0,92.2), 250.0);
	location lPM1 = Location(Vector(152.952,30.88,91.85), 250.0);
	location lPM2 = Location(Vector(155.771,29.854,91.9), 250.0);
	
	NoClicksFor(2.0);
	
	SetGlobalFadeOut();
	
	SetFacing(70.0);
	
	CP_DLGSetup("tat18_14sandg_01");
	CP_DLGHerder(lPC, lPM1, lPM2);
	
	SetGlobalFadeIn(0.7, 1.5);
}
