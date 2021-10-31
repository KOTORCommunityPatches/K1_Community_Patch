////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar04_igear.dlg in tar_m04aa (Taris Undercity).

	This is the party jump script that fires every time you talk to Igear in the
	Undercity village. It has been tweaked to position the party better and make
	sure Igear is facing the player properly when the conversation starts.
	
	See also cp_tar04_pcfcigr.
	
	Issue #482: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/482

	DP 2019-10-31                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	location lPC = Location(Vector(226.33,177.94,1.50), 56.25);
	location lPM1 = Location(Vector(223.30,177.00,1.50), 46.25);
	location lPM2 = Location(Vector(226.62,174.78,1.50), 66.25);
	
	UT_ActionPauseConversation(0.75);
	
	// Add an additional fade-out to account for non-triggered conversations.
	SetGlobalFadeOut();
	
	CP_PartyHerder(lPC, lPM1, lPM2);
	
	DelayCommand(0.5, SetFacingPoint(GetPosition(oPC)));
	
	// Force an animation to prevent the player freezing post-conversation in some circumstances.
	DelayCommand(0.6, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_LISTEN, 1.0, 1.0)));
	
	SetGlobalFadeIn(0.75, 1.5);
}
