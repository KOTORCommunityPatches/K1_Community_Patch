//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by end_carth001.dlg in end_m01ab (Endar Spire Starboard Section).
	
	This is the script that fires on the node when the player finally meets face-
	to-face with Carth on the Endar Spire. A facing command has been added to
	make sure Carth turns towards the player when they open the door.
	
	Issue #490: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/490
	
	DP 2023-11-15																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	int nGlobal = GetGlobalNumber("END_CARTH_DLG");
	
	SetGlobalNumber("END_CARTH_DLG", (nGlobal + 1));
	
	ActionPauseConversation();
	
	ActionDoCommand(SetFacingPoint(GetPosition(GetFirstPC())));
	
	ActionWait(1.5);
	
	ActionResumeConversation();
	
	DelayCommand(1.0, SetDialogPlaceableCamera(6));
}
