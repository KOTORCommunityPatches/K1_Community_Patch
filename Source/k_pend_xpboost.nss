//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by end_levelup.dlg in end_m01aa (Endar Spire Command Module).
	
	This script fires on the first node of the DLG that pops up when trying to
	open the door at the back of the bridge before having levelled up for the
	first time. The original script jumped both the player and Trask to a
	waypoint that was a bit too close to the door, so they are now jumped to
	separate positions a bit further back on each side of the door for better
	framing, especially for the line where Trask explains how to level up.
	
	See also k_pend_door15.
	
	Issue #490: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/490
	
	DP 2021-12-04																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oTrask = GetObjectByTag("end_trask");
	location lPC = Location(Vector(37.96,138.26,0.00), -57.54);
	location lTrask = Location(Vector(40.61,138.26,0.00), 241.83);
	
	NoClicksFor(2.0);
	
	if (GetXP(oPC) < 1000 && GetHitDice(oPC) <= 1)
		{
			SetXP(oPC, 1000);
		}
	
	SetGlobalFadeIn(0.5, 1.0);
	
	CP_PartyJump(oPC, lPC);
	CP_PartyJump(oTrask, lTrask);
	
	// Prevent player freezing post-conversation.
	DelayCommand(0.5, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1)));
	DelayCommand(0.5, AssignCommand(oTrask, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1)));
}
