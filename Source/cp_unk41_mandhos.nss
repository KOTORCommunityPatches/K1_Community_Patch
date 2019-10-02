//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk41_ambush.dlg in unk_m41ad (Lehon Temple Exterior).
	
	This is an added script to a new entry appended to the DLG. It cuts to an
	aerial shot while the Mandos are turned hostile, since they have had their
	UTCs set to neutral, and run their AI. The result is them all activating their
	shields in unison rather than just randomly attacking while still inside the
	cutscene as they did in the vanilla version.
	
	See also k_punk_mand02, k_punk_mand03.
	
	Issue #286: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/286
	
	DP 2019-10-02																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_generic"

void main() {
	
	int nCount = 0;
	object oMando1 = GetObjectByTag("g_mandalor01", nCount);
	object oMando2 = GetObjectByTag("g_mandalor02", nCount);
	object oMando3 = GetObjectByTag("g_mandalor03", nCount);
	
	ActionPauseConversation();
	
	while (GetIsObjectValid(oMando1) || GetIsObjectValid(oMando2) || GetIsObjectValid(oMando3))
		{
			if (GetIsObjectValid(oMando1))
				{
					ChangeToStandardFaction(oMando1, STANDARD_FACTION_HOSTILE_1);
					DelayCommand(0.5, AssignCommand(oMando1, ClearAllActions()));
					DelayCommand(0.5, AssignCommand(oMando1, GN_DetermineCombatRound()));
				}
			
			if (GetIsObjectValid(oMando2))
				{
					ChangeToStandardFaction(oMando2, STANDARD_FACTION_HOSTILE_1);
					DelayCommand(0.5, AssignCommand(oMando2, ClearAllActions()));
					DelayCommand(0.5, AssignCommand(oMando2, GN_DetermineCombatRound()));
				}
			
			if (GetIsObjectValid(oMando3))
				{
					ChangeToStandardFaction(oMando3, STANDARD_FACTION_HOSTILE_1);
					DelayCommand(0.5, AssignCommand(oMando3, ClearAllActions()));
					DelayCommand(0.5, AssignCommand(oMando3, GN_DetermineCombatRound()));
				}
			
			(nCount++);
			
			oMando1 = GetObjectByTag("g_mandalor01", nCount);
			oMando2 = GetObjectByTag("g_mandalor02", nCount);
			oMando3 = GetObjectByTag("g_mandalor03", nCount);
		}
	
	
	DelayCommand(3.0, ActionResumeConversation());
}
