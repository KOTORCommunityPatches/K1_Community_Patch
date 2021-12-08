//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar02_gurney021.dlg in tar_m02ac (Taris Upper City South).
	
	This script fires on the first node of the branch where Gurney accosts the
	player about the Rakghoul serum when leaving the clinic. It now jumps the
	party into position in order to reduce facing issues.
	
	Issue #494: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/494
	
	DP 2021/12/08																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oGurney = GetObjectByTag("gurney021", 0);
	location lPC = Location(Vector(187.47,69.09,0.00), 45.00);
	location lPM1 = Location(Vector(186.68,66.18,0.00), 45.00);
	location lPM2 = Location(Vector(184.56,68.30,0.00), 45.00);
	
	SetGlobalFadeOut();
	SetGlobalFadeIn(0.75, 1.5);
	
	NoClicksFor(3.0);
	
	SetPartyLeader(NPC_PLAYER);
	
	CP_PartyHerder(lPC, lPM1, lPM2);
	
	// Prevent player freezing at end of convo.
	DelayCommand(0.5, AssignCommand(oPC, ActionDoCommand(SetFacingPoint(GetPosition(oGurney)))));
	DelayCommand(0.6, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_LISTEN, 1.0, 0.1)));
	
	SetGlobalNumber("Tar_ZelkaTk", 3);
	SetGlobalBoolean("Tar_Gurney_Talk", TRUE);
}
