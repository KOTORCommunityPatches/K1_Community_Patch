////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	k_ptat18ac_enter
	
	Enter script for tat_m18ac.
	
	Fixes an issue with the Sand People	hostility state not being set correctly
	when the module loads.
	
	Issue #217: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/217
	
	Issue #21: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/21
	
	JC 2019-09-02                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_tat"

void main() {

	// Execute original script
	ExecuteScript("cp_m18ac_en", OBJECT_SELF, -1);
	
	// Sand People reputation fix
	CP_SandRepFix();
}
