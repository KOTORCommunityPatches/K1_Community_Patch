//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tat17_maanatalk.utt in tat_m17aa (Tatooine Anchorhead).
	
	Conversation trigger for Maana, the Duros near the Czerka office that complains
	about Helena. The original could not be decompiled, but there didn't appear to
	be anything special going on looking at the bytecode. Reconstructed to jump
	the party into more favourable positions, since the conversation had the usual
	problems with facing.
	
	Updated 2019-11-03 to add in a check for Maana being present and revised the
	triggered boolean, since Bastila's quest may not have advanced sufficiently to
	spawn him before the player visits Tatooine the first time, potentially flagging
	the trigger and thus preventing it firing the conversation as intended on any
	subsequent visit.
	
	Issue #261: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/261
	
	DP 2019-10-01																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {

	object oEntering = GetEnteringObject();
	object oMaana = GetObjectByTag("tat17aa_bastplot", 0);
	location lPC = Location(Vector(123.682,117.075,3.75), 315.0);
	location lPM1 = Location(Vector(123.474,119.928,3.75), 315.0);
	location lPM2 = Location(Vector(120.873,117.504,3.75), 315.0);
	
	if (GetIsPC(oEntering) && GetIsObjectValid(oMaana) && !UT_GetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_01))
		{
			UT_SetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_01, TRUE);
			
			SetGlobalFadeOut();
			
			NoClicksFor(1.5);
			
			CP_DLGSetup("tat17aa_bastplot");
			CP_DLGHerder(lPC, lPM1, lPM2);
			CP_DLGInit("tat17aa_bastplot");
		}
}
