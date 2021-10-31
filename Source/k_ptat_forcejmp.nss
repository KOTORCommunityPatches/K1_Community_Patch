//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tat18_vorndroid2.dlg in tat_m18ab (Tatooine Sand People Territory).
	
	This script jumps the party and the droid at the end of the running-to-Vorn
	sequence. The vanilla script used waypoints, but the positions have been
	tweaked for a nicer formation.
	
	See also k_ptat_droidrun.
	
	Issue #327: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/327
	
	DP 2021-10-31																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oDroid = GetObjectByTag("vornsdroid2", 0);
	location lJmpDroid = Location(Vector(134.30,298.86,85.19), 157.50);
	location lJmpPC = Location(Vector(138.75,301.13,85.32), 180.00);
	location lJmpPM1 = Location(Vector(141.50,298.63,85.80), 170.00);
	location lJmpPM2 = Location(Vector(141.50,303.63,85.45), 190.00);
	
	CP_PartyHerder(lJmpPC, lJmpPM1, lJmpPM2);
	
	CP_PartyJump(oDroid, lJmpDroid);
}
