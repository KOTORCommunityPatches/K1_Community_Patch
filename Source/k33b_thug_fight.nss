//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kor33_siththug1.dlg in korr_m33aa (Korriban Dreshdae).
	
	This script fires on the exit node of the hostile branch of the scene of the
	four Sith thugs up the hallway from the cantina in Dreshdae, once the player
	has spoken to the Academy door guard and found out they need to have a medallion
	in order to enter. Since their AI was turned off at the start of the scene, it
	now needs to be turned back on again before combat commences.
	
	See also k33b_thug_init.
	
	Issue #282: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/283
	
	DP 2021-12-11																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"
#include "k_inc_generic"

void CP_TurnHostile(object oNPC) {
	AssignCommand(oNPC, CP_DisableAI(FALSE));
	ChangeToStandardFaction(oNPC, STANDARD_FACTION_HOSTILE_1);
	DelayCommand(0.5, AssignCommand(oNPC, ClearAllActions()));
	DelayCommand(0.5, AssignCommand(oNPC, GN_DetermineCombatRound(OBJECT_INVALID)));
}

void main() {
	
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oLeader = GetObjectByTag("k33b_sththuglead", 0);
	object oThug01 = GetObjectByTag("k33b_siththug1", 0);
	object oThug02 = GetObjectByTag("k33b_siththug2", 0);
	object oThug03 = GetObjectByTag("k33b_siththug3", 0);
	
	CP_TurnHostile(oLeader);
	CP_TurnHostile(oThug01);
	CP_TurnHostile(oThug02);
	CP_TurnHostile(oThug03);
	
	DelayCommand(0.6, AssignCommand(oPM1, GN_DetermineCombatRound(OBJECT_INVALID)));
	DelayCommand(0.6, AssignCommand(oPM2, GN_DetermineCombatRound(OBJECT_INVALID)));
}
