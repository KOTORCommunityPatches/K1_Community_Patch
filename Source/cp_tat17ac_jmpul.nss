//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tat17_08yuka_01.dlg in tat_m17ac (Tatooine Droid Shop).
	
	This is a party herding script that has been added to the opening nodes of
	Yuka Laka's conversation to jump the party into an organised position. There
	were a host of facing issues going on, especially with the various party member
	interjections. These were exacerbated when the party was scattered. Done
	in conjunction with various speaker/listener tag and camera angle changes.
	
	See also cp_tat17ac_jmphk.
	
	Issue #310: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/310
	
	DP 2021-01-14																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oYuka = GetObjectByTag("tat17_08yuka_01", 0);
	location lPC = Location(Vector(3.74,3.65,1.39), 225.00);
	location lPM1 = Location(Vector(5.89,3.42,1.39), 225.00);
	location lPM2 = Location(Vector(3.49,5.85,1.39), 225.00);
	
	SetGlobalFadeOut();
	SetGlobalFadeIn(1.25, 1.0);
	
	// Since an instance of k_act_talktrue had to be replaced, add a check to
	// duplicate that functionality.
	if (!UT_GetTalkedToBooleanFlag(oYuka))
		{
			UT_SetTalkedToBooleanFlag(oYuka);
		}
	
	CP_PartyHerder(lPC, lPM1, lPM2, TRUE, FALSE);
	
	DelayCommand(0.25, AssignCommand(oPC, ActionDoCommand(SetFacingPoint(GetPosition(oYuka)))));
	DelayCommand(0.4, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_LISTEN, 1.0, 0.1)));
	DelayCommand(0.25, AssignCommand(oPM1, ActionDoCommand(SetFacingPoint(GetPosition(oYuka)))));
	DelayCommand(0.25, AssignCommand(oPM2, ActionDoCommand(SetFacingPoint(GetPosition(oYuka)))));
	DelayCommand(0.4, AssignCommand(oYuka, ActionDoCommand(SetFacingPoint(GetPosition(oPC)))));
}
