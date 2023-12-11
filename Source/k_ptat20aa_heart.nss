//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Module OnHeartbeat script for tat_m20aa (Tatooine Sand People Enclave).
	
	Fixes an issue with the Sand People hostility state not being set correctly
	after the player uses the rapid transit system.
	
	Issue #217: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/217
	
	Issue #21: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/21
	
	JC 2019-09-29																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_tat"

void main() {

	// Don't fire the heartbeat if we have talked to the guard about a peaceful
	// solution so the Sand People aren't triggered hostile in the middle of the
	// conversation with the Chieftain (after disguises are removed but before the
	// job global is set)	
	if (GetJournalEntry("tat17ag_sandbounty") < 90)
		{
			CP_SandRepFix();
		}
}
