//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kas25_hurt_01.dlg in kas_m25aa (Kashyyyk Lower Shadowlands).
	
	This added script fires on the first node of Grrrwahrr's conversation branch
	that is initiated once the Mandos attacking him are defeated. It jumps the party
	into position now that Grrrwahrr has walked back to his spawn-in point.
	
	See also k_pkas_grrruser.
	
	Issue #486: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/486
	
	DP 2021-12-04																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	location lPC = Location(Vector(134.51,194.45,10.44), 148.54);
	location lPM1 = Location(Vector(137.19,194.57,10.44), 148.54);
	location lPM2 = Location(Vector(135.63,192.01,10.44), 148.54);
	
	NoClicksFor(3.0);
	
	SetPartyLeader(NPC_PLAYER);
	
	// Set Talked To flag since this script replaces k_act_talktrue.
	SetLocalBoolean(OBJECT_SELF, 10, TRUE);
	
	SetGlobalFadeIn(0.5, 1.5);
	
	CP_PartyHerder(lPC, lPM1, lPM2);
	
	DelayCommand(0.2, SetFacingPoint(GetPosition(oPC)));
	DelayCommand(0.3, ActionPlayAnimation(ANIMATION_LOOPING_TALK_INJURED, 1.0, 0.1));
	
	DelayCommand(1.5, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1)));
}
