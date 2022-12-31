//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar04_sithpatrol.dlg in tar_m04aa (Taris Undercity).
	
	This script fires on the exit node of the scene with the Sith patrol in the
	Taris Undercity if they turn hostile. Edited to also give the party the
	GN_DetermineCombatRound command so they don't stand around doing nothing.
	Filename changed due to a clash with a script from a different module.
	
	See also k_ptar_sithmove, k_ptar_sithptl0.
	
	Issue #499: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/499
	
	DP 2022/12/31																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_generic"

void main() {
	
	object oPM1 = GetPartyMemberByIndex(1);
	object oPM2 = GetPartyMemberByIndex(2);
	object oMook1 = GetObjectByTag("tar04_sithtrooper0", 0);
	object oMook2 = GetObjectByTag("tar04_sithtrooper0", 1);
	
	ChangeToStandardFaction(oMook1, STANDARD_FACTION_HOSTILE_1);
	AssignCommand(oMook1, GN_DetermineCombatRound());
	
	ChangeToStandardFaction(oMook2, STANDARD_FACTION_HOSTILE_1);
	AssignCommand(oMook2, GN_DetermineCombatRound());
	
	ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE_1);
	GN_DetermineCombatRound();
	
	DelayCommand(0.1, AssignCommand(oPM1, GN_DetermineCombatRound()));
	DelayCommand(0.1, AssignCommand(oPM2, GN_DetermineCombatRound()));
}
