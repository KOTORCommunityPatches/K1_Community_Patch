////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by dan14ad_cutscene.utt when entering danm14ad with Shen and Rahasia.
	
	This script triggers the final cutscene of the Sandral-Matale Feud quest
	in the courtyard of the Sandral estate. Because of the way the scene is
	set up, invariably one of the party members blocks half the screen in the
	opening shot. The player is also standing right in the middle of proceedings,
	which is awkward when pursuing the DS "slaughter everyone" route. A party
	herder element has been added in to make things a bit neater.
	
	Updated 2019-05-19 to refactor using CP Include functions.
	
	Issue #112: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/112
	
	DP 2019-02-19                                                             */
////////////////////////////////////////////////////////////////////////////////


#include "cp_inc_k1"

// Prototypes
int PlotState();

int PlotState() {
	
	int nState;
	
	if ((UT_GetPlotBooleanFlag(OBJECT_SELF, 0) == FALSE))
		{
			nState = TRUE;
			UT_SetPlotBooleanFlag(OBJECT_SELF, 0, TRUE);
		}

	return nState;
}

void main() {

	// Fire the cutscene if the party has left the Sandral estate with Shen and Rahasia in tow
	if (((GetIsPC(GetEnteringObject()) && GetGlobalBoolean("DAN_LEAVE_DONE")) && PlotState()))
		{
			
			object oPC = GetFirstPC();
			object oPM1 = CP_GetPartyMember(1);
			object oMP2 = CP_GetPartyMember(2);
			object oCut = GetObjectByTag("dan14_cutscene01", 0);
			location lPC = Location(Vector(333.0,151.0,56.164), 90.0);
			location lPM1 = Location(Vector(331.0,152.25,56.164), 90.0);
			location lPM2 = Location(Vector(331.0,153.5,56.164), 90.0);
			
			CP_PartyHerder(lPC, lPM1, lPM2, TRUE, FALSE);
			
			AssignCommand(oCut, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE));
	}
}
