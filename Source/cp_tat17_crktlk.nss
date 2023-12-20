//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tat17_10czerk_01.dlg in tat_m17ag (Tatooine Czerka Office).
	
	This is an added script to jump the party when talking to the Protocol Officer
	in the Czerka office. Ensures that the player is in the correct position for
	the added static camera on the Force Persuade line.
	
	Updated 2023-12-14 to streamline the jump setup.
	
	Updated 2023-12-20 to add in facing commands to prevent post-conversation
	freezing by both the protocol officer and the player. Also toggled the party
	member AI for the jump for good measure.
	
	Issue #265: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/265
	
	DP 2022-07-30 / DP 2023-12-14 / DP 2023-12-20								*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oCrk = GetObjectByTag("tat17_10czerk_01");
	location lPC = Location(Vector(3.09,5.42,1.44), 130.00);
	location lPM1 = Location(Vector(3.33,3.49,1.39), 110.00);
	location lPM2 = Location(Vector(4.90,4.72,1.39), 150.00);
	
	SetGlobalFadeOut();
	SetGlobalFadeIn(1.0, 0.5);
	
	NoClicksFor(1.0);
	
	CP_ToggleAI(oPM1);
	CP_ToggleAI(oPM2);
	DelayCommand(0.1, CP_PartyHerder(lPC, lPM1, lPM2));
	
	DelayCommand(0.3, CP_FaceNPC(oCrk, oPC));
	DelayCommand(0.3, CP_FaceNPC(oPC, oCrk));
}
