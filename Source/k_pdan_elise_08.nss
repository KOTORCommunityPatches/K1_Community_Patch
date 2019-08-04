////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	k_pdan_elise_08
	
	Exeunt Elise and her droid.
	
	Fixed to make Elise walk away instead of running, matching her droid's pace.
	
	JC 2019-08-04                                                             */
////////////////////////////////////////////////////////////////////////////////
void main() {

ActionPauseConversation();
ActionMoveToObject(GetObjectByTag("dan14aa_wp_elise02", 0), FALSE, 1.0);
AssignCommand(GetObjectByTag("dan14_c8692", 0), ActionMoveToObject(GetObjectByTag("dan14aa_wp_elise02", 0), FALSE, 1.0));
ActionResumeConversation();

}