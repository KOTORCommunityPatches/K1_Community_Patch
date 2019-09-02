////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	k_ptat18aa_heart
	
	Heartbeat script for tat_m18aa.
	
	Fixes an issue with the Sand People hostility state not being set correctly
	after the player uses the rapid transit system.
	
	JC 2019-09-01                                                             */
////////////////////////////////////////////////////////////////////////////////
#include "cp_inc_tat"

void main() {

CP_SandRepFix();

// Execute the original heartbeat
ExecuteScript("cp_m18aa_h", OBJECT_SELF, -1);

}