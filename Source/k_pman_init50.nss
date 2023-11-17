////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Trigger OnEnter for man26a_inittr001.utt in manm26aa (Manaan Ahto West).
	
	This is the OnEnter that triggers the cutscene of the Republic vs Sith trial
	in the courtroom. It has been edited to jump the party into position just out
	of shot, since otherwise they can be scattered back in the hallway.
	
	Issue #136: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/136
	
	DP 2023-11-17																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
 	
	object oEntering = GetEnteringObject();
 	object oRepDip = GetObjectByTag("man26_repac", 0);
	location lPC = Location(Vector(55.52,-4.25,59.16), 0.00);
	location lPM1 = Location(Vector(54.31,-3.25,59.16), 0.00);
	location lPM2 = Location(Vector(54.31,-5.25,59.16), 0.00);
 	
	if (!GetIsConversationActive())
		{
			if (GetIsPC(oEntering) && GetGlobalNumber("MAN_PLANET_PLOT") < 3 && !UT_GetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_10))
				{
					SetGlobalFadeOut();
					DelayCommand(1.0, SetGlobalFadeIn(0.5, 0.5));
					
					UT_SetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_10, TRUE);
					
					NoClicksFor(1.5);
					
					SetPartyLeader(NPC_PLAYER);
					
					CP_PartyHerder(lPC, lPM1, lPM2);
					
					DelayCommand(1.0, AssignCommand(oRepDip, ActionStartConversation(GetFirstPC(), "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
				}
		}
}
