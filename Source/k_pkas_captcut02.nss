//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kas22_xxjanos_02.dlg kas_m22aa (Kashyyyk Landing Pad).
	
	This is the script that fires at the start of the cutscene when entering the
	landing pad for the first time after having sided with Chuundar. It jumps the
	party over to Janos and commands the Wookiee slaves and Czerka guards to walk
	through a couple of shots. The vanilla implementation of the party jump always
	resulted in only the player being jumped, so this has been fixed. Additionally,
	the Wookiees and slaves have had some delays added to their commands to prevent
	them bumping into each other and their pathfinding freaking out.
	
	See also k_pkas22aa_enter.
	
	Issue #119: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/119
	
	DP 2021-11-15																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = GetPartyMemberByIndex(1);
	object oPM2 = GetPartyMemberByIndex(2);
	object oJanos = GetObjectByTag("kas22_xxjanos_02", 0);
	object oTrigger01 = GetNearestObjectByTag("kas22_capttrig", OBJECT_SELF, 1);
	object oTrigger02 = GetNearestObjectByTag("kas22_capttrig", OBJECT_SELF, 2);
	object oWP05 = GetObjectByTag("kas22_captwook5", 0);
	object oWP06 = GetObjectByTag("kas22_captwook6", 0);
	object oWP07 = GetObjectByTag("kas22_captwook7", 0);
	object oWP08 = GetObjectByTag("kas22_captwook8", 0);
	location lPC = Location(Vector(163.71,80.11,60.65), -11.25);
	location lPM1 = Location(Vector(162.08,79.15,60.65), -11.25);
	location lPM2 = Location(Vector(162.94,81.79,60.65), -11.25);
	
	CP_PartyHerder(lPC, lPM1, lPM2);
	
	object oWookiee01 = GetObjectByTag("kas22_wookcap_02", 0);
	object oWookiee02 = GetObjectByTag("kas22_wookcap_03", 0);
	object oGuard01 = GetObjectByTag("kas22_capczer_01", 0);
	object oGuard02 = GetObjectByTag("kas22_capczer_02", 0);
	
	SetGlobalFadeIn(0.0, 3.0);
	
	ActionPauseConversation();
	
	UT_SetTalkedToBooleanFlag(OBJECT_SELF, TRUE);
	
	AssignCommand(oWookiee01, ActionMoveToObject(oWP05));
	DelayCommand(0.5, AssignCommand(oWookiee02, ActionMoveToObject(oWP06)));
	
	// Give the Wookiees a head start and space the guards out a bit.
	DelayCommand(1.5, AssignCommand(oGuard01, ActionMoveToObject(oWP07)));
	DelayCommand(2.2, AssignCommand(oGuard02, ActionMoveToObject(oWP08)));
	
	DelayCommand(0.75, AssignCommand(oPC, SetFacingPoint(GetPosition(oJanos))));
	DelayCommand(1.0, AssignCommand(oPC, PlayAnimation(ANIMATION_FIREFORGET_GREETING)));
	DelayCommand(0.75, AssignCommand(oPM1, SetFacingPoint(GetPosition(oJanos))));
	DelayCommand(1.0, AssignCommand(oPM1, PlayAnimation(ANIMATION_FIREFORGET_GREETING)));
	DelayCommand(0.75, AssignCommand(oPM2, SetFacingPoint(GetPosition(oJanos))));
	DelayCommand(1.0, AssignCommand(oPM2, PlayAnimation(ANIMATION_FIREFORGET_GREETING)));
	
	DestroyObject(oTrigger01);
	DestroyObject(oTrigger02);
	
	ActionWait(3.0);
	ActionResumeConversation();
}
