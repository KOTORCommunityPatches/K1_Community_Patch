////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	k_ptat20aa_heart
	
	Heartbeat script for tat_m20aa.
	
	Fixes an issue with the Sand People hostility state not being set correctly
	after the player uses the rapid transit system.
	
	JC 2019-09-08                                                             */
////////////////////////////////////////////////////////////////////////////////
#include "cp_inc_tat"

void main() {

// Don't fire the heartbeat if we have talked to the guard about a peaceful
// solution so the Sand People aren't triggered hostile in the middle of the
// conversation with the Chieftain (after disguises are removed but before the
// job global is set)
if( GetJournalEntry("tat17ag_sandbounty") < 90 )
	CP_SandRepFix();

}