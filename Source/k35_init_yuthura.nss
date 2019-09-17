////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by k35_init_yuthura.utt in korr_m35aa (Korriban Sith Academy)
	
	This script is fired by the trigger in front of Yuthura after the
	initial scene with Uthar on first entering the Academy. The vanilla
	function UT_NPC_InitConversation has been replaced with the more
	configurable CP Include party herding functions to forcibly position
	them in more desirable locations.
	
	Issue #162: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/162
	
	DP 2019-08-06                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

int GetFlag() {
	return UT_GetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_01);
}

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	//object oYuth = GetObjectByTag("kor35_yuthura");
	location lPC = Location(Vector(48.25,92.321,0.15), 180.0);
	location lPM1 = Location(Vector(51.0,90.821,0.15), 180.0);
	location lPM2 = Location(Vector(51.0,93.821,0.15), 180.0);
	
	if ((GetIsPC(GetEnteringObject()) && (GetFlag() == FALSE)))
		{
			UT_SetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_01, TRUE);
			
			CP_DLGSetup("kor35_yuthura");
			CP_DLGHerder(lPC, lPM1, lPM2);
			//AssignCommand(oPC, SetFacingPoint(GetPosition(oYuth)));
			//AssignCommand(oPM1, SetFacingPoint(GetPosition(oYuth)));
			//AssignCommand(oPM2, SetFacingPoint(GetPosition(oYuth)));
			CP_DLGInit("kor35_yuthura", "", FALSE, 0.5, 1.0);
		}
}
