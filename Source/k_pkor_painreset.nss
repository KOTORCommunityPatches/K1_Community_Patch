//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kor35_victim.dlg in korr_m35aa (Korriban Sith Academy).
	
	This script fires on the opening node of the interrogation scene with the Mando
	prisoner in the Korriban Sith Academy. It has been adjusted to walk the player
	forwards towards the console to prevent them air typing when using the serum
	controls.
	
	See also k35_init_torture, k35_plc_startvic, k35_tor_move, k35_vic_collapse,
	k35_vic_drugged, k35_vic_narc, k_pkor_destvictm, k_pkor_tort01.
	
	Issue #434: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/434
	
	DP 2023-08-20																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	location lPC = Location(Vector(185.13,94.25,6.15), 90.00);
	
	NoClicksFor(1.0);
	
	CP_PartyMove(oPC, lPC);
	
	SetGlobalNumber("KOR_THRESHOLD", 0);
}
