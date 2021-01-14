//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tat17_08hk47_01.dlg in tat_m17ac (Tatooine Droid Shop).
	
	This is a party herding script that has been added to the opening nodes of
	stunt HK's conversation to jump the party into an organised position. There
	were a some facing issues going on, exacerbated when the party was scattered.
	Additionally, having the party in known positions allows for the changes if
	HK is chosen to become an active party member as soon as he is bought. Done
	in conjunction with various speaker/listener tag and camera angle changes.
	
	See also cp_tat17ac_jmpul.
	
	Issue #310: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/310
	
	DP 2021-01-14																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oStunt = GetObjectByTag("tat17_08hk47_01", 0);
	location lPC = Location(Vector(-1.65,5.36,1.39), 145.00);
	location lPM1 = Location(Vector(-1.51,3.20,1.39), 145.00);
	location lPM2 = Location(Vector(0.47,5.99,1.39), 145.00);
	
	SetGlobalFadeOut();
	SetGlobalFadeIn(1.25, 1.0);
	
	CP_PartyHerder(lPC, lPM1, lPM2, TRUE, FALSE);
	
	DelayCommand(0.25, AssignCommand(oPC, ActionDoCommand(SetFacingPoint(GetPosition(oStunt)))));
	DelayCommand(0.4, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_LISTEN, 1.0, 0.1)));
	DelayCommand(0.25, AssignCommand(oPM1, ActionDoCommand(SetFacingPoint(GetPosition(oStunt)))));
	DelayCommand(0.25, AssignCommand(oPM2, ActionDoCommand(SetFacingPoint(GetPosition(oStunt)))));
	DelayCommand(0.4, AssignCommand(oStunt, ActionDoCommand(SetFacingPoint(GetPosition(oPC)))));
}
