////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man28ad_cutscene.utt in manm28ab (Manaan Sea Floor).
	
	This script starts the cutscene of the survivor in a diving suit being
	eaten by a Firaxan shark. Edited to add in a more controlled fade-in,
	since changes to the DLG messed up the original one.
	
	See also cp_m28ab_cut001w, cp_m28ab_cut002w, cp_m28ab_cut003w, cp_m28ab_cut004w,
	cp_m28ab_cut005w
	
	Issue #143: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/143
	
	DP 2019-05-16                                                             */
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
	
	object oEntering = GetEnteringObject();
	object oPC = GetFirstPC();
	location lPC = Location(Vector(149.0,44.3,6.1), 137.0);
	
	if ((IsObjectPartyMember(oEntering) && PlotState()))
		{
			SetGlobalFadeOut();
			CP_PartyJump(oPC, lPC);
			CP_DLGInit("man28_sur2", "m28ab_c01", FALSE, 0.5, 1.5);
		}
}
