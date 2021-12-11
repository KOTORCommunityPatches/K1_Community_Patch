//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man_k_h_bandon.dlg in manm28aa (Manaan Hrakert Station).

	This script fires at the end of Bandon's conversation, turning him hostile.
	It is also intended to turn his mooks hostile as well. In the vanilla game
	they were already set to hostile by default, but this was changed for K1CP.
	That exposed an error in the vanilla script, which used incorrect tags and
	thus failed to turn one of the mooks hostile.
	
	Updated 2021-12-11 to add GN_DetermineCombatRound to the party members, so
	they don't just stand around watching. Additionally simplified the original
	method to turn the mooks hostile. Apparently past me hadn't properly grasped
	the nth concept.
	
	Issue #142: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/142

	DP 2019-09-08 / DP 2021-12-11												*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"
#include "k_inc_generic"

void CP_TurnHostile(object oNPC) {
	ChangeToStandardFaction(oNPC, STANDARD_FACTION_HOSTILE_1);
	DelayCommand(0.5, AssignCommand(oNPC, ClearAllActions()));
	DelayCommand(0.5, AssignCommand(oNPC, GN_DetermineCombatRound(OBJECT_INVALID)));
}

void main() {
	
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oBandon = GetObjectByTag("g_bandon", 0);
	object oLackeyA = GetObjectByTag("g_darkjedi02", 0);
	object oLackeyB = GetObjectByTag("g_darkjedi02", 1);
	
	CP_TurnHostile(oBandon);
	CP_TurnHostile(oLackeyA);
	CP_TurnHostile(oLackeyB);
	
	DelayCommand(0.6, AssignCommand(oPM1, GN_DetermineCombatRound(OBJECT_INVALID)));
	DelayCommand(0.6, AssignCommand(oPM2, GN_DetermineCombatRound(OBJECT_INVALID)));
}
