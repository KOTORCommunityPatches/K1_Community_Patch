//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by k_hmalare_dialog.dlg.
	
	This script is fired on the final entry node of the DLG for Bastila's messenger,
	the Twi'lek Malare. Since Bastila is freezing post-conversation, despite an
	attempt to prevent it by flushing her with an animation on the exit node, try
	by hijacking the vanilla script here in the entry just before the exit node.
	
	See also cp_mes_malexit2.
	
	Issue #508: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/508
	
	DP 2023-12-08																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	NoClicksFor(1.0);
	
	SetGlobalNumber("K_SWG_HELENA", 2);
	
	// Flush Bastila with an animation to prevent her freezing post-conversation.
	DelayCommand(0.4, AssignCommand(GetObjectByTag("Bastila", 0), ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL, 1.0, 0.1)));
}
