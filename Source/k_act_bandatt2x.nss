////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man_k_h_bandon.dlg in manm28aa (Manaan Hrakert Station).

	This script fires at the end of Bandon's conversation, turning him hostile.
	It is also intended to turn his mooks hostile as well. In the vanilla game
	they were already set to hostile by default, but this was changed for K1CP.
	That exposed an error in the vanilla script, which used incorrect tags and
	thus failed to turn one of the mooks hostile. 

	Issue #224: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/224

	DP 2019-09-08                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_generic"

void main() {
	
	int nMook = 0;
	object oLackeyA = GetObjectByTag("g_darkjedi02", nMook);
	object oLackeyB = GetObjectByTag("g_darkjedi02", nMook);
	
	while ((GetIsObjectValid(oLackeyA) || GetIsObjectValid(oLackeyB)))
		{
			if (GetIsObjectValid(oLackeyA))
				{
					ChangeToStandardFaction(oLackeyA, STANDARD_FACTION_HOSTILE_1);
					DelayCommand(0.5, AssignCommand(oLackeyA, ClearAllActions()));
					DelayCommand(0.5, AssignCommand(oLackeyA, GN_DetermineCombatRound(OBJECT_INVALID)));
				}
			if (GetIsObjectValid(oLackeyB))
				{
					ChangeToStandardFaction(oLackeyB, STANDARD_FACTION_HOSTILE_1);
					DelayCommand(0.5, AssignCommand(oLackeyB, ClearAllActions()));
					DelayCommand(0.5, AssignCommand(oLackeyB, GN_DetermineCombatRound(OBJECT_INVALID)));
				}
			(nMook++);
			
			oLackeyA = GetObjectByTag("g_darkjedi02", nMook);
			oLackeyB = GetObjectByTag("g_darkjedi02", nMook);
		}
	
	ChangeToStandardFaction(GetObjectByTag("g_bandon", 0), STANDARD_FACTION_HOSTILE_1);
	
	DelayCommand(0.5, ClearAllActions());
	DelayCommand(0.5, GN_DetermineCombatRound(OBJECT_INVALID));
}
