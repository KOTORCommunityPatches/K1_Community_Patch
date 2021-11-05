//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk44_evilbast.dlg in unk_m44ac (Lehon Temple Summit).
	
	This is one of the scripts that fires at the end of the second conversation
	if the player chooses the Light Side and Bastila runs away. It commands Batila
	to run to the shuttle, and the player to chase after. Jolee and Juhani are now
	also given run commands.
	
	See also cp_unk44_jjfcbas, cp_unk44_pcfcbas, exitheart, k_punk_bast_ud2,
	k_punk_bastatt05, k_punk_bastesc, k_punk_bastjoin2.
	
	Issue #484: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/484
	
	DP 2021-11-05																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oJolee = GetObjectByTag("jolee", 0);
	object oJuhani = GetObjectByTag("juhani", 0);
	location lPC = Location(Vector(106.00,71.15,13.75), 0.00);
	location lJol = Location(Vector(103.00,72.65,13.75), -10.00);
	location lJuh = Location(Vector(103.00,69.65,13.75), 10.00);
	
	ActionPauseConversation();
	
	ActionMoveToLocation(GetLocation(GetObjectByTag("bast1", 0)), TRUE);
	
	DelayCommand(1.5, CP_PartyMove(GetFirstPC(), lPC, TRUE));
	DelayCommand(2.5, CP_PartyMove(oJolee, lJol, TRUE));
	DelayCommand(2.5, CP_PartyMove(oJuhani, lJuh, TRUE));
	
	ActionResumeConversation();
}
