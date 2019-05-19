////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by dan16_nurik.dlg on Entry 33
	
	This script is triggered at the start of the conversation in the foyer of
	the Sandral estate (danm16), where the player first meets Nurik and Rehasia.
	It's purpose is to herd the party, as by default they tend to be scattered
	all over the place, making for some messy interactions/camera angles.
	
	Updated 2019-05-02 to refactor using CP utility Include functions.
	
	DP 2019-02-06                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {

	location lPC = Location(Vector(45.4,32.5,7.5), 90.0);
	location lPM1 = Location(Vector(46.5,31.25,7.5), 90.0);
	location lPM2 = Location(Vector(44.3,31.25,7.5), 90.0);

	ActionPauseConversation();
	CP_DLGSetup("dan16_nurik");
	CP_DLGHerder(lPC, lPM1, lPM2, TRUE, FALSE);
	ActionResumeConversation();
}