//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnOpen for lev40_bdgdoor.utd in lev_m40ad (Leviathan Bridge).
	
	This is the OnOpen script for the door to the bridge, which triggers the
	cutscene of the final confrontation with Saul Karath. The original script
	had an invisible placeable initiate the scene with itself, which lead to
	characters looking at the floor, regardless of speaker/listener tags. This
	has been changed to having Saul initiate the scene with player, which (mostly)
	resolves the problem.
	
	See also cp_lev40_hdunlck, k_plev_saulcs0.
	
	Issue #332: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/332
	
	DP 2020-09-12																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oBast = GetObjectByTag("Bastila", 0);
	object oCarth = GetObjectByTag("Carth", 0);
	object oInvis = GetObjectByTag("lev40_talker", 0);
	object oSaul = GetObjectByTag("SaulKarath402", 0);
	
	if (CP_HasNeverTalkedTo())
		{
			if (GetIsObjectValid(oInvis)) // Ensures cutscene doesn't incorrectly refire after Saul is dead and some trooper mooks enter.
				{
					NoClicksFor(0.7);
					
					AssignCommand(oPC, ClearAllActions());
					AssignCommand(oBast, ClearAllActions());
					AssignCommand(oCarth, ClearAllActions());
					
					DelayCommand(0.5, AssignCommand(oSaul, ActionStartConversation(oPC, "lev40_saul402", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
				}
		}
}
