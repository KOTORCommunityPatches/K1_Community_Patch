//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tat20_guardtrig.utt in tat_m20aa (Tatooine Sand People Enclave).
	
	This is the OnEnter script for the trigger in the entrance of the Sand People
	Enclave that fires the first time the player enters. It triggers the scene
	with the guard recognising the player through their disguise. In conjunction
	with changing the size of the trigger itself so that it fires as soon as the
	party enters the module, the party is now jumped into a set starting position,
	to be walked in on the first node of the DLG.
	
	See also cp_tat20_enc1st, k_ptat_cheifguar, k_ptat_chiefjump, k_ptat_meetchief
	
	Issue #296: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/296
	
	DP 2019-10-06																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oEntering = GetEnteringObject();
	object oGuard = GetObjectByTag("tat20_09first_01", 0);
	location lPC = Location(Vector(-26.279,66.757,14.546), 0.0);
	location lPM1 = Location(Vector(-28.496,65.257,14.6), 0.0);
	location lPM2 = Location(Vector(-28.496,68.257,14.6), 0.0);
	
	if (GetIsPC(oEntering) && GetIsObjectValid(oGuard) && !GetIsEnemy(oGuard) && CP_HasNeverTriggered())
		{
			HoldWorldFadeInForDialog();
			
			NoClicksFor(2.0);
			
			CP_DLGSetup("tat20_09first_01");
			CP_DLGHerder(lPC, lPM1, lPM2);
			CP_DLGInit("tat20_09first_01");
		}
}
