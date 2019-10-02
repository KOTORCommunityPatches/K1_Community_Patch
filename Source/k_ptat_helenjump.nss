//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by k_hhelena_dialog.dlg in tat_m17af (Tatooine Cantina).
	
	This script is fired on all of the opening nodes of Helena's conversation.
	The vanilla script jumped the party to waypoints, although it used the
	party indexes, not fixed positions for the player or Bastila. In conjunction
	with the way the speaker/listener tags in the DLG were set up, this resulted
	in Bastila twerking on every line, which was a bit disconcerting. Putting
	her in a fixed location with a good facing calms her down a bit.
	
	Issue #208: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/208
	
	DP 2019-10-03																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = CP_GetPartyMember(0);
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	location lPC = Location(Vector(-2.505,5.031,-0.182), 170.0);
	location lBast = Location(Vector(-1.772,2.901,-0.182), 132.5);
	location lPM2 = Location(Vector(-0.182,5.574,-0.182), 175.5);
	
	SetGlobalFadeOut();
	SetGlobalFadeIn(0.5, 1.5);
	
	CP_DLGSetup("Helena");
	
	CP_PartyJump(oPC, lPC);
	
	// Since the CP_GetPartyMember function always returns alphabetically, it will always
	// label Bastila as PM1 if she is in the party, so jump PM1 to Bastila's fixed location.
	CP_PartyJump(oPM1, lBast);
	
	// The remaining party member, if there is one, goes to the other spot.
	CP_PartyJump(oPM2, lPM2);
}
