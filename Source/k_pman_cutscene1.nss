////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man28ad_cutscene.utt in manm28ab (Manaan Sea Floor).
	
	This script starts the cutscene of the survivor in a diving suit being
	eaten by a Firaxan shark. Edited to add in a more controlled fade-in,
	since changes to the DLG messed up the original one.
	
	DP 2019-05-16                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

int SetTrig() {
	
	int int1;
	
	if ((UT_GetPlotBooleanFlag(OBJECT_SELF, 0) == FALSE))
		{
			int1 = 1;
			UT_SetPlotBooleanFlag(OBJECT_SELF, 0, TRUE);
		}
	return int1;
}

void main() {
	
	object oEntering = GetEnteringObject();
	object oPC = GetFirstPC();
	location lPC = Location(Vector(149.0,44.3,6.1), 137.0);
	
	if ((IsObjectPartyMember(oEntering) && SetTrig()))
		{
			SetGlobalFadeOut();
			CP_PartyJump(oPC, lPC);
			CP_DLGInit("man28_sur2", "m28ab_c01", FALSE, 0.5, 1.5);
		}
}