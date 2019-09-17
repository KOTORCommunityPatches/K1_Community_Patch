////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	k_pdan_elise_07
	
	Exit Elise, when she's told her droid is dead.
	
	Fixed to make Elise run away in hysteria instead calmly walking away.
	
	Issue #153: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/153
	
	JC 2019-08-04                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {

	ActionPauseConversation();
	ActionMoveToObject(GetObjectByTag("dan14aa_wp_elise02", 0), TRUE, 1.0);
	ActionResumeConversation();
}
