//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by dan13_ahlan.dlg in danm13 (Dantooine Jedi Enclave).
	
	This script fires in the middle of the Matale interjection scene after Bastila
	has been added to the party. It tells Matale to walk out of the Council chambers.
	Unfortunately the waypoint he is commanded to go to is right in the doorway so
	he is potentially visible still standing there at the end of the conversation
	during one of the party member interjections. He is now commanded to walk to
	the module exit.
	
	Issue #55: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/55
	
	DP 2019-11-06																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oExit = GetObjectByTag("dan13_wp_exit", 0);
	
	ClearAllActions();
	ActionMoveToObject(oExit);
	
	// This OUD call seemingly fails, since it is telling Dorak to initiate a conversation while
	// the PC is already in the middle of another conversation. This may be rejigged to fire at
	// the end of the Matale DLG at some point in the future. See issue #324 for more info.
	SignalEvent(GetObjectByTag("dan13_dorak", 0), EventUserDefined(10));
}
