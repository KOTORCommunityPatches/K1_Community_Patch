//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by dan13_ahlan.dlg in danm13 (Dantooine Jedi Enclave).
	
	This script fires on the first node of the conversation directly after the
	post-Juhani conversation with the Council, Ahlan Matale's "I demand justice!"
	interjection. He was ending up floating in mid-air over the edge of the central
	circle in the Council chambers, so he was spawned in further back and made to
	walk towards his original position, but not so close to the edge. This element
	handles the walk and second location. The initial spawn-in is handled by his
	OnUserDefine script.
	
	See also k_pdan_alhan_d.
	
	Updated 2019-11-06 to correct who the SetCommandable was assigned to, add a
	fade-in to after the fade-out added under the party selection GUI to mask the
	DLG switch, and reposition the companions after Bastila has been forcibly added
	to the party.
	
	See also k_pdan_addbast.
	
	Issue #55: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/55
	
	DP 2019-04-28																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	location lAhlan = Location(Vector(95.209,42.27,4.445), 0.0);
	location lPM1 = Location(Vector(103.142,36.058,4.04), -47.0);
	location lPM2 = Location(Vector(101.164,34.08,4.04), -47.0);
	
	CP_PartyJump(oPM1, lPM1);
	CP_PartyJump(oPM2, lPM2);
	
	SetGlobalFadeIn(0.5, 0.5);
	
	SetCommandable(TRUE, OBJECT_SELF);
	ActionMoveToLocation(lAhlan);
}
