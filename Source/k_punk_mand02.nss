//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by ambtrig.utt in unk_m41ad (Lehon Temple Exterior).
	
	This is the trigger OnEnter that starts the Mandalorian ambush cutscene. The
	original was pretty flaky, since the subsequent scripts relied on walking the
	party from their existing positions on hitting the trigger. As a result, the
	non-player controlled members would typically flake out and do nothing due to
	pathing issues (it is a particularly poor area to stage such a cutscene). This
	revision now jumps the party into a clean starting position/formation to prevent
	the pathing getting fouled by the various scenery clutter.
	
	See also cp_unk41_mandhos, k_punk_mand03.
	
	Issue #286: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/286
	
	DP 2019-10-02																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oEntering = GetEnteringObject();
	object oRakGuide = GetObjectByTag("unk41_rakguide", 0);
	location lPC = Location(Vector(268.408,86.814,36.152), -30.0);
	location lPM1 = Location(Vector(265.729,86.294,35.985), -30.0);
	location lPM2 = Location(Vector(267.354,89.134,36.249), -30.0);
	
	if (GetIsPC(oEntering) && !GetIsInCombat(oEntering) && !GetIsObjectValid(oRakGuide) && CP_HasNeverTriggered())
		{
			SetGlobalFadeOut();
			
			NoClicksFor(2.0);
			
			CP_DLGSetup("invis3");
			CP_DLGHerder(lPC, lPM1, lPM2);
			CP_DLGInit("invis3", "unk41_ambush");
			
			DelayCommand(2.0, DestroyObject(OBJECT_SELF));
		}
}
