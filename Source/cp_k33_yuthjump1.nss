////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by kor33_yuthura.dlg in korr_m33aa (Korriban Dreshdae)
	
	This script is one of two that wrangles the party when talking to Yuthura
	in the Dreshdae cantina. This version fires on nodes that originally used
	k_act_talktrue, so that functionality is included.
	
	See also cp_k33_yuthjump2.
	
	Issue #160: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/160
	
	DP 2019-07-14                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oYuth = GetObjectByTag("kor33_yuthura");
	location lPC = Location(Vector(257.22,191.772,0.266), 60.0);
	location lPM1 = Location(Vector(255.556,190.253,0.266), 60.0);
	location lPM2 = Location(Vector(257.364,189.189,0.266), 60.0);

	CP_DLGSetup("kor33_yuthura");
	CP_DLGHerder(lPC, lPM1, lPM2);
	AssignCommand(oYuth, SetFacingPoint(GetPosition(oPC)));
	AssignCommand(oPC, SetFacingPoint(GetPosition(oYuth)));
	AssignCommand(oPM1, SetFacingPoint(GetPosition(oYuth)));
	AssignCommand(oPM2, SetFacingPoint(GetPosition(oYuth)));
	CP_DLGInit("kor33_yuthura");
	
	UT_SetTalkedToBooleanFlag(OBJECT_SELF);
}
