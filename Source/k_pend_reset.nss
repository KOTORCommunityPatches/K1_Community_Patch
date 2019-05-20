////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by k_pend_traskdl29 in end_m01aa (Endar Spire Command Module).
	
	This script is triggered when the party selection panel comes up when
	Trask joins the party. As well as setting the global, originally this
	script also had the new Party Trask initiate dialogue. Because the
	new Party Trask would spawn behind the player, delays were needed
	which necessitated moving those commands out from scripts owned by
	the - at this stage - now destroyed NPC Trask. See also k_pend_traskdl29
	and cp_end_trasksp_d.
	
	DP 2019-05-20                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oHelper = GetObjectByTag("cp_end_trasksp", 0);
	
	SetAreaUnescapable(TRUE);
	
	// Presumably TRASK_MUST_SWITCH
	SetGlobalNumber("END_TRASK_DLG", 7);
	
	SignalEvent(oHelper,EventUserDefined(50));
}