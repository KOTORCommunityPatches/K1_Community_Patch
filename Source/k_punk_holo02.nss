////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk42_redcomp.dlg in unk_m42aa (Unknown World Elder's Settlement).
	
	This script is fired when the player interacts with the Rakatan computer in
	the Elder's compound. It pauses the conversation and spawns the hologram. It
	also attempts to have the party face the holo, but in practice this fails to
	work properly. Since the party can end up all over the place, the script has
	been altered to jump them into a more suitable arrangement and force them
	to face the holo. There are still occasional issues with the player and the
	holo not properly facing each other, but this is about as good as it will
	get.
	
	DP 2019-06-23                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oHoloWP = GetObjectByTag("holowp", 0);
	object oComp = GetObjectByTag("unk42_raksupercomp", 0);
	object oPM0 = GetPartyMemberByIndex(0);
	object oPM1 = GetPartyMemberByIndex(1);
	object oPM2 = GetPartyMemberByIndex(2);
	location lPM0 = Location(Vector(52.76,176.6,16.166), 0.0);
	location lPM1 = Location(Vector(54.5,173.6,16.166), 0.0);
	location lPM2 = Location(Vector(50.5,173.6,16.166), 0.0);
	
	SetGlobalFadeOut();
	ActionPauseConversation();
	
	CP_PartyJump(oPM0, lPM0);
	CP_PartyJump(oPM1, lPM1);
	CP_PartyJump(oPM2, lPM2);
	
	CreateObject(OBJECT_TYPE_CREATURE, "holo", GetLocation(oHoloWP), FALSE);
	
	DelayCommand(0.1, AssignCommand(GetObjectByTag("holo", 0), ClearAllActions()));
	DelayCommand(0.2, AssignCommand(GetObjectByTag("holo", 0), SetCommandable(TRUE, OBJECT_SELF)));
	DelayCommand(0.3, AssignCommand(GetObjectByTag("holo", 0), SetFacingPoint(Vector(52.76,173.5,18.0))));
	
	DelayCommand(0.1, AssignCommand(oPM0, ClearAllActions()));
	DelayCommand(0.2, AssignCommand(oPM0, SetFacingPoint(GetPosition(GetObjectByTag("holo", 0)))));
	DelayCommand(0.1, AssignCommand(oPM1, ClearAllActions()));
	DelayCommand(0.2, AssignCommand(oPM1, SetFacingPoint(GetPosition(GetObjectByTag("holo", 0)))));
	DelayCommand(0.2, AssignCommand(oPM2, ClearAllActions()));
	DelayCommand(0.1, AssignCommand(oPM2, SetFacingPoint(GetPosition(GetObjectByTag("holo", 0)))));
	
	ActionWait(0.5);
	DelayCommand(0.75,SetGlobalFadeIn(0.0,1.0));
	ActionResumeConversation();
}
