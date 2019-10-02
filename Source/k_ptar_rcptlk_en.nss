//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar09_rcptlk.utt in unk_m41ad (Lehon Temple Exterior).
	
	This is the trigger OnEnter that fires the first time you enter the Sith
	Base, prompting a challenge from the receptionist about why you are there.
	Has been edited to jump the party in a set position, since the vanilla
	script just left them where they spawned into the module, which was fairly
	sloppy. Should prevent pathing issues for the receptionist if she is allowed
	to leave.
	
	Issue #253: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/253
	
	DP 2019-10-02																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oEntering = GetEnteringObject();
	location lPC = Location(Vector(0.63,-14.5,0.0), 90.0);
	location lPM1 = Location(Vector(1.63,-17.0,0.0), 90.0);
	location lPM2 = Location(Vector(-0.37,-17.0,0.0), 90.0);
	
	if (GetIsPC(oEntering) && CP_HasNeverTriggered())
		{
			HoldWorldFadeInForDialog();
			
			NoClicksFor(2.0);
			
			CP_DLGSetup("Receptioni091");
			CP_DLGHerder(lPC, lPM1, lPM2);
			CP_DLGInit("Receptioni091");
		}
}
