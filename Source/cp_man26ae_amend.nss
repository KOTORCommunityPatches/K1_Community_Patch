////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man26_selambush.dlg in manm26ae (Manaan East Central).
	
	This script fires near the end of the player's post-Hrakert Rift arrest by
	Selkath authorities outside the Republic Embassy. Replaces the original script,
	k_pman_post08, due to potential filename clashes. The original script simply
	had the player walk towards the camera, but the fade-out happened too quickly
	so it all happened with a black screen. Now the whole party and the Selkath
	are walked out as the scene fades out.
	
	See also cp_man26ae_am01, cp_man26ae_am02, k_pman_post05.
	
	Issue #137: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/137
	
	DP 2023-12-21																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
 	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oSel = GetObjectByTag("man26_cutsel01", 0);
	object oWP = GetWaypointByTag("cut_player02");
	location lPCEnd = Location(Vector(48.02,52.79,57.50), -90.00);
	location lPMEnd = Location(Vector(46.78,52.94,57.50), 240.00);
	
	ActionPauseConversation();
	
	SetGlobalFadeOut(3.8, 1.0);
	
	NoClicksFor(5.0);
	
	DelayCommand(0.75, CP_PartyMove(oPC, lPCEnd));
	DelayCommand(1.5, CP_PartyMove(oPM1, lPMEnd));
	DelayCommand(2.0, CP_PartyMove(oPM2, lPMEnd));
	DelayCommand(3.7, CP_PartyMoveObject(oSel, oWP));
	
	DelayCommand(4.9, CP_DLGLock(oPC, FALSE));
	
	DelayCommand(5.0, ActionResumeConversation());
}
