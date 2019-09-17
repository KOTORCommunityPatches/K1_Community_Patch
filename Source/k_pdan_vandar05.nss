////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by dan13_vandar.dlg in danm13 (Dantooine Jedi Enclave).

	This script is fired when Vandar tells the party to return the Hawk while
	the Council discuss the Star Map. The vanilla script only moves the player,
	but now the entire party is moved. Additionally, the scene is extended so
	that there is time to actually see them before the fade-out.
	
	See also k_pdan_vandar03, k_pdan_vandar06, and k_pdan_vandar08.

	Issue #104: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/104

	DP 2019-08-02                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	location lPC = Location(Vector(91.5,54.5,5.0), 0.0);
	location lPM1 = Location(Vector(90.0,52.5,5.0), 0.0);
	location lPM2 = Location(Vector(93.0,52.5,5.0), 0.0);
	
	ActionPauseConversation();
	
	CP_PartyMove(oPC, lPC, TRUE);
	DelayCommand(1.5, CP_PartyMove(oPM1, lPM1, TRUE));
	DelayCommand(1.5, CP_PartyMove(oPM2, lPM2, TRUE));
	
	DelayCommand(1.5, SetDialogPlaceableCamera(7));
	
	SetGlobalFadeOut(3.0, 1.5);
	
	DelayCommand(4.5, ActionResumeConversation());
}
