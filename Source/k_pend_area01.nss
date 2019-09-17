////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	k_pend_area01
	
	OnEnter script for end_m01aa (Endar Spire Command Module).
	
	Fixes an issue with the fade in not actually fading in at the right time,
	making the player visible before the game is meant to start.
	
	2019-05-19 Updated to streamline code with vanilla include functions and
	correct the name of the parent module.
	
	Issue #48: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/48
	
	JC 2019-04-24                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_end"

void main() {
	
	if (GetIsPC(GetEnteringObject()))
		{
			if (HasNeverTriggered())
				{
					SetGlobalFadeOut();
					PlayMovie("01A");
					SetReturnStrref(FALSE, 32228, 0); //String 32228 is "Return To Hideout". Should technically be 38550, "Transit Disabled", instead.
					SetGlobalNumber("K_CURRENT_PLANET", 5);
					SpawnStartingEquipment();
					SetGlobalFadeOut();
					NoClicksFor(1.0);
					DelayCommand(0.1, SetGlobalFadeIn(0.9, 1.5));
					DelayCommand(0.1, AssignCommand(GetTrask(), ActionStartConversation(GetFirstPC(), "m01aa_c01", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
					SetMinOneHP(GetFirstPC(), TRUE);
				}
		}
}
