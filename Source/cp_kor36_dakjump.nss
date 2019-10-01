////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kor36_dakvesser.dlg in korr_m36aa (Korriban Valley of Dark Lords).
	
	This is a replacement for the generic k_act_talktrue that fires on the first
	line of Dak's dialogue, since we want to jump the party into position if
	Juhani is present to avoid issues with her interjections.
	
	Issue #281: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/281
	
	DP 2019-10-01																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	location lPC = Location(Vector(70.545,140.583,1.413), 180.0);
	location lPM1 = Location(Vector(73.0,142.083,1.413), 180.0);
	location lPM2 = Location(Vector(73.0,139.083,1.413), 180.0);
	
	UT_SetTalkedToBooleanFlag(OBJECT_SELF);
	
	// Since there are no interjections except from Juhani,
	// only bother jumping the party if she is present
	
	if (IsNPCPartyMember(NPC_JUHANI))
	
		{
			SetGlobalFadeOut();
			SetGlobalFadeIn(0.5, 1.0);
			
			NoClicksFor(1.0);
			
			CP_PartyHerder(lPC, lPM1, lPM2);
			
			ActionDoCommand(SetFacing(DIRECTION_EAST));
		}
	
}
