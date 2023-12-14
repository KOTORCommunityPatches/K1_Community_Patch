//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tat17_10czerk_01.dlg in tat_m17ag (Tatooine Czerka Office).
	
	This is an added script to jump the party when talking to the Protocol Officer
	in the Czerka office. Ensures that the player is in the correct position for
	the added static camera on the Force Persuade line.
	
	Updated 2023-12-14 to streamline the jump setup.
	
	See also cp_tat17_crkmov.
	
	Issue #265: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/265
	
	DP 2022-07-30 / DP 2023-12-14												*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	location lPC = Location(Vector(3.09,5.42,1.44), 130.00);
	location lPM1 = Location(Vector(3.33,3.49,1.39), 110.00);
	location lPM2 = Location(Vector(4.90,4.72,1.39), 150.00);
	
	SetGlobalFadeOut();
	SetGlobalFadeIn(0.5, 0.5);
	
	NoClicksFor(1.0);
	
	// Realign the Officer in case the PC initiated the convo from off to one side
	SetFacing(-50.0);
	
	CP_PartyHerder(lPC, lPM1, lPM2);
}
