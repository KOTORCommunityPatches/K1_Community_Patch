//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnEnter for kas22_chorratrig.utt in kas_m22ab (Kashyyyk The Great Walkway).
	
	This is the trigger OnEnter that starts a conversation with Chorrawl after
	having agreed to side with Freyyr and returned from the Shadowlands. The
	original script didn't jump the party, leaving them in their usual scattered
	state. It also rendered the establishing static camera shot mostly pointless.
	Now the party is herded into a cleaner formation.
	
	See also k_pkas_backking.
	
	Issue #536: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/536
	
	DP 2021-12-06																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oEntering = GetEnteringObject();
	string sWook = "kas22_chorraw_02";
	location lPC = Location(Vector(212.43,72.76,10.30), 194.67);
	location lPM1 = Location(Vector(214.26,74.79,10.30), 194.67);
	location lPM2 = Location(Vector(215.02,71.89,10.30), 194.67);
	
	if (GetIsPC(oEntering) && GetGlobalBoolean("kas_HelpedFreyyr") && !UT_GetTalkedToBooleanFlag(OBJECT_SELF))
		{
			UT_SetTalkedToBooleanFlag(OBJECT_SELF, TRUE);
			
			CP_DLGSetup(sWook);
			CP_DLGHerder(lPC, lPM1, lPM2);
			CP_DLGInit(sWook, "", FALSE, 0.6, 1.5);
		}
}
