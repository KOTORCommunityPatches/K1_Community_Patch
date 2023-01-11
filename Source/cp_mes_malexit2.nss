//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by k_hmalare_dialog.dlg.
	
	This script is fired on the exit node of the DLG for Bastila's messenger, the
	Twi'lek Malare.	It replaces the vanilla k_act_exitarea script. Since Malare
	was already given a command to start heading to the exit by the added script
	earlier in the conversation, she's now given a ClearAllActions after the DLG
	exits before issuing the full UT_ExitArea command. Additionally, Bastila is
	given a forced animation to ensure she isn't frozen post-DLG due to added
	listener tags.
	
	See also cp_mes_malexit1.
	
	Issue #508: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/508
	
	DP 2023-01-11																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void main() {	
	
	// Flush Bastila with an animation to prevent her freezing post-conversation.
	AssignCommand(GetObjectByTag("Bastila", 0), ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1));
	
	DelayCommand(0.4, ClearAllActions());
	
	DelayCommand(0.5, UT_ExitArea(FALSE));
}
