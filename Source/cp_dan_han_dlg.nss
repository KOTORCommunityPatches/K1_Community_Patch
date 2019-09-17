////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Originally created by JC for DP's mod "Handon's Enhanced Waistline".
	
	Original JC notes: OnDialogue script for Handon. Sets his wounded animation
	flag to false and runs the default dialogue script.
	
	This script is an edit of Handon's OnDialogue script to switch off his
	injured idle animation while the player is talking to him.
	
	Issue #38: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/38
	
	DP 2019-02-19                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_debug"
#include "k_inc_switch"

void main() {

	SetLocalBoolean(OBJECT_SELF, 51, FALSE);

    ExecuteScript("k_ai_master", OBJECT_SELF, KOTOR_DEFAULT_EVENT_ON_DIALOGUE);
}
