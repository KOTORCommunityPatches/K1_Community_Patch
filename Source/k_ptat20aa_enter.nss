////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	k_ptat20aa_enter
	
	Enter script for tat_m20aa.
	
	Giff spawn fix by A Future Pilot. Fixes an issue with Griff not spawning.
	I bloody hate Griff.
	
	Sand People hostility fix by JC. Fixes an issue with the Sand People
	hostility state not being set correctly	after the player uses the rapid
	transit system or loads from a save while disguised.
	
	JC 2019-09-02                                                             */
////////////////////////////////////////////////////////////////////////////////
#include "cp_inc_tat"

void main() {

// Execute original script
ExecuteScript("cp_m20aa_en", OBJECT_SELF, -1);
// Griff fix
CP_SpawnGriff();
// Sand People reputation fix
CP_SandRepFix();

}