////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	k_ptat18ab_heart
	
	Heartbeat script for tat_m18ab.
	
	Fixes an issue with the Sand People hostility state not being set correctly
	after the player uses the rapid transit system.
	
	Issue #217: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/217
	
	Issue #21: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/21
	
	JC 2019-09-01                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_tat"

void main() {

	CP_SandRepFix();
}
