////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by dan16_nurikinit.utt in danm16 (Dantooine Sandral Estate).
	
	This is the trigger that fires when you enter the foyer to speak to
	Nurik. Since the party is jumped straight into this conversation from
	a module transition, the vanilla positioning is extremely sloppy, with
	party members often ending up in front of the player. This can result
	in various facing issues during their interjections. The party is now
	jumped into set positions in conjunction with alterations to the DLG
	(dan16_nurik.dlg). Supersedes the former script that attempted to herd
	the party on the initial DLG node (cp_dan16_ptyherd).
	
	See also cp_dan16_nurik_d, cp_dan16_ptyface, cp_dan16_rom28, k_pdan_16_aread	.
	
	Issue #259: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/259
	
	DP 2019-09-30                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oEntering = GetEnteringObject();
	location lPC = Location(Vector(45.4,32.5,7.5), 90.0);
	location lPM1 = Location(Vector(46.9,30.6,7.5), 90.0);
	location lPM2 = Location(Vector(43.9,30.6,7.5), 90.0);
	
	if (IsObjectPartyMember(oEntering) && CP_HasNeverTriggered())
		{
			// Make sure we don't get a glimpse of the party for a split second
			// between spawning into the module and the trigger firing.
			HoldWorldFadeInForDialog();
			
			NoClicksFor(1.0);
			
			CP_DLGSetup("dan16_cutscene01");
			CP_DLGHerder(lPC, lPM1, lPM2);
			CP_DLGInit("dan16_cutscene01");
		}
}
