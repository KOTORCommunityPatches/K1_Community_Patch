////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Originally created by JC for DP's mod "Handon's Enhanced Waistline".
	
	Original JC notes: EndDialogue script for Handon. Plays the wounded
	animation and sets the flag to true so it'll keep playing.
	
	This script an added EbdDialogue script for Handon to turn his injured
	idle animation back on after the player has finished talking to him.
	
	Issue #38: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/38
	
	DP 2019-02-19                                                             */
////////////////////////////////////////////////////////////////////////////////


void main() {

	AssignCommand(OBJECT_SELF, ActionPlayAnimation(28, 1.0, 6.0));
	SetLocalBoolean(OBJECT_SELF, 51, TRUE);

}
