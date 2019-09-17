////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Originally created by JC for DP's mod "Handon's Enhanced Waistline".
	
	Original JC notes: OnHeartbeat script for Handon. Plays wounded animations
	if the flag for that is set to true (and if he's not in combat or moving,
	in case those crop up).
	
	This script is an added OnHeartbeat script for Handon to make sure his
	injured idle animation plays whenever it has been flagged to be on.
	
	Issue #38: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/38
	
	DP 2019-02-19                                                             */
////////////////////////////////////////////////////////////////////////////////



void main() {

	if( GetLocalBoolean(OBJECT_SELF, 51) && !GetIsInCombat(OBJECT_SELF) && GetCurrentAction(OBJECT_SELF) != ACTION_MOVETOPOINT  ){
	
		AssignCommand(OBJECT_SELF, ActionPlayAnimation(28, 1.0, 6.0));

	}
}
