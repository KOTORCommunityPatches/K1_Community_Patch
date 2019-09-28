////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar03_cand031.dlg in tar_m03ae (Taris Lower City Javyar's Cantina).

	This is an added party jump script for when re-initiating dialogue with
	Canderous after having previously told him you had things to do, or
	having previously spoken to him before stealing the codes from the Sith
	Base. Checks whether or not the initial triggered jump has happened
	or not to avoid having both fire at the same time.
	
	See also k_ptar_candtlk, k_ptar_spwcan_en.
	
	Issue #251: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/251

	DP 2019-09-28                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oTrigger = GetObjectByTag("tar02_candtlk", 0);
	object oCand = GetObjectByTag("Canderous031", 0);
	location lPC = Location(Vector(118.109,108.507,0.0), 254.0);
	location lPM1 = Location(Vector(119.937,109.899,0.0), 254.0);
	location lPM2 = Location(Vector(117.041,110.586,0.0), 254.0);
	location lCand_WP = Location(Vector(117.272,105.348,0.0), 73.0);
	location lCand_Jump = Location(Vector(114.166,99.621,0.0), 73.0);
	
	if (UT_GetTalkedToBooleanFlag(oTrigger))
		{
			NoClicksFor(2.0);
			
			SetGlobalFadeOut();
			SetGlobalFadeIn(0.75, 1.8);
			
			// Since Canderous absolutely refuses to respect any in-place facing commands, brute force
			// it by jumping him across the room and back under the fadeout. This is to account for the
			// player initiating subsequent conversations from behind him, which can otherwise leave him
			// facing backwards once the party is jumped. Additionally, force an animation to prevent him
			// being left frozen once the convo ends.
			CP_PartyJump(oCand, lCand_Jump);
			DelayCommand(0.25, CP_PartyJump(oCand, lCand_WP));
			DelayCommand(0.4, AssignCommand(oCand, ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL, 1.0, 3.0)));
			
			CP_DLGSetup("Canderous031");
			CP_DLGHerder(lPC, lPM1, lPM2);
		}
}
