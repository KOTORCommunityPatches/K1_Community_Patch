//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man27_shasa.dlg in manm27aa (Manaan Sith Base).
	
	This is an added script that fires when the player returns to Shasa and her
	fellow Selkath Sith apprentices with evidence of the Sith being evil. It jumps
	the party into positions that leave enough room for the Selkath to pathfind
	past when they exit in the LS resolution of the conversation.
	
	Updated 2023-12-19 to disable the party member AI to ensure they obey commands.
	
	See also k_pman_shasa04, k_pman_shasa10.
	
	Issue #141: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/141
	
	DP 2023-10-24 / DP 2023-12-19												*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"
 
 void main() {
 	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	location lPC = Location(Vector(234.13,32.49,0.00), 30.00);
	location lPM1 = Location(Vector(233.95,34.49,0.00), -40.00);
	location lPM2 = Location(Vector(232.31,33.35,0.00), -10.00);
	
	SetGlobalFadeOut();
	SetGlobalFadeIn(0.6, 1.0);
	
	NoClicksFor(2.0);
	
	CP_ToggleAI(oPM1);
	CP_ToggleAI(oPM2);
	
	DelayCommand(0.1, CP_PartyHerder(lPC, lPM1, lPM2));
}
