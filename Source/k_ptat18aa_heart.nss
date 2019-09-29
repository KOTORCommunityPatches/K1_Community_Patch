////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	k_ptat18aa_heart
	
	Heartbeat script for tat_m18aa.
	
	Fixes an issue with the Sand People hostility state not being set correctly
	after the player uses the rapid transit system.
	
	See also cp_m18aa_h.
	
	Issue #217: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/217
	
	Issue #21: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/21
	
	JC 2019-09-29                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_tat"

void main() {

	// Execute the original heartbeat
	ExecuteScript("cp_m18aa_h", OBJECT_SELF, -1);

	CP_SandRepFix();
	
}
