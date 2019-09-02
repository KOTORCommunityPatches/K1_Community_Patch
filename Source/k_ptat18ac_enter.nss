////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	k_ptat18ac_enter
	
	Enter script for tat_m18ab.
	
	Fixes an issue with the Sand People	hostility state not being set correctly
	when the module loads.
	
	JC 2019-09-02                                                             */
////////////////////////////////////////////////////////////////////////////////
#include "cp_inc_tat"

void main() {

// Execute original script
ExecuteScript("cp_m18ac_en", OBJECT_SELF, -1);
// Sand People reputation fix
CP_SandRepFix();

}