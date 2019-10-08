//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk42_redelder.dlg in unk_m42aa (Unknown World Elder's Settlement).
	
	This script is one of two that can fire on alternative opening nodes the first
	time the player enters the Elder's compound. This one is for the branch when
	the player visits The One's settlement first. It walks the player towards the
	council in a wide shot. It has been tweaked to walk the entire party to fixed
	positions.
	
	See also k_punk_blckhost, k_punk_eldspk.
	
	Issue #169: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/169
	
	DP 2019-10-09																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = CP_GetPartyMember(0);
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	location lPC = Location(Vector(52.875,36.5,16.165), 90.0);
	location lPM1 = Location(Vector(54.5,34.0,16.165), 90.0);
	location lPM2 = Location(Vector(51.25,34.0,16.165), 90.0);
	
	ActionPauseConversation();
	
	CP_PartyMove(oPC, lPC);
	DelayCommand(0.8, CP_PartyMove(oPM1, lPM1));
	DelayCommand(0.8, CP_PartyMove(oPM2, lPM2));
	
	DelayCommand(1.7, ActionResumeConversation());
}
