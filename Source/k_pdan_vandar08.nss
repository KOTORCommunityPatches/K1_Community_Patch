////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by dan13_vandar.dlg in danm13 (Dantooine Jedi Enclave).

	This script is fired during the fade-out when Vandar tells the party to
	return the Hawk while the Council discuss the Star Map. The vanilla script
	was just a delay, but this version also pre-jumps the party into position
	to run back towards the Council and re-orients the Council. Additionally,
	Vandar is given a few commands to try and cure him looking in the wrong
	direction on the following node (only partially successful).
	
	See also k_pdan_vandar03, k_pdan_vandar05, and k_pdan_vandar06.

	Issue #104: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/104

	DP 2019-08-02                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oVandar = GetObjectByTag("dan13_vandar", 0);
	object oVrook = GetObjectByTag("dan13_vrook", 0);
	object oZhar = GetObjectByTag("dan13_zhar", 0);
	object oDorak = GetObjectByTag("dan13_dorak", 0);
	location lPCStart = Location(Vector(94.105,43.66,4.487), -47.0);
	location lPM1Start = Location(Vector(91.188,43.953,4.732), -47.0);
	location lPM2Start = Location(Vector(93.762,46.542,4.732), -47.0);
	location lPC = Location(Vector(103.204,34.028,4.08), -47.0);
	location lPM1 = Location(Vector(101.164,34.08,4.04), -47.0);
	location lPM2 = Location(Vector(103.142,36.058,4.04), -47.0);
	
	ActionPauseConversation();
	
	//Jump the party into position for the next shot
	CP_PartyHerder(lPCStart, lPM1Start, lPM2Start, TRUE, FALSE);
	
	//Make the Council members face the PC'S destination
	AssignCommand(oVandar, SetCommandable(TRUE, OBJECT_SELF));
	DelayCommand(0.1, AssignCommand(oVandar, SetFacingPoint(GetPositionFromLocation(lPC))));
	DelayCommand(0.2, AssignCommand(oVandar, ClearAllActions()));
	DelayCommand(0.3, AssignCommand(oVandar, PlayAnimation(ANIMATION_LOOPING_TALK_NORMAL, 1.0, -1.0)));
	AssignCommand(oVrook, SetCommandable(TRUE, OBJECT_SELF));
	DelayCommand(0.1, AssignCommand(oVrook, SetFacingPoint(GetPositionFromLocation(lPC))));
	AssignCommand(oZhar, SetCommandable(TRUE, OBJECT_SELF));
	DelayCommand(0.1, AssignCommand(oZhar, SetFacingPoint(GetPositionFromLocation(lPC))));
	AssignCommand(oDorak, SetCommandable(TRUE, OBJECT_SELF));
	DelayCommand(0.1, AssignCommand(oDorak, SetFacingPoint(GetPositionFromLocation(lPC))));
	
	//Make the party face their destinations
	DelayCommand(0.6, AssignCommand(oPC, SetFacingPoint(GetPositionFromLocation(lPC))));
	DelayCommand(0.6, AssignCommand(oPM1, SetFacingPoint(GetPositionFromLocation(lPM1))));
	DelayCommand(0.6, AssignCommand(oPM2, SetFacingPoint(GetPositionFromLocation(lPM2))));
	
	DelayCommand(1.0, ActionResumeConversation());
}
