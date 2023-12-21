////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man26_selambush.dlg in manm26ae (Manaan East Central).
	
	This script fires on the first node of the player's post-Hrakert Rift arrest
	by Selkath authorities outside the Republic Embassy. Replaces the original
	script, k_pman_post02, due to potential filename clashes. The original script
	just had the player walk forwards to waypoint. Since the party has now been
	jumped under a fade-out, the door needs to be opened, followed by the whole
	party walking forwards. The timings have been tweaked to try and have the
	party and the lead Selkath meet in the middle rather than stopping and waiting.
	
	See also cp_man26ae_am01, cp_man26ae_amend, k_pman_post05.
	
	Issue #137: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/137
	
	DP 2023-12-21																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
 	
	object oPC = GetFirstPC();
	object oDoor = GetObjectByTag("man26ac_door31", 0);
	object oInvis = GetObjectByTag("man26ae_cut01");
	object oSel = GetObjectByTag("man26_cutsel01", 0);
	location lPC = Location(Vector(50.25,62.08,57.50), 180.00);
	location lPM1 = Location(Vector(52.18,60.82,57.50), 180.00);
	location lPM2 = Location(Vector(52.18,63.32,57.50), 180.00);
	
	ActionPauseConversation();
 	
	SetGlobalFadeIn(0.5, 0.5);
	
	NoClicksFor(4.0);
	
	SetLocked(oDoor, FALSE);
	DelayCommand(0.75, AssignCommand(oDoor, ActionOpenDoor(oDoor)));
	
	DelayCommand(2.0, CP_PartyHerder(lPC, lPM1, lPM2, FALSE, FALSE));
	
	DelayCommand(2.9, AssignCommand(oSel, ClearAllActions()));
	
	DelayCommand(3.0, ActionResumeConversation());
}
