////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by dan26aa_init08.utt in manm26aa (Manaan Ahto West).
	
	This is a conversation trigger for Nilko Bwaas, although in the vanilla game
	it only results in a one line "come talk to me" kind of thing, requiring the
	player to manually re-initiate the conversation after that. Since there are
	the usual facing and positioning issues in the conversation proper, we are
	hijacking this trigger to skip right past that and start straight into the
	full conversation, allowing for a party jump under the fade-out.
	
	Issue #272: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/272
	
	DP 2019-10-01																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oEntering = GetEnteringObject();
	object oNilko = GetObjectByTag("man26_nilko");
	location lPC = Location(Vector(-25.0,29.183,59.158), 180.0);
	location lPM1 = Location(Vector(-22.5,30.683,59.158), 180.0);
	location lPM2 = Location(Vector(-22.5,27.682,59.158), 180.0);
	
	if (GetIsPC(oEntering) && CP_HasNeverTriggered())
		{
			// In order to skip the "I wish to speak to you" bit, set the Talked To
			// flag on Nilko first so he will jump straight into the main convo
			UT_SetTalkedToBooleanFlag(oNilko);
			
			SetGlobalFadeOut();
			
			NoClicksFor(1.5);
			
			CP_DLGSetup("man26_nilko");
			CP_DLGHerder(lPC, lPM1, lPM2);
			CP_DLGInit("man26_nilko");
		}
}
