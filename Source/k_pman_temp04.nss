//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man26_selarrest.dlg in manm26ab (Manaan Ahto East).
	
	This script fires on the opening node of the arrest cutscene outside the
	Sith base. Additions have been made to herd the party and face the Selkath
	towards the player under the fade-in.
	
	Issue #139: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/139
	
	DP 2021-01-17																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oSelk = GetObjectByTag("man26_selcut03", 0);
	location lPC = Location(Vector(43.68,11.46,57.50), 249.18);
	location lPM1 = Location(Vector(46.01,12.86,57.50), 249.18);
	location lPM2 = Location(Vector(42.76,14.13,57.50), 249.18);
	
	AssignCommand(oSelk, SetFacing(71.90));
	
	CP_PartyHerder(lPC, lPM1, lPM2, TRUE, FALSE);
	
	SetGlobalBoolean("MAN_TEMP2", TRUE);
}
