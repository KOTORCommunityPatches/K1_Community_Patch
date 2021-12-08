//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar03_matrik031.dlg in tar_m03ad (Taris Lower City Apartments East).
	
	This script fires on the first nodes of the various branches of Matrik's DLG,
	jumping the party into place.
	
	See also k_ptar_mattalk.
	
	Issue #300: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/300
	
	DP 2021/12/08																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oMatrik = GetObjectByTag("Matrik031", 0);
	location lPC = Location(Vector(136.49,88.60,0.00), -45.00);
	location lPM1 = Location(Vector(133.76,89.06,0.00), -45.00);
	location lPM2 = Location(Vector(135.88,91.18,0.00), -45.00);
	
	SetGlobalFadeOut();
	SetGlobalFadeIn(0.75, 1.5);
	
	NoClicksFor(3.0);
	
	// Since this script replaces an instance of k_act_talktrue, set the Talked To flag.
	UT_SetTalkedToBooleanFlag(OBJECT_SELF);
	
	CP_PartyHerder(lPC, lPM1, lPM2);
	
	// Prevent player freezing at end of convo.
	DelayCommand(0.5, AssignCommand(oPC, ActionDoCommand(SetFacingPoint(GetPosition(oMatrik)))));
	DelayCommand(0.6, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_LISTEN, 1.0, 0.1)));
	
	// Make sure Matrik is facing the player if they manually initiated the conversation from one side.
	DelayCommand(0.5, AssignCommand(oMatrik, SetFacing(135.0)));
	DelayCommand(0.6, AssignCommand(oMatrik, ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL, 1.0, 0.1)));
}
